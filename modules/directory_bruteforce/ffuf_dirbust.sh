#!/bin/bash
input="output/http_subdomains.txt"
wordlist="wordlists/common.txt"
mkdir -p output/ffuf

cat $input | while read host; do
    ffuf -u $host/FUZZ -w $wordlist -mc 200,204,403 -o output/ffuf/$(echo $host | sed 's/https\?:\/\///').json
done
