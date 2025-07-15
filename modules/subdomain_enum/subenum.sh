#!/bin/bash

domain=$1
output="output/subdomains.txt"
mkdir -p output

echo "[*] Subdomain Enumeration for $domain"

# Subdomain tools
subfinder -d $domain -silent >> $output
assetfinder --subs-only $domain >> $output
crtsh=$(curl -s "https://crt.sh/?q=%25.$domain&output=json")
if echo "$crtsh" | jq empty 2>/dev/null; then
    echo "$crtsh" | jq -r '.[].name_value' >> $output
else
    echo "[!] crt.sh returned invalid JSON, skipping..."
fi
# Optional: Findomain
if command -v findomain &> /dev/null; then
    findomain -t $domain -q >> $output
else
    echo "[!] findomain not found. Skipping..."
fi

# Remove duplicates
sort -u $output -o $output

# Clean DNS results (in case you run dnsx later)
cat $output | dnsx -silent > output/resolved_dnsx.txt
cat output/resolved_dnsx.txt | awk '{print $1}' | sort -u > output/clean_subdomains.txt

# Create http/https version
cat output/clean_subdomains.txt | while read sub; do
    echo "http://$sub"
    echo "https://$sub"
done > output/http_subdomains.txt
