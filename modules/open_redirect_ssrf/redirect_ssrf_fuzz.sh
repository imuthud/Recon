#!/bin/bash
input="output/all_urls.txt"
output="output/fuzzable_params.txt"
mkdir -p output

cat $input | gf redirect | qsreplace "http://evil.com" >> $output
cat $input | gf ssrf | qsreplace "http://127.0.0.1" >> $output
sort -u $output -o $output
