Here’s your **updated `README.md`** reflecting all the latest changes:

* ✅ Cleaned subdomain formatting
* ✅ Updated input logic for URL tools
* ✅ Clarified `dnsx` output handling for port scanning
* ✅ New file structure and flow

---

## ✅ `README.md` – Final Updated Version

````markdown
# 🔍 Recon - Bug Bounty Recon Automation Toolkit

An advanced and modular recon toolkit designed for bug bounty hunting and web app security testing. Includes subdomain enumeration, URL crawling, JS analysis, parameter discovery, CVE detection, sensitive file checks, port scanning, and more — powered by open-source tools.

---

## 🛠️ Features

| Task                        | Tools Used                                                       |
|-----------------------------|------------------------------------------------------------------|
| Subdomain Enumeration       | subfinder, assetfinder, amass, findomain                        |
| DNS Resolution              | dnsx                                                             |
| URL Crawling                | gau, waybackurls, hakrawler, katana                             |
| JS Analysis                 | grep, LinkFinder                                                |
| Parameter Discovery         | arjun, gf, qsreplace                                             |
| Vulnerability Scanning      | nuclei with CVE + vuln templates                                |
| Sensitive File Discovery    | grep                                                             |
| SSRF/Open Redirect Fuzzing  | gf, qsreplace                                                    |
| DOM XSS Pattern Detection   | curl + regex                                                    |
| Port Scanning               | dnsx + naabu                                                    |
| Visual Recon (optional)     | aquatone                                                         |
| Subdomain Takeover (manual) | subzy                                                           |

---

## 🚀 Usage Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/imuthud/Recon.git
cd Recon
````

### 2. Install Dependencies

```bash
bash install.sh
```

> This installs all required Go/Python tools like subfinder, naabu, nuclei, etc.

### 3. Run All Modules

```bash
bash run_all.sh apple.com
```

This will:

* Enumerate subdomains
* Resolve and clean IPs
* Crawl for URLs and JS
* Extract params
* Scan for CVEs & sensitive files
* Fuzz redirects/SSRF
* Scan open ports

---

## 📂 Output Folder Structure

| File / Folder                        | Description                                              |
| ------------------------------------ | -------------------------------------------------------- |
| `subdomains.txt`                     | Raw subdomains from tools                                |
| `resolved_dnsx.txt`                  | `dnsx` output with A records                             |
| `clean_subdomains.txt`               | Subdomains only (cleaned, no IPs)                        |
| `http_subdomains.txt`                | Formatted for URL tools (http/https)                     |
| `all_urls.txt`                       | Combined output from gau, waybackurls, hakrawler, katana |
| `js_files.txt`                       | Extracted JS URLs                                        |
| `js_endpoints.txt`                   | JS endpoints found via LinkFinder                        |
| `params.txt`                         | Parameters found via Arjun                               |
| `xss_params.txt` / `sqli_params.txt` | Gf-matched interesting params                            |
| `nuclei_hits.txt`                    | Vulnerability scan results                               |
| `interesting_urls.txt`               | URLs containing keywords like login, admin, etc.         |
| `api_endpoints.txt`                  | Found Swagger, GraphQL, Postman docs                     |
| `sensitive_files.txt`                | URLs ending with .env, .git, .xml, etc.                  |
| `fuzzable_params.txt`                | URLs fuzzed for SSRF or open redirects                   |
| `dom_xss.txt`                        | Raw JS lines with potential DOM sinks                    |
| `portscan/naabu_ports.txt`           | Open ports found via naabu                               |
| `screenshots/` *(optional)*          | Aquatone screenshots                                     |
| `subzy_takeovers.txt` *(optional)*   | Subdomain takeover results                               |

---

## ✅ Automatically Handled by `run_all.sh`

* Subdomain enum & DNS resolution
* URL crawling & JS discovery
* Param extraction & vuln scanning
* Fuzzing & grep-based analysis
* Port scanning (naabu)
* Directory structure and deduplication

---

## ✍️ Manual/Optional Steps

* `subzy` (for takeover check):

  ```bash
  subzy run --targets output/clean_subdomains.txt --hide_fails > output/subzy_takeovers.txt
  ```

* `aquatone` (visual recon)

  ```bash
  cat output/clean_subdomains.txt | aquatone -out output/screenshots/
  ```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🧠 Author

**Muthu D** – [GitHub](https://github.com/imuthud)
Bug bounty hunter | Recon enthusiast | Web security researcher

```

---

Let me know if you want me to bundle this updated `README.md` into your `.zip` or repo-ready folder.
```
