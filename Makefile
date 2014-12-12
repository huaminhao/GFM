html: convert
	mkdir -p html
	gitbook build . --output=./html

init:
	cd zht && gitbook init

convert:
	cp README.md zht/README.md
	node convert.js

.PHONY: html init convert
