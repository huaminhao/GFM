html: convert
	mkdir -p html
	gitbook build . --output=./html

init:
	cd zht && gitbook init

convert:
	node convert.js

.PHONY: html init convert
