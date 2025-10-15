TEXFLAGS = -bibtex -pdf -interaction=nonstopmode -use-make
BUILD_DIR = build
PDF_DIR = pdf

.PHONY: all clean $(BUILD_DIR)/thesis.pdf

all: $(BUILD_DIR)/thesis.pdf

# $< outputs first prerequesite
# $@ outputs target
$(BUILD_DIR)/thesis.pdf: thesis.tex $(BUILD_DIR) $(PDF_DIR)
	latexmk $(TEXFLAGS) -jobname=$(@:.pdf=) $<

$(BUILD_DIR) $(PDF_DIR):
	mkdir -p $@

clean:
	latexmk $(TEXFLAGS) -jobname=$(BUILD_DIR)/thesis -C thesis.tex
	rm -r $(BUILD_DIR)
