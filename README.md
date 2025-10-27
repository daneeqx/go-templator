# 🏗️ Go Templator

A streamlined Go project generator powered by Cookiecutter and Docker, designed to quickly bootstrap production-ready Go microservices with best practices.

## ✨ Features

- 🚀 **Quick Start**: Generate a fully structured Go project in seconds
- 🐳 **Docker Integration**: No Python dependencies required, everything runs in Docker
- 🎯 **Production Ready**: Includes graceful shutdown, health checks, and proper application structure
- 🛠️ **Flexible**: Choose to include database migrator and background worker components
- 📦 **Modern Stack**: Pre-configured with Docker Compose, linting, and testing infrastructure
- 🔧 **Developer Experience**: Includes Makefile, CI/CD templates, and development tools

## 🚦 Quick Start

### Prerequisites

- Docker installed on your system
- Make utility (optional, for easier usage)

### Installation

```bash
git clone git@github.com:daneeqx/go-templator.git
cd go-templator
```

### Generate a Project

```bash
make gen
```

You'll be prompted to:
1. Enter the path where to generate your project (e.g., `../../my-new-service`)
2. Configure project parameters:
   - Project name
   - Domain/Git path
   - Project description
   - Go version
   - Include database migrator (y/n)
   - Include background worker (y/n)

### Example Usage

```bash
$ make gen
📁 Specify the path to generate the project, relative to the repo root:
../../my-services
🚀 Generating project in: /Users/user/projects/my-services

[1/6] project_name (example): user-service
[2/6] domain (example): user-service
[3/6] project_description (A Go microservice project): User Management Service
[4/6] go_version (1.24.1): 1.24.1
[5/6] Select include_migrator
   1 - y
   2 - n
   Choose from [1/2] (1): 1
[6/6] Select include_worker
   1 - y
   2 - n
   Choose from [1/2] (1): 1

✅ Project generated successfully!
```

## 📁 Generated Project Structure

```
my-service/
├── cmd/
│   ├── my-service/          # Main application
│   ├── my-service-migrator/  # Database migrations (optional)
│   └── my-service-worker/    # Background jobs (optional)
├── internal/
│   ├── entity/              # Domain entities
│   ├── repository/          # Data access layer
│   ├── mappers/             # Entity/DTO mappers
│   ├── schema/              # Database schemas
│   ├── gen-queries/         # Generated SQL queries
│   ├── server/
│   │   ├── app/             # Application setup
│   │   ├── handler/         # HTTP/gRPC handlers
│   │   └── service/         # Business logic
│   ├── migrator/            # Migration utilities (optional)
│   ├── worker/              # Worker logic (optional)
│   └── shared/              # Shared utilities
├── pkg/                     # Public packages
├── tests/
│   └── e2e/                 # End-to-end tests
├── .env.example             # Environment variables template
├── docker-compose.yml       # Docker Compose setup
├── Dockerfile               # Container image
├── Makefile                 # Build commands
├── go.mod                   # Go dependencies
└── README.md                # Project documentation
```

## 🎯 What's Included

### Application Features
- ✅ Graceful shutdown with context and timeout
- ✅ Health check endpoint
- ✅ Structured logging ready
- ✅ Context-based request handling

### Development Tools
- ✅ Makefile with common commands (build, test, lint, run)
- ✅ golangci-lint configuration
- ✅ Pre-commit hooks setup
- ✅ EditorConfig for consistent code style

### Infrastructure
- ✅ Docker Compose with PostgreSQL and Redis
- ✅ Multi-stage Dockerfile
- ✅ Environment variable configuration
- ✅ CHANGELOG and CONTRIBUTING guidelines

### Optional Components
- 🔧 **Migrator**: Database migration tool with up/down support
- ⚙️ **Worker**: Background job processor with graceful shutdown

## 🛠️ Common Commands

After generating your project:

```bash
# Navigate to your new project
cd path/to/your-project

# Install dependencies
go mod tidy

# Run linter
make lint

# Format code
make fmt

# Run tests
make test

# Build binary
make build

# Run application
make run

# Clean artifacts
make clean
```

## 🐳 How It Works

1. **Docker Build**: Creates a lightweight Alpine-based image with Cookiecutter installed
2. **Template Execution**: CookieCutter reads templates from `templates/basic/` directory
3. **Post-Generation**: Python hooks initialize Git repository and set executable permissions
4. **Project Generation**: Files are generated with variable substitution in the output directory

The whole process is containerized to avoid Python dependencies on your host machine.

## 🎨 Customization

### Adding New Templates

1. Create a new directory under `templates/`
2. Add a `cookiecutter.json` configuration file
3. Structure your template files with Jinja2 syntax
4. Add post-generation hooks in `hooks/` if needed

### Modifying Templates

All templates are in `templates/basic/{{cookiecutter.project_name}}/`. Edit the files to customize the generated structure.

## 🤝 Contributing

Contributions are welcome! Please read CONTRIBUTING.md for guidelines.

## 📝 License

MIT License - see LICENSE file for details.

## 🙋 Support

For issues, questions, or contributions:
- Open an issue on GitHub
- Create a pull request with improvements