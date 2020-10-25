GO ?= go
GOFMT ?= gofmt "-s"
GOFILES := $(shell find . -name "*.go")

.PHONY: commit
commit: fmt vet
	grc -a .

.PHONY: test
test:
	$(GO) test ./... -v

.PHONY: cover
cover:
	$(GO) test ./... -bench . -race -coverprofile=coverage.txt

.PHONY: fmt
fmt:
	$(GOFMT) -w $(GOFILES)

.PHONY: vet
vet:
	$(GO) vet $(shell $(GO) list ./...)