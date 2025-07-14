#!/bin/bash
input="output/all_urls.txt"
mkdir -p output

grep -Ei 'admin|login|upload|reset|callback|sso' $input > output/interesting_urls.txt
grep -Ei 'graphql|swagger|openapi' $input > output/api_endpoints.txt
