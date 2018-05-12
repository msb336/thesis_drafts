###############################################################################
# makefile
# Written by Chris Cera: 3/17/2004
# Does not assume gmake
###############################################################################

P = drexelthesis_template

#PREFIX=/usr/local/teTeX-2.0/bin/i686-pc-linux-gnu/

TEX = $(PREFIX)latex
PS  = $(PREFIX)dvips
GS  = $(PREFIX)gv
CK  = $(PREFIX)ispell
BIB = $(PREFIX)bibtex
PDF = $(PREFIX)dvipdfm
XDVI= $(PREFIX)xdvi

###############################################################################
default:    $P.dvi
###############################################################################

$P.dvi:	drexelthesis_template.tex drexelthesis_template.bib
	export PATH=$(PATH):$(PREFIX)
	$(TEX) $(@:.dvi=)
	$(BIB) $(@:.dvi=)
	$(TEX) $(@:.dvi=) 2> /dev/null > /dev/null
	grep -v subfigure $(@:.dvi=.lof) | sed -f fix_loX.sed > bunk.lof
	sed -f fix_loX.sed $(@:.dvi=.lot) > bunk.lot
	mv bunk.lof $(@:.dvi=.lof)
	mv bunk.lot $(@:.dvi=.lot)
	$(TEX) $(@:.dvi=) 2> /dev/null > /dev/null

force:	$P

$P:
	export PATH=$(PATH):$(PREFIX)
	$(TEX) $@
	$(BIB) $@
	$(TEX) $@ 2> /dev/null > /dev/null
	grep -v subfigure $@.lof | sed -f fix_loX.sed > bunk.lof
	sed -f fix_loX.sed $@.lot > bunk.lot
	mv bunk.lof $@.lof
	mv bunk.lot $@.lot
	$(TEX) $@ 2> /dev/null > /dev/null

$P.ps:	$P.dvi
	$(PS) $< -o $@

$P.pdf:	$P.dvi
	$(PDF) $<

# want to r/m the .aux b/c its always new, and bibtek gets ran (its fast tho)
$P.bbl:	$P.bib $P.aux
	$(BIB) $P

$P.aux:	
#	We only get here if we're running tex for the first time
	$(TEX) $(@:.aux=.tex)

nobib:	$P.tex
	$(TEX) $P.tex

clean:
	rm -f $P.bbl $P.aux $P.dvi $P.ps $P.blg $P.log $P.pdf $P.log *.log *.lot *.toc *.lof

spell:
	$(CK) $P.tex

bib:	$P.bbl
bbl:	$P.bbl
dvi:	$P.dvi
pdf:	$P.pdf
ps:	$P.ps


###############################################################################
s:
	$(GS) $P.ps

p:
	$(GS) $P.pdf

d:
	export PATH=$(PATH):$(PREFIX) && $(XDVI) $P.dvi
###############################################################################
