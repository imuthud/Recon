#!/bin/bash
input="output/resolved_subdomains.txt"
mkdir -p output

subzy run --targets $input --hide_fails > output/subzy_takeovers.txt
