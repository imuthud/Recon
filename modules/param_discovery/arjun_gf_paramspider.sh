#!/bin/bash

input="output/all_urls.txt"
mkdir -p output/gf

echo "[*] Running Arjun for parameter discovery..."
cat $input | arjun -i - -o output/params.txt

echo "[*] Running GF pattern matching..."

# GF output directory
declare -A patterns=(
    ["xss"]="xss_params.txt"
    ["sqli"]="sqli_params.txt"
    ["lfi"]="lfi_params.txt"
    ["ssrf"]="ssrf_params.txt"
    ["rce"]="rce_params.txt"
    ["idor"]="idor_params.txt"
    ["redirect"]="open_redirect_params.txt"
    ["ssti"]="ssti_params.txt"
    ["debug_logic"]="debug_logic_params.txt"
    ["interestingparams"]="interesting_params.txt"
    ["base64"]="base64_params.txt"
)

for pattern in "${!patterns[@]}"; do
    echo "  → $pattern"
    cat $input | gf "$pattern" > "output/gf/${patterns[$pattern]}"
done

echo "[*] Running ParamSpider on subdomains (not URLs)..."
cat output/clean_subdomains.txt | sort -u | while read domain; do
    paramspider -d "$domain" --quiet >> output/paramspider_urls.txt
done

echo "[✔] Parameter discovery and GF filtering complete!"
