#!/data/data/com.termux/files/usr/bin/bash
echo -e "\033[1;32m🔥 Cameron's Daily Recon v9 - Week 2 🔥\033[0m"
while true; do
  echo -e "\n1. Run full scan + summary"
  echo "2. Show last scan summary"
  echo "3. Help"
  echo "4. Exit"
  echo "5. Quick Network Diagnostics"
  echo "6. ARP Table"
  echo "7. Common Ports Check (on your IP)"
  echo "8. Save Full Report"
  echo "9. Quick Linux Networking Commands"
  read -p "Choose option (1-9): " choice
  case $choice in
    1)
      echo -e "\033[1;34m[+] Running nmap scan...\033[0m"
      SUBNET="192.168.12.0/24"
      echo "Scanning subnet: $SUBNET"
      nmap -sn "$SUBNET" -oN network_scan.txt
      echo "Live hosts: $(grep -c "Host is up" network_scan.txt)"
      echo "IPs:"
      grep "Nmap scan report for" network_scan.txt | cut -d" " -f5
      { echo "Network Scan Summary - $(date)"
        echo "Live hosts found: $(grep -c "Host is up" network_scan.txt)"
        echo "Host IPs:"
        grep "Nmap scan report for" network_scan.txt | cut -d" " -f5
        echo "============================================"
        cat network_scan.txt
      } > scan_summary.txt
      echo -e "\033[1;32mSummary saved to scan_summary.txt\033[0m"
      echo -e "\033[1;32mLock in, rook.\033[0m"
      ;;
    2)
      [ -f scan_summary.txt ] && cat scan_summary.txt || echo "No summary yet. Run option 1 first."
      ;;
    3)
      echo "1=scan, 2=view, 5=diag, 6=ARP, 7=ports, 8=report, 9=linux cmds"
      echo "Month 1: Networking Foundations. Lock in."
      ;;
    4)
      echo "Peace out, rook. Keep grinding."
      break
      ;;
    5)
      echo -e "\033[1;34m[+] Running quick network diagnostics...\033[0m"
      echo "=== Interfaces ==="; ifconfig
      echo "=== Internet Test ==="; ping -c 4 8.8.8.8
      echo "=== Fast Host Discovery ==="
      nmap -sn 192.168.12.0/24 --min-hostgroup 256
      echo -e "\033[1;32mDiagnostics complete. Lock in.\033[0m"
      ;;
    6)
      echo -e "\033[1;34m[+] ARP Table...\033[0m"
      arp -a 2>/dev/null || echo "ARP blocked by Android"
      ip neigh show dev wlan0 2>/dev/null || echo "ip neigh blocked"
      echo -e "\033[1;32mARP check complete. Lock in.\033[0m"
      ;;
    7)
      echo -e "\033[1;34m[+] Common Ports Check on your IP...\033[0m"
      nmap -p 22,80,443,445,3389 192.168.12.115
      echo -e "\033[1;32mPorts check complete. Lock in.\033[0m"
      ;;
    8)
      echo -e "\033[1;34m[+] Saving Full Report...\033[0m"
      REPORT="full_report_$(date +%Y%m%d_%H%M).md"
      {
        echo "# Cameron's Daily Recon Report - $(date)"
        echo "## Interfaces"; ifconfig
        echo "## Internet Test"; ping -c 4 8.8.8.8
        echo "## Host Discovery"; nmap -sn 192.168.12.0/24 --min-hostgroup 256
        echo "## ARP"; arp -a 2>/dev/null || echo "ARP blocked"
        echo "## Common Ports"; nmap -p 22,80,443,445,3389 192.168.12.115
      } > "$REPORT"
      echo -e "\033[1;32mFull report saved as $REPORT\033[0m"
      echo -e "\033[1;32mLock in, rook.\033[0m"
      ;;
    9)
      echo -e "\033[1;34m[+] Quick Linux Networking Commands...\033[0m"
      echo "=== ip addr ==="; ip addr show 2>/dev/null || echo "ip addr blocked"
      echo "=== ss -tuln ==="; ss -tuln 2>/dev/null || echo "ss blocked"
      echo "=== ip route ==="; ip route 2>/dev/null || echo "route blocked"
      echo -e "\033[1;32mLinux commands complete. Lock in.\033[0m"
      ;;
    *)
      echo "Invalid choice. Lock in next time."
      ;;
  esac
done
