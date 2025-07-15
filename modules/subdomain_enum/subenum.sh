#!/bin/bash

domain=$1
mkdir -p output

echo "[*] Subdomain Enumeration for $domain"

# Clean previous data
> output/subdomains.txt
> output/subfinder.txt
> output/assetfinder.txt
> output/findomain.txt

# Run tools in parallel
subfinder -d $domain -silent > output/subfinder.txt &
assetfinder --subs-only $domain > output/assetfinder.txt &

# Optional: Findomain
if command -v findomain &> /dev/null; then
    findomain -t $domain -q > output/findomain.txt &
else
    echo "[!] findomain not found. Skipping..."
fi

# Wait for all to finish
wait

# Combine and deduplicate all results
cat output/subfinder.txt output/assetfinder.txt output/findomain.txt 2>/dev/null | sort -u > output/subdomains.txt

echo "[*] Resolving subdomains using dnsx..."

# Resolve with dnsx and keep full info (domain + IP)
dnsx -l output/subdomains.txt -a -resp -silent > output/resolved_dnsx.txt

# Extract subdomains (clean)
awk '{print $1}' output/resolved_dnsx.txt | sort -u > output/clean_subdomains.txt

# Extract clean IPs
awk '{gsub(/\[|\]/, "", $3); print $3}' output/resolved_dnsx.txt | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort -u > output/resolved_ips.txt

# Prepare http:// and https:// for crawling tools
echo "[*] Creating http_subdomains.txt..."
> output/http_subdomains.txt
cat output/clean_subdomains.txt | while read sub; do
    echo "http://$sub"
    echo "https://$sub"
done >> output/http_subdomains.txt

echo "[✔] Subdomain Enumeration Complete"
echo "    → Total found: $(wc -l < output/clean_subdomains.txt) subdomains"
echo "    → IPs saved to: output/resolved_ips.txt"
echo "    → For URL tools: output/http_subdomains.txt"
