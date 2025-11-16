#!/bin/bash
#Author: Bhavesh Singh Naula
#15/11/2025
# Log file location
LOGFILE="$HOME/system_usage.log"

# Interval in seconds
INTERVAL=5

echo "Starting CPU & Memory monitoring..."
echo "Logging to: $LOGFILE"
echo "Press CTRL + C to stop."

while true
do
    echo "---------------------------------------" >> $LOGFILE
    echo "Timestamp: $(date)" >> $LOGFILE

    # CPU Usage
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    echo "CPU Usage: $CPU%" >> $LOGFILE

    # Memory Usage
    MEM=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
    echo "Memory Usage: $MEM" >> $LOGFILE

    echo "" >> $LOGFILE

    sleep $INTERVAL
done
