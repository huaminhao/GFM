html: convert
	mkdir -p html
	gitbook build . --config=book.json --output=./html

pdf: convert
	mkdir -p pdf
	gitbook pdf . --config=book.json
	mv book_zhs.pdf book_zht.pdf pdf

init:
	cd zht && gitbook init

convert:
	cp README.md zht/README.md
	node convert.js

clean:
	rm -rf html pdf zhs

.PHONY: clean html init convert
