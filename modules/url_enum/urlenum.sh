#!/bin/bash

input="output/http_subdomains.txt"
output="output/all_urls.txt"
mkdir -p output

echo "[*] Gathering URLs from $input..."

# Clear existing output
> $output

# Use gau, waybackurls, hakrawler, katana
cat $input | gau >> $output
cat $input | waybackurls >> $output
cat $input | hakrawler -subs >> $output
cat $input | katana -silent >> $output

# Remove duplicates
sort -u $output -o $output

echo "[✔] URL enumeration completed. Results saved to $output"
