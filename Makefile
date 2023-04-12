# Makefile for ThuThesis

PACKAGE = thuthesis
THESIS  = main

SOURCES = $(PACKAGE).ins $(PACKAGE).dtx
CLSFILE = dtx-style.sty $(PACKAGE).cls

LATEXMK = latexmk
SHELL  := /bin/bash

RM = rm

.PHONY: clean thesis cls check FORCE_MAKE

thesis: $(THESIS).pdf

cls: $(CLSFILE)

$(CLSFILE): $(SOURCES)
	xetex $(PACKAGE).ins

$(THESIS).pdf: cls FORCE_MAKE
	$(LATEXMK) $(THESIS)

clean:
	$(LATEXMK) -c $(PACKAGE).dtx $(THESIS)
	-@$(RM) -f *~ main-survey.* main-translation.* _markdown_thuthesis* thuthesis.markdown.*

cleanall: clean
	-@$(RM) -f $(THESIS).pdf

check: FORCE_MAKE
ifeq ($(version),)
	@echo "Error: version missing: \"make [check|dist] version=X.Y.Z\""; exit 1
else
	@[[ $(shell grep -E -c '$(version) Tsinghua University Thesis Template|\\def\\version\{$(version)\}' thuthesis.dtx) -eq 3 ]] || (echo "update version with \'l3build tag\" before release"; exit 1)
	@[[ $(shell grep -E -c '"version": "$(version)"' package.json) -eq 1 ]] || (echo "update version with \'l3build tag\" before release"; exit 1)
endif
