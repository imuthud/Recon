#!/bin/bash

domain=$1
output="output/subdomains.txt"
mkdir -p output

echo "[*] Subdomain Enumeration for $domain"

# Clear previous output
> $output

# Subdomain tools in parallel
subfinder -d $domain -silent > output/subfinder.txt &
assetfinder --subs-only $domain > output/assetfinder.txt &


# Optional: Findomain
if command -v findomain &> /dev/null; then
    findomain -t $domain -q > output/findomain.txt &
else
    echo "[!] findomain not found. Skipping..."
fi

# Wait for all parallel jobs to finish
wait

# Combine and deduplicate
cat output/*.txt | sort -u > $output

# DNS resolution
dnsx -l $output -silent -a -resp-only > output/resolved_dnsx.txt
cat output/resolved_dnsx.txt | awk '{print $1}' | sort -u > output/clean_subdomains.txt

# Create http(s) URLs
cat output/clean_subdomains.txt | while read sub; do
    echo "http://$sub"
    echo "https://$sub"
done > output/http_subdomains.txt

echo "[✔] Subdomain Enumeration Completed. Results saved in output/"
