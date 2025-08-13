site_source := $(wildcard src/quarto/*.qmd src/quarto/_quarto*.yml src/quarto/slides/*.qmd)
site_sentinel := .cache/sentinels/.render-site
publish_sentinel := .cache/sentinels/.publish-site

.PHONY: all
all: render

.PHONY: render
render: $(site_sentinel)
	@echo "Finished rendering site"

$(site_sentinel): bin/render-site $(site_source)
	@echo "Render site"
	@bin/render-site
	@mkdir -p $(@D)
	@touch $@

.PHONY: publish
publish: $(publish_sentinel)
	@echo "Finished publishing site"

$(publish_sentinel): bin/publish-site $(site_sentinel)
	@echo "Publish quarto report to gh-pages"
	@bin/publish-site
	@mkdir -p $(@D)
	@touch $@
