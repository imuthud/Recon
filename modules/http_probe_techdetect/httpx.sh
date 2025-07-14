#!/bin/bash
input="output/resolved_subdomains.txt"
mkdir -p output

cat $input | httpx-toolkit -silent -title -status-code -tech-detect -o output/httpx_info.txt
