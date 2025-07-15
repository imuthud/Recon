#!/bin/bash
sudo apt update && sudo apt install -y jq wget unzip curl

# Install findomain
wget https://github.com/Findomain/Findomain/releases/latest/download/findomain-linux.zip -O findomain.zip
unzip findomain.zip
chmod +x findomain
sudo mv findomain /usr/local/bin/

echo "[*] Adding Go binary path to shell config..."
echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
source ~/.bashrc

echo "[*] Installing Go-based tools..."
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/tomnomnom/assetfinder@latest
go install github.com/OWASP/Amass/v3/...@master
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install github.com/tomnomnom/waybackurls@latest
go install github.com/hakluke/hakrawler@latest
go install github.com/projectdiscovery/katana/cmd/katana@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/Emoe/kxss@latest

echo "[*] Installing Python dependencies for LinkFinder..."
pip install -r tools/LinkFinder/requirements.txt --break-system-packages

echo "[*] Installing Python tools..."

# Install arjun
pip install --break-system-packages arjun

# Install qsreplace (if using pip instead of Go)
pip install --break-system-packages qsreplace

echo "[✔] All tools installed successfully and globally available."
