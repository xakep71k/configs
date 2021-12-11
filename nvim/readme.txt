#
#install:
#

# see https://github.com/mvdan/gofumpt
go install mvdan.cc/gofumpt@latest

# see https://github.com/nametake/golangci-lint-langserver
go get github.com/nametake/golangci-lint-langserver

# see https://golangci-lint.run/usage/install/
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.43.0
