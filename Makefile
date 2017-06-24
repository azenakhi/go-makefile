GO_CMD = go
GO_RUN = ${GO_CMD} run
GO_INSTALL = ${GO_CMD} install

TOP_PACKAGE_DIR = github.com/azenakhi/go-makefile

PACKAGE_LIST = model \
			   service

run: main.go install
		@${GO_RUN} main.go 

install: 
		@for pkg in ${PACKAGE_LIST}; do \
				echo "==> Install $$pkg..."; \
				${GO_INSTALL} ${TOP_PACKAGE_DIR}/$$p || exit 1; \
		done  

clean:
		@rm -rf tmp/*

.PHONY:	clean install

