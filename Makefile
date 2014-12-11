html:
	mkdir -p html
	gitbook build . --output=./html

init:
	gitbook init

.PHONY: html init
