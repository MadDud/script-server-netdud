#!/bin/bash

#dig $1

wget $1 --quiet --output-document=/tmp/tesseract

tesseract /tmp/tesseract /tmp/tesseract-output

echo ""

cat /tmp/tesseract-output.txt

rm /tmp/tesseract /tmp/tesseract-output.txt

