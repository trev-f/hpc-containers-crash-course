site_source := $(wildcard src/quarto/*.qmd src/quarto/_quarto*.yml src/quarto/slides/*.qmd)
site_sentinel := .cache/sentinels/.render-site

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
