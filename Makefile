TEXFLAGS = -bibtex -pdf -interaction=nonstopmode -use-make
BUILD_DIR = build
PDF_DIR = pdf

.PHONY: all clean thesis.pdf

all: thesis.pdf

# $< outputs first prerequesite
# $@ outputs target
thesis.pdf: thesis.tex $(BUILD_DIR) $(PDF_DIR)
	latexmk $(TEXFLAGS) -jobname=$(BUILD_DIR)/$(<:.tex=) $<
	cp $(BUILD_DIR)/$@ $(PDF_DIR)/$@

$(BUILD_DIR) $(PDF_DIR):
	mkdir -p $@

clean:
	latexmk $(TEXFLAGS) -jobname=$(BUILD_DIR)/thesis -C thesis.tex
