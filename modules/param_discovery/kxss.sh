#!/bin/bash

input="output/all_urls.txt"
mkdir -p output

echo "[*] Filtering URLs with XSS patterns using gf..."
cat $input | gf xss | sort -u > output/gf_xss_urls.txt

echo "[*] Running KXSS on filtered URLs..."
cat output/gf_xss_urls.txt | kxss > output/kxss_reflections.txt

echo "[✔] XSS reflection scan completed."
echo " → KXSS results: output/kxss_reflections.txt"
