# Architecture

## Overview

{{cookiecutter.project_description}}

## System Architecture

```
┌─────────────────┐
│   Client/API    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   HTTP/gRPC     │
│     Server      │
└────────┬────────┘
         │
    ┌────┴────┐
    ▼         ▼
┌────────┐ ┌────────┐
│Service │ │Service │
│  Layer │ │  Layer │
└───┬────┘ └───┬────┘
    │          │
    ▼          ▼
┌──────────────────┐
│  Repository      │
│     Layer        │
└────────┬─────────┘
         │
    ┌────┴────┐
    ▼         ▼
┌────────┐ ┌────────┐
│  PG     │ │ Redis  │
└────────┘ └────────┘
```

## Components

### Main Service
- **Location**: `cmd/{{cookiecutter.domain}}/`
- **Purpose**: Main HTTP/gRPC server
- **Responsibilities**: Request handling, routing, middleware

### Database Migration
{% if cookiecutter.include_migrator == "y" %}
- **Location**: `cmd/{{cookiecutter.domain}}-migrator/`
- **Purpose**: Database schema migrations
- **Format**: SQL files in `internal/schema/`
{% else %}
- Not included in this project
{% endif %}

### Background Worker
{% if cookiecutter.include_worker == "y" %}
- **Location**: `cmd/{{cookiecutter.domain}}-worker/`
- **Purpose**: Background job processing
- **Queue**: Redis (optional)
{% else %}
- Not included in this project
{% endif %}

## Directory Structure

```
cmd/                    # Application entry points
internal/
├── entity/             # Domain entities
├── repository/         # Data access layer
├── mappers/            # Entity/DTO mapping
├── schema/             # Database schemas
├── server/
│   ├── app/            # Application setup
│   ├── handler/        # HTTP/gRPC handlers
│   └── service/        # Business logic
├── shared/             # Shared utilities
├── gen-queries/        # Generated SQL queries
{% if cookiecutter.include_migrator == "y" %}├── migrator/          # Migration utilities{% endif %}
{% if cookiecutter.include_worker == "y" %}└── worker/            # Worker logic{% endif %}
pkg/                    # Public packages
tests/                  # Test files
docs/                   # Documentation
```

## Data Flow

1. **Request** → HTTP/gRPC Handler
2. **Handler** → Service Layer
3. **Service** → Repository Layer
4. **Repository** → Database/Cache
5. Response flows back through layers

## Technology Stack

- **Language**: Go {{cookiecutter.go_version}}
- **Database**: PostgreSQL
- **Cache**: Redis
- **Container**: Docker & Docker Compose
- **Build**: Makefile

## Environment Variables

See `.env.example` for all required environment variables.

