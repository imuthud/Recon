#!/bin/bash

echo "[*] Updating system and installing dependencies..."
sudo apt update && sudo apt install -y jq wget unzip curl python3-pip

# Make tools directory if not exists
mkdir -p tools

# ─────────────────────────────
# 🛠️ Install Findomain
# ─────────────────────────────
if ! command -v findomain &>/dev/null; then
    echo "[*] Installing Findomain..."
    wget https://github.com/Findomain/Findomain/releases/latest/download/findomain-linux.zip -O findomain.zip
    unzip findomain.zip
    chmod +x findomain
    sudo mv findomain /usr/local/bin/
    rm -f findomain.zip
else
    echo "[✔] Findomain already installed."
fi

# ─────────────────────────────
# 🛠️ Add Go binary path to shell config
# ─────────────────────────────
if ! grep -q 'export PATH=$PATH:$HOME/go/bin' ~/.bashrc; then
    echo "[*] Adding Go binary path to ~/.bashrc"
    echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
    source ~/.bashrc
fi

# ─────────────────────────────
# 🛠️ Install Go-based tools
# ─────────────────────────────
echo "[*] Installing Go-based tools..."
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/tomnomnom/assetfinder@latest
go install -v github.com/PentestPad/subzy@latest
go install github.com/OWASP/Amass/v3/...@master
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install github.com/tomnomnom/waybackurls@latest
go install github.com/hakluke/hakrawler@latest
go install github.com/projectdiscovery/katana/cmd/katana@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/Emoe/kxss@latest

# ─────────────────────────────
# 🐍 Install Python tools
# ─────────────────────────────
echo "[*] Installing Python tools with pip..."
pip install --break-system-packages arjun
pip install --break-system-packages qsreplace

# ─────────────────────────────
# 🕵️‍♂️ Install LinkFinder
# ─────────────────────────────
if [ ! -d tools/LinkFinder ]; then
    echo "[*] Cloning LinkFinder..."
    git clone https://github.com/GerbenJavado/LinkFinder.git tools/LinkFinder
    pip3 install -r tools/LinkFinder/requirements.txt --break-system-packages
else
    echo "[✔] LinkFinder already cloned."
fi

echo "[✅] All tools installed successfully and ready to use."
