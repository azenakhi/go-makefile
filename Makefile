#
#  Makefile for Go
#  https://gist.github.com/turtlemonvh/38bd3d73e61769767c35931d8c70ccb4
#

GOARCH = amd64
BINARY = myapp

VERSION = 1.0
COMMIT = $(shell git rev-parse HEAD)
BRANCH = $(shell git rev-parse --abbrev-ref HEAD)
BUILDTIME = $(shell date +%Y.%m.%d.%H%M%S)

GO_CMD = go
GO_RUN = $(GO_CMD) run
GO_BUILD = $(GO_CMD) build
GO_INSTALL = $(GO_CMD) install
GO_CLEAN = $(GO_CMD) clean
TOP_PACKAGE_DIR = github.com/azenakhi/go-makefile

LDFLAGS = -ldflags "-X main.VERSION=${VERSION} -X main.COMMIT=${COMMIT} -X main.BRANCH=${BRANCH} -X main.BUILDTIME=${BUILDTIME}"

PACKAGE_LIST = model \
			   service

linux: 
		GOOS=linux GOARCH=${GOARCH} ${GO_BUILD} ${LDFLAGS} -o ${BINARY}-linux-${GOARCH} .

darwin: 
		GOOS=darwin GOARCH=${GOARCH} ${GO_BUILD} ${LDFLAGS} -o ${BINARY}-darwin-${GOARCH} .

windows: 
		GOOS=windows GOARCH=${GOARCH} ${GO_BUILD} ${LDFLAGS} -o ${BINARY}-windows-${GOARCH}.exe .


install: 
		@for pkg in $(PACKAGE_LIST); do \
				echo "==> Install $$pkg..."; \
				$(GO_INSTALL) ${TOP_PACKAGE_DIR}/$$pkg || exit 1; \
		done  
clean:
		@for pkg in $(PACKAGE_LIST); do \
			echo "==> Clean $$pkg ..."; \
			$(GO_CLEAN) $(TOP_PACKAGE_DIR)/$$pkg; \
		done

info:
		@echo "Build: $(BUILDTIME)"
		@echo "Commit: $(COMMIT)"
		@echo "Branch: $(BRANCH)"
		@echo "Version: $(VERSION)"

.PHONY:	linux darwin windows clean install info run

