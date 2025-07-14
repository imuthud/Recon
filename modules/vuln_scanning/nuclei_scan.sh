#!/bin/bash
input="output/all_urls.txt"
mkdir -p output

echo "[*] Running Nuclei..."
nuclei -l $input -t cves/ -t vulnerabilities/ -o output/nuclei_hits.txt
