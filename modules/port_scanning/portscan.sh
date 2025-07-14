#!/bin/bash
input="output/resolved_subdomains.txt"
temp="output/portscan"
mkdir -p $temp

dnsx -l $input -silent -o $temp/ips.txt
naabu -iL $temp/ips.txt -top-ports 1000 -silent -o $temp/naabu_ports.txt
