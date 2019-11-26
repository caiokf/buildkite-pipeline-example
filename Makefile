# Service
GO_MOD = $(shell head -n 1 go.mod|sed "s/^module //g")
MOD_NAME = $(shell basename $(GO_MOD))

# Highlight
HL = @printf "\033[36m>> $1\033[0m\n"

default: help

help:
	@echo "Usage: make <TARGET> [OPTS=opts]\n\nTargets:"
	@grep -E "^[\. a-zA-Z_-]+:.*?## .*$$" $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' |sort

clean: ## Clean all functions or function in F=<filepath>
	$(call HL,clean)
	F=$(F) scripts/clean.sh

build: ## Build all functions or function in F=<filepath>
	$(call HL,build)
	F=$(F) scripts/build.sh

fmt: ## Check code formatting
	$(call HL,check-fmt)
	F=$(F) scripts/check-fmt.sh `find . -name "*.go"`

lint: ## Run go lint
	$(call HL,lint)
	F=$(F) scripts/lint.sh `find . -name "*.go"`

test: ## Run unit tests with ARGS=<go_test_args>
	$(call HL,test)
	@go test -count=1 $(ARGS) `go list ./... | grep -v node_modules`
