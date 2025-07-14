#!/bin/bash

domain=$1

if [ -z "$domain" ]; then
  echo "Usage: ./run_all.sh <target-domain>"
  exit 1
fi

echo "[*] Starting full recon on: $domain"
echo

chmod +x modules/*/*.sh

echo "[1] Subdomain Enumeration..."
./modules/subdomain_enum/subenum.sh $domain

echo "[2] DNS Resolution (dnsx)..."
# Already handled inside subenum.sh

echo "[3] URL Enumeration..."
./modules/url_enum/urlenum.sh

echo "[4] HTTPX Probe & Tech Fingerprinting..."
./modules/http_probe_techdetect/httpx.sh

echo "[5] JS Endpoint Extraction..."
./modules/js_analysis/jsfinder.sh

echo "[6] Parameter Discovery..."
./modules/param_discovery/arjun_gf_paramspider.sh

echo "[7] KXSS Reflected Param Testing..."
./modules/param_discovery/kxss.sh

echo "[8] Nuclei Vulnerability Scanner..."
./modules/vuln_scanning/nuclei_scan.sh

echo "[9] Deep Recon & Keyword Grepping..."
./modules/vuln_scanning/deep_recon.sh

echo "[10] Subdomain Takeover Check..."
./modules/takeover_detection/subzy.sh

echo "[11] Sensitive File Pattern Matching..."
./modules/sensitive_file_check/sensitive_file_grep.sh

echo "[12] DOM XSS Code Pattern Matching..."
./modules/dom_xss_check/dom_xss_scan.sh

echo "[13] Redirect/SSRF Fuzzing with GF..."
./modules/open_redirect_ssrf/redirect_ssrf_fuzz.sh

echo "[14] Port Scanning with Naabu + Dnsx..."
./modules/port_scanning/portscan.sh

echo "[15] Directory Bruteforcing with FFUF..."
./modules/directory_bruteforce/ffuf_dirbust.sh

echo
echo "✅ Full recon completed. Check the output/ directory for results."
