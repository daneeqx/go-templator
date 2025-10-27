# Contributing

Thank you for considering contributing to {{cookiecutter.project_name}}!

## Development Setup

1. Fork the repository
2. Clone your fork locally
3. Install dependencies:
   ```bash
   make env
   go mod tidy
   ```
4. Install pre-commit hooks:
   ```bash
   make pre_commit
   ```
5. Create a new branch for your changes

## Coding Standards

- Follow [Go Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments)
- Use `gofumpt` for formatting (auto-applied by pre-commit)
- Run linter: `make lint`
- Fix issues: `make lintfix`
- Run tests: `make test`

## Submitting Changes

1. Ensure all tests pass
2. Ensure linter passes without warnings
3. Commit your changes following [Conventional Commits](https://www.conventionalcommits.org/)
4. Push to your fork
5. Create a Pull Request

## Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

## Questions?

Feel free to open an issue for any questions or concerns.

