#!/bin/bash
input="output/all_urls.txt"
output="output/js_endpoints.txt"
mkdir -p output

echo "[*] Extracting JS files..."
cat $input | grep -Ei '\.js($|\?)' | sort -u > output/js_files.txt
cat output/js_files.txt | while read url; do
    python3 tools/LinkFinder/linkfinder.py -i $url -o cli >> $output
done
