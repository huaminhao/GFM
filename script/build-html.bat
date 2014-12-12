@echo off
cd ..
md html
copy README.md zht\README.md
gitbook build ./zht --output=./html
