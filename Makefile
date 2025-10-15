TEXFLAGS = -bibtex -pdf -interaction=nonstopmode -use-make
BUILD_DIR = build

.PHONY: all clean $(BUILD_DIR)/thesis.pdf

all: $(BUILD_DIR)/thesis.pdf

# $< outputs first prerequesite
# $@ outputs target
$(BUILD_DIR)/thesis.pdf: thesis.tex $(BUILD_DIR)
	latexmk $(TEXFLAGS) -jobname=$(@:.pdf=) $<

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

old-clean:
	latexmk $(TEXFLAGS) -jobname=$(BUILD_DIR)/ -C thesis.tex

clean:
	rm -rf $(BUILD_DIR)