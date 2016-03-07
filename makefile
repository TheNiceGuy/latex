EXEC=cglcube

PDFDIR=pdf
SRCDIR=src

RM=/usr/bin/rm -rf
MV=/usr/bin/mv
TEX=/usr/bin/pdflatex
MKDIR=/usr/bin/mkdir -p

OBJECTS=$(SRCDIR)/gauss.pdf $(SRCDIR)/sphere.pdf $(SRCDIR)/abs.pdf

all: $(EXEC)

$(EXEC): mkdir $(OBJECTS)
	$(MV) $(SRCDIR)/*.pdf $(PDFDIR)/

%.pdf: %.tex
	$(TEX) --output-directory=$(SRCDIR) $<

mkdir:
	@$(MKDIR) $(PDFDIR)

clean:
	$(RM) $(SRCDIR)/*.aux
	$(RM) $(SRCDIR)/*.log
	$(RM) $(SRCDIR)/*.dvi

mrproper: clean
	$(RM) $(PDFDIR)/*.pdf
