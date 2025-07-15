#!/bin/bash

input="output/http_subdomains.txt"
output="output/all_urls.txt"
mkdir -p output

echo "[*] Gathering URLs in parallel from $input..."

# Clear previous results
> $output

# Run each tool in background and store their output separately
cat $input | gau > output/gau.txt &
cat $input | waybackurls > output/wayback.txt &
cat $input | hakrawler -subs > output/hakrawler.txt &
cat $input | katana -silent > output/katana.txt &

# Wait for all background tasks to finish
wait

# Merge, sort, and remove duplicates
cat output/gau.txt output/wayback.txt output/hakrawler.txt output/katana.txt | sort -u > $output

echo "[✔] URL enumeration completed. Results saved to $output"
