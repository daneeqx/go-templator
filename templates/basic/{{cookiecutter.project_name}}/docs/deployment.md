# Deployment Guide

## Prerequisites

- Docker and Docker Compose installed
- Go {{cookiecutter.go_version}}+ (for local development)
- Make utility (optional)

## Local Development

### 1. Setup Environment

```bash
# Copy environment template
cp env.example .env

# Edit .env with your configuration
nano .env
```

### 2. Start Services

```bash
# Start all services (PostgreSQL, Redis, application)
docker compose up -d

# View logs
docker compose logs -f
```

### 3. Run Migrations

{% if cookiecutter.include_migrator == "y" %}```bash
# Run migrations
go run cmd/{{cookiecutter.domain}}-migrator/main.go
```{% else %}
```bash
# Migrations are handled manually
# Create migration files in internal/schema/
```{% endif %}

### 4. Start Application

```bash
# Option 1: Using Makefile
make run

# Option 2: Directly
go run cmd/{{cookiecutter.domain}}/main.go
```

## Docker Deployment

### Build Image

```bash
# Build production image
docker build -t {{cookiecutter.domain}}:latest .

# Or using Makefile
make docker-build
```

### Run Container

```bash
docker run -d \
  --name {{cookiecutter.domain}} \
  -p 8080:8080 \
  --env-file .env \
  {{cookiecutter.domain}}:latest
```

## Production Deployment

### Using Docker Compose

1. **Prepare production config**:
   ```bash
   # Set production environment
   export APP_ENV=production
   
   # Update docker-compose.yml with production settings
   ```

2. **Deploy**:
   ```bash
   docker compose -f docker-compose.prod.yml up -d
   ```

### Health Check

```bash
# Check service health
curl http://localhost:8080/health

# Expected response
{"status":"ok","timestamp":"..."}
```

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `APP_NAME` | Application name | {{cookiecutter.domain}} |
| `APP_ENV` | Environment (development/production) | development |
| `APP_PORT` | HTTP server port | 8080 |
| `DB_HOST` | Database host | localhost |
| `DB_PORT` | Database port | 5432 |
| `DB_USER` | Database user | postgres |
| `DB_PASSWORD` | Database password | - |
| `DB_NAME` | Database name | {{cookiecutter.domain}} |
| `REDIS_HOST` | Redis host | localhost |
| `REDIS_PORT` | Redis port | 6379 |

## Troubleshooting

### Database Connection Issues

```bash
# Check PostgreSQL logs
docker compose logs postgres

# Test connection
psql -h localhost -U postgres -d {{cookiecutter.domain}}
```

### Application Crashes

```bash
# Check application logs
docker compose logs {{cookiecutter.domain}}

# Restart service
docker compose restart {{cookiecutter.domain}}
```

### Port Conflicts

```bash
# Change ports in .env
APP_PORT=3000
DB_PORT=5433
REDIS_PORT=6380
```

## CI/CD

Example GitHub Actions workflow is included in `.github/workflows/ci.yml`.

For more information, see [CONTRIBUTING.md](../CONTRIBUTING.md).

