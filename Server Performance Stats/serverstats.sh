#!/bin/bash

# ===============================
# Server Stats Script
# ===============================

echo "====================================="
echo " SERVER PERFORMANCE STATS REPORT"
echo " Generated on: $(date)"
echo "====================================="

# --- OS Information ---
echo
echo ">>> Operating System Info"
cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"'

# --- Uptime ---
echo
echo ">>> Uptime:"
uptime -p

# --- Load Average ---
echo
echo ">>> Load Average:"
uptime | awk -F'load average:' '{ print $2 }'

# --- Logged-in Users ---
echo
echo ">>> Logged-in Users:"
who | awk '{print $1}' | sort | uniq

# --- CPU Usage ---
echo
echo ">>> Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
awk '{print 100 - $8 "% used (" $8 "% idle)"}'

# --- Memory Usage ---
echo
echo ">>> Memory Usage:"
free -h | awk '/^Mem/ {print "Used: " $3 " / Total: " $2 " (" $3/$2*100 "%)"}'

# --- Disk Usage ---
echo
echo ">>> Disk Usage:"
df -h --total | grep total | awk '{print "Used: " $3 " / Total: " $2 " (" $5 " used)"}'

# --- Top 5 Processes by CPU ---
echo
echo ">>> Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# --- Top 5 Processes by Memory ---
echo
echo ">>> Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

# --- Failed Login Attempts ---
if [ -f /var/log/auth.log ]; then
  echo
  echo ">>> Failed Login Attempts (last 10):"
  sudo grep "Failed password" /var/log/auth.log | tail -n 10
fi

echo
echo "====================================="
echo " END OF REPORT"
echo "====================================="
