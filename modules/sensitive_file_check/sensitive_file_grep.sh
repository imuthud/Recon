#!/bin/bash
input="output/all_urls.txt"
output="output/sensitive_files.txt"
mkdir -p output

cat $input | grep -Ei '\.(git|env|bak|log|sql|xml|pdf|csv|docx?|xlsx?)($|\?)' > $output
