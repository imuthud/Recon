#!/bin/bash
domain=$1
output="output/subdomains.txt"
mkdir -p output

echo "[*] Running passive enumeration..."
subfinder -d $domain -silent >> $output
assetfinder --subs-only $domain >> $output
amass enum -passive -d $domain >> $output
findomain -t $domain -q >> $output
curl -s "https://crt.sh/?q=%25.$domain&output=json" | jq -r '.[].name_value' >> $output

echo "[*] Resolving with dnsx..."
sort -u $output | dnsx -silent -resp -o output/resolved_subdomains.txt
