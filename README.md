# Month1-Networking-Recon-Termux

**Cameron (Dallas) — Cybersecurity Analyst Portfolio Project**

Practical networking reconnaissance & inventory tooling built on Termux (Android) during Month 1 of the 6-month SOC Analyst grind.

## Problem
In a real SOC or blue-team environment, analysts need fast, repeatable ways to baseline their local network, detect live hosts, generate audit-ready reports, and document findings without GUI bloat. This project simulates lightweight asset discovery and daily recon ops.

## Solution
- Interactive Bash menu (`daily_recon_v9.sh`) for full scans, diagnostics, ARP checks, port probes, and Linux networking commands.
- Automated inventory reporter (`network_inventory_report*.sh`) that runs `nmap -sn`, parses output, and generates clean timestamped Markdown reports.
- Threaded Python socket scanner (`rk_scanner_final.py`) for custom port checks with concurrency practice.
- All output saved with timestamps + auto-committed to Git for clean audit trail.

## Skills Demonstrated (maps directly to SOC Analyst / Tier 1 jobs)
- Linux command-line mastery (grep, awk, cut, date, ifconfig, arp, ss, ip, ping)
- Bash scripting & menu-driven automation
- Network scanning with Nmap (`-sn` host discovery)
- Text parsing & report generation (Markdown for professional deliverables)
- Python socket programming + ThreadPoolExecutor for concurrent scanning
- Git workflow (auto-commit + push from scripts)
- Documentation & operational hygiene — critical for incident response and shift handoff
- Basic awareness of home/OT network baselining (relevant for ICS/OT blue team paths)

## Screenshots / Demo
*(Add these — run the tool, take clean screenshots or GIFs of the menu, a live scan, and a generated .md report)*

## Folder Structure