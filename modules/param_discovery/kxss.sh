#!/bin/bash
input="output/all_urls.txt"
mkdir -p output

echo "[*] Running KXSS for reflection..."
cat $input | kxss > output/kxss_reflections.txt
