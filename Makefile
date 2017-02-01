NULL =

PLANTUML = /usr/bin/plantuml

uml_UML = \
	assets/uml/activity/dcsg-config.uml \
	$(NULL)

uml_SVG = \
	$(uml_UML:%.uml=%.svg) \
	$(NULL)

CSS=$(shell find assets/css -type f -name *.css -not -name *.min.css)
JS=$(shell find assets/js -type f -name *.js -not -name *.min.js)

CLEAN_FILES = \
	$(uml_SVG) \
	$(NULL)

minify: $(patsubst %.css,%.min.css,$(CSS)) $(patsubst %.js,%.min.js,$(JS))

%.min.css: %.css
	cssmin $< > $@

%.min.js: %.js
	uglifyjs $< > $@

uml: $(uml_UML) $(uml_SVG)

%.svg: %.uml
	$(PLANTUML) -tsvg $<

clean:
	-test -z "$(CLEAN_FILES)" || rm -f %(CLEAN_FILES)
