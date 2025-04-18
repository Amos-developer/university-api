 #!/bin/bash

LOG_FILE="/var/log/update.log"

API_DIR="/var/www/html/university-api"

echo "===== UPDATE STARTED at $(date) =====" >> "$LOG_FILE"

echo "[INFO] Running apt update and upgrade..." >> "$LOG_FILE"
sudo apt update && sudo apt upgrade -y >> "$LOG_FILE" 2>&1

if [ -d "$API_DIR" ]; then
    cd "$API_DIR"
    
    echo "[INFO] Pulling latest changes from GitHub..." >> "$LOG_FILE"
    git pull origin main >> "$LOG_FILE" 2>&1

    if [ $? -ne 0 ]; then
        echo "[ERROR] Git pull failed. Aborting update." >> "$LOG_FILE"
        echo "===== UPDATE FAILED at $(date) =====" >> "$LOG_FILE"
        exit 1
    fi
else
    echo "[ERROR] API directory $API_DIR does not exist." >> "$LOG_FILE"
    echo "===== UPDATE FAILED at $(date) =====" >> "$LOG_FILE"
    exit 1
fi

echo "[INFO] Restarting Apache server..." >> "$LOG_FILE"
sudo systemctl restart apache2 >> "$LOG_FILE" 2>&1

echo "[INFO] Update completed successfully." >> "$LOG_FILE"
echo "===== UPDATE FINISHED at $(date) =====" >> "$LOG_FILE"

