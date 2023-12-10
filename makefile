.PHONY: clean
clean:
	rm -f paper.pdf *.aux *.bbl *.blg *.log *.out *.png

paper.pdf: paper.tex plot-data.png
	pdflatex paper.tex

plot-%.png: %.dat plot.py
	./plot.py -i $*.dat -o $@
