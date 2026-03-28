#!/data/data/com.termux/files/usr/bin/bash
echo "🔥 Cameron's Daily Recon - Week 2 🔥"
nmap -sn 192.168.12.0/24 -oN network_scan.txt
echo "Live hosts:" 
grep "Host is up" network_scan.txt | wc -l
echo "IPs:"
grep "Nmap scan report for" network_scan.txt | awk '{print $5}'
echo "Lock in, rook."
