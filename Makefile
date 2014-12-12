html: convert
	mkdir -p html
	gitbook build . --output=./html

init:
	gitbook init

convert:
	node convert.js

.PHONY: html init convert
