#!/bin/bash

echo "===== SYSTEM DEBUG ====="

# Check running processes
echo "Jenkins Process:"
ps -ef | grep jenkins | grep -v grep

# Check Docker
echo "Docker Containers:"
docker ps

# Check memory
echo "Memory Usage:"
free -h

# Check disk
echo "Disk Usage:"
df -h

# Check port 8080 (Jenkins)
echo "Port 8080 status:"
sudo lsof -i :8080

# Check system uptime
uptime