@echo off
cd ..
md html
copy README.md zht\README.md
node convert.js
gitbook build . --output=./html
