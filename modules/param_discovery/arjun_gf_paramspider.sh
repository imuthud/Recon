#!/bin/bash
input="output/all_urls.txt"
mkdir -p output

echo "[*] Arjun param discovery..."
cat $input | arjun -i - -o output/params.txt

echo "[*] GF pattern search..."
cat $input | gf xss > output/xss_params.txt
cat $input | gf sqli > output/sqli_params.txt

echo "[*] Running ParamSpider..."
paramspider -l $input -o output/paramspider_urls.txt
