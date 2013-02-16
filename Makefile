THEME = $(HOME)/.spm/themes/alice

build-doc:
	@nico build -v -C $(THEME)/nico.js

debug:
	@nico server -C $(THEME)/nico.js --watch debug

server:
	@nico server -C $(THEME)/nico.js

watch:
	@nico server -C $(THEME)/nico.js --watch

publish: clean build-doc
	@ghp-import _site
	@git push origin gh-pages

clean:
	@rm -fr _site


.PHONY: build-doc debug server publish clean test coverage
