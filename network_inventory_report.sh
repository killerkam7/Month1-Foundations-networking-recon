#!/data/data/com.termux/files/usr/bin/bash
echo -e "\033[1;32m🔥 Cameron's Network Inventory Report Tool 🔥\033[0m"
echo "Running full local network inventory..."

# Run fresh scan
nmap -sn 192.168.12.0/24 -oN network_scan.txt > /dev/null 2>&1

# Generate clean Markdown report
REPORT="network_inventory_$(date +%Y%m%d_%H%M).md"

cat > "$REPORT" << EOR
# Network Inventory Report - $(date)

**Scan Target:** 192.168.12.0/24  
**Live Hosts Found:** $(grep "Host is up" network_scan.txt | wc -l)

## Live Hosts
$(grep "Nmap scan report for" network_scan.txt | awk '{print "- " $5}')

## Summary
- Router: 192.168.12.1 (expected gateway)
- Your Device: 192.168.12.115
- Other Devices: Any additional IPs listed above

**Generated on Termux** — Part of Cameron's Cyber Security Analyst grind.

Lock in. 💀
EOR

echo -e "\033[1;32mReport saved as $REPORT\033[0m"
cat "$REPORT"

# Auto-commit to your repo with clean date
git add "$REPORT" network_scan.txt
git commit -m "Network Inventory Report - $(date +'%Y-%m-%d %H:%M')" --quiet
git push origin main --quiet

echo -e "\033[1;32mReport committed and pushed to repo. Lock in, rook.\033[0m"
