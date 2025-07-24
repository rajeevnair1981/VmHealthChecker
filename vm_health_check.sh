#!/bin/bash

# Threshold for healthy VM (if < 60% used, it's healthy)
THRESHOLD=60

# Get CPU usage (average over 1 minute, all CPUs)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_USAGE_INT=${CPU_USAGE%.*}

# Get Memory usage (percentage used)
MEMORY_USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')
MEMORY_USAGE_INT=$MEMORY_USAGE

# Get Disk usage (use / partition, percentage used)
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
DISK_USAGE_INT=$DISK_USAGE

# Print current values
echo "Current Usage:"
echo "CPU Usage:    $CPU_USAGE_INT%"
echo "Memory Usage: $MEMORY_USAGE_INT%"
echo "Disk Usage:   $DISK_USAGE_INT%"

# Determine health
if [ "$CPU_USAGE_INT" -lt "$THRESHOLD" ] && [ "$MEMORY_USAGE_INT" -lt "$THRESHOLD" ] && [ "$DISK_USAGE_INT" -lt "$THRESHOLD" ]; then
    echo "VM Health: HEALTHY"
else
    echo "VM Health: UNHEALTHY"
fi
