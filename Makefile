# Makefile for compiling LaTeX documents

# Name of the main .tex file (without extension)
MAIN = main

# Name of the custom style file
STYLE = usenix.sty


# Main target
all: $(MAIN).pdf

# Rule to create the PDF from the .tex file
$(MAIN).pdf: $(MAIN).tex $(STYLE)
	pdflatex $(MAIN)
	bibtex $(MAIN) 
	pdflatex $(MAIN)
	pdflatex $(MAIN)


# Clean up auxiliary files
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz *.pdf main.bib

# Clean up everything including the PDF
cleanall: clean
	rm -f $(MAIN).pdf

# Phony targets
.PHONY: all clean cleanall view
