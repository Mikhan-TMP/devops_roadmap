# DevOps Roadmap - Server Performance Stats

A bash script that generates comprehensive server performance statistics including CPU, memory, disk usage, and system information.

## Features

- 📊 Real-time system performance metrics
- 💻 CPU and memory usage statistics
- 💾 Disk space utilization
- 👥 Currently logged-in users
- 🔒 Failed login attempt tracking
- ⚡ Top resource-consuming processes

## Prerequisites

- Linux-based operating system (Ubuntu, Debian, CentOS, etc.)
- Bash shell
- Root/sudo access (for failed login attempts)

## Installation

1. Navigate to the script directory:
   ```bash
   cd "Server Performance Stats"
   ```

2. Make the script executable:
   ```bash
   chmod +x serverstats.sh
   ```

## Usage

Run the script:
```bash
./serverstats.sh
```

For failed login attempts (requires sudo):
```bash
sudo ./serverstats.sh
```

## Sample Output

```
=====================================
 SERVER PERFORMANCE STATS REPORT
 Generated on: Fri Oct 17 11:21:55 AM PST 2025
=====================================

>>> Operating System Info
Ubuntu 22.04.4 LTS

>>> Uptime:
up 2 days, 5 hours, 10 minutes

>>> Load Average:
 0.05, 0.10, 0.15

>>> Logged-in Users:
ubuntu

>>> Total CPU Usage:
12.5% used (87.5% idle)

>>> Memory Usage:
Used: 1.2G / Total: 3.8G (31.5%)

>>> Disk Usage:
Used: 8.5G / Total: 30G (28% used)

>>> Top 5 Processes by CPU Usage:
  PID COMMAND %CPU
 1023 node     9.5
  874 python   2.3
  410 systemd  1.2
  355 sshd     0.5
  200 bash     0.1

>>> Top 5 Processes by Memory Usage:
  PID COMMAND %MEM
 1023 node     8.2
  874 python   3.1
  410 systemd  1.5
  355 sshd     0.7
  200 bash     0.3

>>> Failed Login Attempts (last 10):
Oct 16 12:05:33 ubuntu sshd[1333]: Failed password for invalid user admin ...
...
=====================================
 END OF REPORT
=====================================
```

## What This Script Monitors

| Metric | Description |
|--------|-------------|
| **OS Information** | Operating system name and version |
| **Uptime** | How long the system has been running |
| **Load Average** | System load over 1, 5, and 15 minutes |
| **Logged-in Users** | Currently active users |
| **CPU Usage** | Total CPU utilization percentage |
| **Memory Usage** | RAM consumption and availability |
| **Disk Usage** | Overall disk space utilization |
| **Top Processes** | Most resource-intensive processes |
| **Failed Logins** | Recent unsuccessful login attempts |

## Troubleshooting

- **Permission denied**: Ensure the script has execute permissions
- **Failed login section missing**: Run with `sudo` or check if `/var/log/auth.log` exists
- **Command not found**: Verify all required utilities are installed (`top`, `ps`, `free`, `df`)

## License

Open source - feel free to modify and distribute

---

**Note**: This script is part of the DevOps Roadmap learning project.



