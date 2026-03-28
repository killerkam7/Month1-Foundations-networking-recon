#!/data/data/com.termux/files/usr/bin/bash
echo -e "\033[1;32m🔥 Cameron's Daily Recon v5 - Week 2 🔥\033[0m"

while true; do
  echo -e "\n1. Run full scan + summary"
  echo "2. Show last scan summary"
  echo "3. Help"
  echo "4. Exit"
  read -p "Choose option (1-4): " choice

  case $choice in
    1)
      echo -e "\033[1;34m[+] Running nmap scan...\033[0m"
      nmap -sn 192.168.12.0/24 -oN network_scan.txt
      echo "Live hosts:"
      grep "Host is up" network_scan.txt | wc -l
      echo "IPs:"
      grep "Nmap scan report for" network_scan.txt | awk '{print $5}'

      # Save summary with timestamp
      echo "Network Scan Summary - $(date)" > scan_summary.txt
      echo "Live hosts found:" >> scan_summary.txt
      grep "Host is up" network_scan.txt | wc -l >> scan_summary.txt
      echo "Host IPs:" >> scan_summary.txt
      grep "Nmap scan report for" network_scan.txt | awk '{print $5}' >> scan_summary.txt

      echo -e "\033[1;32mSummary saved to scan_summary.txt\033[0m"
      echo -e "\033[1;32mLock in, rook.\033[0m"
      ;;
    2)
      if [ -f scan_summary.txt ]; then
        cat scan_summary.txt
      else
        echo "No summary yet. Run option 1 first."
      fi
      ;;
    3)
      echo "1 = scan + save summary, 2 = view summary, 3 = help, 4 = exit"
      ;;
    4)
      echo "Peace out, rook. Keep grinding."
      break
      ;;
    *)
      echo "Invalid choice. Lock in next time."
      ;;
  esac
done
