module {{cookiecutter.domain}}

go {{cookiecutter.go_version}}

tool (
	github.com/golangci/golangci-lint/cmd/golangci-lint
	golang.org/x/tools/cmd/goimports
	mvdan.cc/gofumpt
)

