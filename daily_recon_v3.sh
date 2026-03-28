#!/data/data/com.termux/files/usr/bin/bash
echo "🔥 Cameron's Daily Recon v3 - Week 2 🔥"
echo "1. Run full scan + summary"
echo "2. Show last scan summary"
echo "3. Help"
read -p "Choose option (1-3): " choice

case $choice in
  1)
    nmap -sn 192.168.12.0/24 -oN network_scan.txt
    echo "Live hosts:"
    grep "Host is up" network_scan.txt | wc -l
    echo "IPs:"
    grep "Nmap scan report for" network_scan.txt | awk '{print $5}'
    echo "Lock in, rook."
    ;;
  2)
    cat scan_summary.txt 2>/dev/null || echo "No summary yet. Run option 1 first."
    ;;
  3)
    echo "1 = scan, 2 = view summary, 3 = help"
    ;;
  *)
    echo "Invalid choice. Lock in next time."
    ;;
esac
