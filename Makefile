# Run a talk's Slidev deck, e.g. `make dev` or `make dev TALK=<folder>`.
TALKS := $(patsubst %/slides.md,%,$(wildcard */slides.md))
TALK ?= bots-fraud-and-the-business-of-breaking-games

.PHONY: help list install dev build export clean

help:
	@echo "Usage: make <target> [TALK=<folder>]"
	@echo ""
	@echo "  list     List talks with slides"
	@echo "  install  Install the talk's dependencies"
	@echo "  dev      Present locally (open /presenter for speaker notes)"
	@echo "  build    Build a static site into <talk>/dist"
	@echo "  export   Export the slides to PDF"
	@echo "  clean    Remove node_modules and build output"
	@echo ""
	@echo "Current TALK: $(TALK)"

list:
	@printf '%s\n' $(TALKS)

$(TALK)/node_modules: $(TALK)/package.json
	cd $(TALK) && npm install
	@touch $@

install: $(TALK)/node_modules

dev: install
	cd $(TALK) && npm run dev

build: install
	cd $(TALK) && npm run build

export: install
	cd $(TALK) && npm run export

clean:
	rm -rf $(TALK)/node_modules $(TALK)/dist
