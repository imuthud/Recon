#!/bin/bash
input="output/js_files.txt"
output="output/dom_xss.txt"
mkdir -p output

cat $input | while read url; do
    curl -s $url | grep -E 'location|document\.write|innerHTML|eval|setTimeout|setInterval' >> $output
done
