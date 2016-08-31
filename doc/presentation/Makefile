DOCUMENTS := presentation.pdf

all: $(DOCUMENTS)

presentation.pdf: presentation.md
	pandoc -t beamer -V theme:Solarized --latex-engine xelatex -o $@ $<

clean:
	rm $(DOCUMENTS)
