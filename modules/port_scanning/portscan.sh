#!/bin/bash

input="output/clean_subdomains.txt"
temp="output/portscan"
mkdir -p $temp

echo "[*] Resolving IPs from subdomains using dnsx..."
dnsx -l $input -silent -a -resp-only | tee $temp/dnsx_raw.txt

echo "[*] Extracting only IPs from dnsx output..."
cat $temp/dnsx_raw.txt | grep -oE '[0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+' | sort -u > $temp/ips.txt

echo "[*] Scanning open ports using naabu..."
naabu -iL $temp/ips.txt -top-ports 1000 -silent -o $temp/naabu_ports.txt

echo "[✔] Port scan results saved to $temp/naabu_ports.txt"
