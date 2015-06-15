FILE = paper 
#FILE = paper-disclaimer

pdf: *.tex
	#pdflatex $(FILE)
	pdflatex -shell-escape $(FILE)
	#lualatex $(FILE)
view:
	xpdf -remote 127.0.0.1 $(FILE).pdf &
tex: *.tex
	pdflatex $(FILE)
bib: *.bib *.tex
	bibtex $(FILE)
all: *.tex *.bib
	$(bib) $(tex)

clean: 
	-rm ./*.aux ./*.dvi ./*.blg ./*.log ./*.out ./*.toc ./*.spl ./*.tpt ./*.bbl ./*.pdf ./*~ ./includes/*backup* ./includes/*~ ./includes/*.aux ./*.auxlock
