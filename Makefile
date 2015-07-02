all: dir pdf html

# Build a number of formats into the `out/` directory. These will get published via Github pages.
dir:
	mkdir -p out

pdf:
	pandoc --smart --filter pandoc-citeproc --variable documentclass=templates/acm_proc_article-sp --csl=templates/acm-sig-proceedings.csl --number-sections --highlight-style=haddock -f markdown -t latex --template=templates/template.latex -o out/paper.pdf paper.md
html:
	pandoc --smart --filter pandoc-citeproc --standalone --css=pandoc.css --toc --highlight-style=haddock -f markdown -t html -o out/index.html paper.md
	cp templates/pandoc.css out/pandoc.css
