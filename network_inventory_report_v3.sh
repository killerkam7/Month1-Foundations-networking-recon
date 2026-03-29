#!/data/data/com.termux/files/usr/bin/bash
START=$(date +%s)
echo -e "\033[1;32m🔥 Cameron's Network Inventory Report Tool v3 🔥\033[0m"
echo "Running full local network inventory + light OSINT..."

nmap -sn 192.168.12.0/24 -oN network_scan.txt > /dev/null 2>&1

REPORT="network_inventory_$(date +%Y%m%d_%H%M).md"

cat > "$REPORT" << EOR
# Network Inventory Report - $(date)

**Scan Target:** 192.168.12.0/24  
**Live Hosts Found:** $(grep "Host is up" network_scan.txt | wc -l)
**Scan Duration:** $(( $(date +%s) - START )) seconds

## Live Hosts + Light OSINT
EOR

grep "Nmap scan report for" network_scan.txt | awk '{print $5}' | while read ip; do
  echo "- $ip" >> "$REPORT"
  whois -h whois.cymru.com "$ip" 2>/dev/null | tail -1 | awk '{print "  AS: " $1 " | Owner: " $3 " " $4 " " $5}' >> "$REPORT" 2>/dev/null || echo "  (OSINT lookup failed)" >> "$REPORT"
done

cat >> "$REPORT" << EOR

## Summary
- Router: 192.168.12.1 (expected gateway)
- Your Device: 192.168.12.115
- Other Devices: Any additional IPs listed above

**Generated on Termux** — Part of Cameron's Cyber Security Analyst grind.

Lock in. 💀
EOR

echo -e "\033[1;32mReport saved as $REPORT\033[0m"
cat "$REPORT"

git add "$REPORT" network_scan.txt
git commit -m "Network Inventory Report v3 with light OSINT - $(date +'%Y-%m-%d %H:%M')" --quiet
git push origin main --quiet

echo -e "\033[1;32mReport committed and pushed. Lock in, rook.\033[0m"
