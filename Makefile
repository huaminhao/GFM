html: convert
	mkdir -p html
	gitbook build . --output=./html

init:
	cd zht && gitbook init

convert:
	node convert.js
	cp README.md zht/README.md

.PHONY: html init convert
