#!/bin/bash

input="output/resolved_ips.txt"
temp="output/portscan"
mkdir -p $temp

echo "[*] Starting Port Scan using IPs from $input..."

# Validate IP list
if [[ ! -s $input ]]; then
    echo "[!] No IPs found in $input. Exiting..."
    exit 1
fi

# Copy IPs to portscan dir
cp $input $temp/ips.txt

echo "[+] Found $(wc -l < $temp/ips.txt) unique IPs"

echo "[*] Scanning top 1000 ports with naabu..."
naabu -iL $temp/ips.txt -top-ports 1000 -silent -o $temp/naabu_ports.txt

echo "[✔] Port scan complete. Results saved to:"
echo "     → $temp/naabu_ports.txt"
