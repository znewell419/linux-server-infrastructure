#!/bin/bash

#################################################
# ZDN Server Health Check
# System health monitoring script
#
# Exit codes:
# 0 = Healthy
# 1 = Problems detected
#################################################

set -u

LOG_FILE="/var/log/zdn-health.log"

exec > >(tee -a "$LOG_FILE") 2>&1

HOSTNAME=$(cat /etc/hostname)
DATE=$(date)

ISSUES=0

echo "===================================="
echo "        ZDN SERVER HEALTH CHECK"
echo "===================================="
echo
echo "Hostname: $HOSTNAME"
echo "Date: $DATE"
echo


echo "---- System Information ----"

echo "Kernel:"
uname -r

echo
echo "Uptime:"
uptime -p

echo
echo "CPU Load:"
uptime | awk -F'load average:' '{print $2}'


echo
echo "Memory:"
free -h


echo
echo "Disk Usage:"
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Root filesystem usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -ge 90 ]; then
    echo "✗ Disk usage critical"
    ISSUES=$((ISSUES+1))
else
    echo "✓ Disk usage OK"
fi


echo
echo "---- Failed Services ----"

FAILED=$(systemctl --failed --no-legend | grep -v '^.*heartbeat.service')

if [ -z "$FAILED" ]; then
    echo "✓ No failed services"
else
    echo "$FAILED"
    ISSUES=$((ISSUES+1))
fi


echo
echo "---- Heartbeat Status ----"

HEARTBEAT_SUCCESS=$(journalctl -u heartbeat.service \
    --since "10 minutes ago" \
    --no-pager \
    | grep -c "Finished Send server heartbeat to Uptime Kuma.")

if [ "$HEARTBEAT_SUCCESS" -gt 0 ]; then
    echo "✓ Heartbeat successful within the last 10 minutes"
else
    echo "✗ No successful heartbeat within the last 10 minutes"
    ISSUES=$((ISSUES+1))
fi


echo
echo "---- Docker Status ----"

if systemctl is-active --quiet docker; then
    echo "✓ Docker service running"
else
    echo "✗ Docker service down"
    ISSUES=$((ISSUES+1))
fi


RUNNING_CONTAINERS=$(docker ps -q | wc -l)

echo "Running containers: $RUNNING_CONTAINERS"


echo
echo "---- Important Services ----"

SERVICES=(
    sshd
    caddy
    cloudflared
)

for SERVICE in "${SERVICES[@]}"; do

    if systemctl is-active --quiet "$SERVICE"; then
        echo "✓ $SERVICE running"
    else
        echo "✗ $SERVICE stopped"
        ISSUES=$((ISSUES+1))
    fi

done


echo
echo "===================================="

if [ "$ISSUES" -eq 0 ]; then

    echo "STATUS: HEALTHY"
    echo "Issues detected: 0"

    echo "===================================="

    exit 0

else

    echo "STATUS: WARNING"
    echo "Issues detected: $ISSUES"

    echo "===================================="

    exit 1

fi
