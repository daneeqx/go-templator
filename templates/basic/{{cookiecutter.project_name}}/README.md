# {{cookiecutter.project_name}}

{{cookiecutter.project_description}}

## Table of Contents

- [Description](#description)
- [Requirements](#requirements)
- [Installation](#installation)
- [Environment Variables](#environment-variables)
- [Build and Run](#build-and-run)
- [Docker](#docker)
- [Migrations](#migrations)
- [Testing](#testing)
- [Project Structure](#project-structure)
- [Documentation](#documentation)
- [Contacts](#contacts)

## Description

{{cookiecutter.project_description}}

## Features

- Graceful shutdown support
- Structured logging
- Health checks
- Database migrations{% if cookiecutter.include_migrator == "y" %} (with migrator){% endif %}
- Background job processing{% if cookiecutter.include_worker == "y" %} (with worker){% endif %}

## Requirements

- Go {{cookiecutter.go_version}}+
- make
- Docker (optional)
- docker-compose (optional)

## Installation

```bash
# Clone repository
git clone <your-repo-url>
cd {{cookiecutter.domain}}

# Install dependencies
go mod tidy
make env
source ./scripts/export.sh
```

## Build and Run

To build the project:

```bash
make build
```

To run the service:

```bash
go run ./cmd/{{cookiecutter.domain}}/main.go
```

## Docker

To build and run with Docker Compose:

```bash
docker compose up -d
```

## Migrations

To run database migrations:

```bash
go run ./cmd/{{cookiecutter.project_name}}-migrator up
```

## Testing

To run tests:

```bash
make test
```

## Project Structure

```
cmd/                # Entry points (main)
internal/           # Internal packages
pkg/                # Public libraries
configs/            # Configuration files
scripts/            # Automation scripts
docs/               # Documentation
...
```

## Documentation

Comprehensive documentation is available in the `docs/` directory:

- **[Architecture](./docs/architecture.md)** - System architecture and design
- **[Deployment Guide](./docs/deployment.md)** - Deployment and operations
- **[API Documentation](./docs/api/)** - API specifications

For quick start, see the [Build and Run](#build-and-run) section above.
