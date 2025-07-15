#!/bin/bash
input="output/all_urls.txt"
output="output/kxss_reflections.txt"
mkdir -p output

echo "[*] Filtering URLs with parameters..."
cat $input | grep '?' | sort -u > output/urls_with_params.txt

echo "[*] Running KXSS on URLs with parameters..."
cat output/urls_with_params.txt | kxss > $output

echo "[✔] KXSS reflections saved to $output"
