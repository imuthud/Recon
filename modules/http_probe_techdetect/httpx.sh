#!/bin/bash
input="output/clean_subdomains.txt"
mkdir -p output

cat $input | httpx-toolkit -silent -title -status-code -tech-detect -o output/httpx_info.txt
