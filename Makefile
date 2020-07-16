# Makefile for Sphinx Docs.
.PHONY: help clean compose-build compose-up local-build

# Options can also be set as env vars.
SPHINXOPTS    = -j auto
SPHINXBUILD   = sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

UNAME := $(shell uname -s)
COMPOSE ?= docker-compose

help:
	@echo "== Targets ========================================================="
	@echo "Use make with one of the following general targets:"
	@echo "clean                      - Clean generated files"
	@echo "compose-build              - Docker compose build"
	@echo "compose-up                 - Docker compose up"
	@echo " "
	@echo "== Sphinx specific targets ========================================="
	@echo "Use make with one of the following SPHINX targets:"
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clean:
	@rm -rf build/

ifeq ($(UNAME), Linux)
watch:
	$(MAKE) html
	while inotifywait -re modify /mnt/app; do $(MAKE) html; done
else
watch:
	@echo "ERROR: watch target not supported on $(UNAME)"
endif

compose-build:
	$(COMPOSE) build

compose-up:
	@$(COMPOSE) up -d

compose-down:
	@$(COMPOSE) down -v

compose-logs:
	@$(COMPOSE) logs -f

compose-logs-sphinx:
	@$(COMPOSE) logs -f doc-sphinx

compose-logs-nginx:
	@$(COMPOSE) logs -f doc-nginx

%:
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
