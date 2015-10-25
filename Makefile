download:
	./download_batch.sh

wordseg:
	mkdir -p output
	python run_word_seg.py

shiny:
	cd shiny; Rscript startshiny.R

all:
	download
	wordseg
	shiny
