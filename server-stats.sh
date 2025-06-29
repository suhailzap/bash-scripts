#!/bin/bash

echo "==================== SERVER PERFORMANCE STATS ===================="

# OS and Uptime Info
echo -e "\n🖥️  OS Version and Uptime:"
echo "OS: $(uname -srm)"
echo "Hostname: $(hostname)"
uptime -p

# Load Average
echo -e "\n📊 Load Average (1, 5, 15 min):"
uptime | awk -F'load average:' '{ print $2 }'

# Logged In Users
echo -e "\n👤 Currently Logged In Users:"
who

# CPU Usage
echo -e "\n🔥 Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "Used: " 100 - $8 "%, Idle: " $8 "%"}'

# Memory Usage
echo -e "\n💾 Total Memory Usage:"
free -h | awk '/Mem:/ {
  total=$2; used=$3; free=$4;
  printf("Total: %s | Used: %s | Free: %s | Usage: %.2f%%\n", total, used, free, (used/total)*100)
}'
du -sh /* 2>/dev/null | sort -hr | head -n 10

# Disk Usage
echo -e "\n🗄️ Total Disk Usage (Mounted on '/'):"
df -h / | awk 'NR==2 {
  printf("Total: %s | Used: %s | Avail: %s | Usage: %s\n", $2, $3, $4, $5)
}'

# Top 5 Processes by CPU Usage
echo -e "\n📈 Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 Processes by Memory Usage
echo -e "\n📉 Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

# Failed Login Attempts (stretch)
echo -e "\n🚫 Failed Login Attempts (last 24h):"
journalctl -xe | grep -i "failed password" | grep "$(date '+%b %d')" | wc -l

echo -e "\n=================================================================="
