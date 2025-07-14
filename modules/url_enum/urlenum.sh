#!/bin/bash
input="output/resolved_subdomains.txt"
output="output/all_urls.txt"
mkdir -p output

echo "[*] Gathering URLs..."
cat $input | gau >> $output
cat $input | waybackurls >> $output
cat $input | hakrawler -subs >> $output
cat $input | katana -silent >> $output

sort -u $output -o $output
