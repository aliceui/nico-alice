THEME = $(HOME)/.spm/themes/arale

build-doc:
	@nico build -v -C $(THEME)/nico.js

debug:
	@nico server -C $(THEME)/nico.js --watch debug

server:
	@nico server -C $(THEME)/nico.js

watch:
	@nico server -C $(THEME)/nico.js --watch

publish-doc: clean build-doc
	@rm -fr _site/sea-modules
	@spm publish --doc _site

clean:
	@rm -fr _site

.PHONY: build-doc debug server publish clean
