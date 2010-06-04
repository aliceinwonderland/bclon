# Set TRG to the name of your document (without the ".tex").
TRG = bcart

# Set HASBIB to "yes" if you have a bibtex bibliography, and "no" if not.
HASBIB = yes

# You should not need to change anything below this line.
TEX = latex
BIB = bibtex
PDF = dvipdf
PS = dvips 
RM = rm -f
WC = wc -w

ifeq ($(HASBIB), no)
all: makedvi $(TRG).pdf wc
else
all: makedvi $(TRG).pdf wc
endif

print: all
	$(PS) $(TRG).dvi

wc:
	$(WC) $(TRG).tex

%.bbl: %.tex %.bib
	$(TEX) $(TRG)
	$(BIB) $(TRG)

makedvi: $(TRG).tex
	$(TEX) $(TRG)
	$(TEX) $(TRG) 

%.pdf: %.dvi
	$(PDF) $(TRG).dvi

clean:
	$(RM) $(TRG).aux
	$(RM) $(TRG).dvi
	$(RM) $(TRG).log
	$(RM) $(TRG).pdf
ifeq ($(HASBIB), yes)
	$(RM) $(TRG).bbl
	$(RM) $(TRG).blg
endif
