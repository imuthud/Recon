Here’s your updated `README.md` tailored to your `Recon` GitHub project, with clear sections for:

* ✅ Features & tools
* 🚀 How to use (`run_all.sh`)
* ⚙️ What's automatic
* ✍️ What requires manual input

---

### ✅ Updated `README.md`

````markdown
# 🔍 Recon - Bug Bounty Recon Automation Toolkit

A powerful and modular recon toolkit for bug bounty hunting. Combines subdomain enumeration, URL discovery, JS analysis, parameter fuzzing, port scanning, and more — using only open-source tools.

---

## 🛠️ Features

| Task                          | Tool(s) Used                                          |
|-------------------------------|--------------------------------------------------------|
| Subdomain Enumeration         | `subfinder`, `assetfinder`, `amass`, `findomain`       |
| URL Collection                | `gau`, `waybackurls`, `hakrawler`, `katana`            |
| JS Endpoint Discovery         | `grep`, `LinkFinder`                                   |
| Parameter Discovery           | `arjun`, `gf`, `qsreplace`                             |
| Vulnerability Scanning       | `nuclei` with CVEs + vuln templates                    |
| Port Scanning                 | `dnsx` + `naabu`                                       |
| Visual Recon (optional)      | `aquatone`                                             |
| Subdomain Takeover           | `subzy` (manual)                                       |
| Sensitive File/Extension Grep| `grep`                                                 |
| SSRF & Redirect Checks       | `gf`, `qsreplace`                                      |
| DOM XSS Detection            | `curl` + regex on JS files                             |

---

## 🚀 How to Use (Step-by-Step)

### 1. Clone the Repo
```bash
git clone https://github.com/imuthud/Recon.git
cd Recon
````

### 2. Install All Tools

```bash
bash install.sh
```

### 3. Run Everything with One Command

```bash
bash run_all.sh apple.com
```

This will:

* Enumerate subdomains
* Crawl and collect URLs
* Discover JS files and endpoints
* Find parameters
* Scan for known vulnerabilities (CVE, misconfigs)
* Check for sensitive extensions
* Port scan the discovered subdomains

---

## 📂 Output Folder Structure

| File / Folder                     | Description                          |
| --------------------------------- | ------------------------------------ |
| `output/subdomains.txt`           | All discovered subdomains            |
| `output/all_urls.txt`             | Collected URLs from tools            |
| `output/js_files.txt`             | JS file URLs                         |
| `output/js_endpoints.txt`         | JS endpoints from LinkFinder         |
| `output/params.txt`               | Params from Arjun                    |
| `output/xss_params.txt`           | XSS params via gf                    |
| `output/sqli_params.txt`          | SQLi params via gf                   |
| `output/nuclei_hits.txt`          | Vulnerabilities found by Nuclei      |
| `output/interesting_urls.txt`     | Login, admin, upload, reset, etc     |
| `output/sensitive_files.txt`      | Leaky files like `.git`, `.env`, etc |
| `output/portscan/naabu_ports.txt` | Open ports per IP (via naabu)        |

---

## ✅ Automated Tasks

✅ These modules run automatically from `run_all.sh`:

* Subdomain enumeration
* URL crawling and JS collection
* Parameter discovery
* Nuclei scanning (CVEs, vulnerabilities)
* Sensitive file & extension checks
* SSRF/Open Redirect fuzzing
* DOM XSS grep
* Port scanning (`dnsx`, `naabu`)

---

## ✍️ Manual Inputs or Optional Runs

🟡 These steps require manual trigger/input:

* **Target domain** → You must pass it to `run_all.sh`

  ```bash
  bash run_all.sh target.com
  ```

* **Aquatone visual recon** → Requires browser install and large setup

* **Subdomain takeover (subzy)** → Run manually if needed

  ```bash
  subzy run --targets output/subdomains.txt --hide_fails > output/subzy_takeovers.txt
  ```

* **Deep fuzzing or auth-based scans** → Out of scope for automation

---

## 📌 Requirements

* Go (for most tools)
* Python 3 (for LinkFinder)
* Bash, curl, git
* GNU/Linux or WSL/Termux recommended

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🧠 Author

**Muthu D** – [GitHub](https://github.com/imuthud) | Recon enthusiast | Bug bounty hunter

```

---

Would you like me to push this to your repo as a PR (instructions), or do you want a `.md` file to copy and paste directly?
```
