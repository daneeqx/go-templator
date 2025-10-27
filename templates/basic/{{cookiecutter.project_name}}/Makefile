.PHONY: help tools clean test

# custom aliases, for frequently/daily usage.
h: help

# help: show list of available commands.
help : Makefile
	@echo "+--------------------+"
	@echo "| AVAILABLE COMMANDS |"
	@echo "+--------------------+\n"
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

pre_commit: # pre_commit: install pre-commit hooks.
	pre-commit install -t pre-commit
	pre-commit install -t prepare-commit-msg

lint: # lint.
	@go tool golangci-lint run ./... 

lintfix: # lintfix.
	@go tool golangci-lint run ./... --fix

fmt: # format code.
	@go mod tidy
	@go tool gofumpt -l -w .
	@go tool goimports -l -w .

clean: # clean up temporary files.
	@rm -rf ./bin
	@rm -rf ./vendor

build: # build all binaries
	@go build -o bin/{{cookiecutter.domain}} cmd/{{cookiecutter.domain}}/main.go

test: # run tests
	@go test -v ./...

run: # run the application
	@go run cmd/{{cookiecutter.domain}}/main.go

{% if cookiecutter.include_worker == "y" %}build-worker: # build worker binary
	@go build -o bin/{{cookiecutter.domain}}-worker cmd/{{cookiecutter.domain}}-worker/main.go

run-worker: # run worker
	@go run cmd/{{cookiecutter.domain}}-worker/main.go
{% endif %}

{% if cookiecutter.include_migrator == "y" %}build-migrator: # build migrator binary
	@go build -o bin/{{cookiecutter.domain}}-migrator cmd/{{cookiecutter.domain}}-migrator/main.go

run-migrator: # run migrator
	@go run cmd/{{cookiecutter.domain}}-migrator/main.go
{% endif %}
