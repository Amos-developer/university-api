 #!/bin/bash

API_BASE_URL="http://16.171.20.107"

LOG_FILE="/var/log/server_health.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] Running health check..." >> $LOG_FILE

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "CPU Usage: $CPU_USAGE%" >> $LOG_FILE

MEMORY_USAGE=$(free | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100.0}')
echo "Memory Usage: $MEMORY_USAGE%" >> $LOG_FILE

DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
echo "Disk Usage: $DISK_USAGE%" >> $LOG_FILE

if systemctl is-active --quiet apache2; then
    echo "Apache server is running." >> $LOG_FILE
else
    echo "WARNING: Apache server is NOT running!" >> $LOG_FILE
fi

check_endpoint() {
    ENDPOINT=$1
    STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$API_BASE_URL/$ENDPOINT")

    if [ "$STATUS_CODE" -eq 200 ]; then
        echo "Endpoint /$ENDPOINT is OK (200)" >> $LOG_FILE
    else
        echo "WARNING: Endpoint /$ENDPOINT returned status $STATUS_CODE" >> $LOG_FILE
    fi
}

check_endpoint "students.php"
check_endpoint "subjects.php"

if [ "$DISK_USAGE" -ge 90 ]; then
    echo "WARNING: Disk usage is above 90%!" >> $LOG_FILE
fi

echo "Health check completed." >> $LOG_FILE
echo "----------------------------------------" >> $LOG_FILE

