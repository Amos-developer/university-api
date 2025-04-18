 #!/bin/bash

# === Configuration ===
BACKUP_DIR="/home/ubuntu/backups"
API_DIR="/var/www/html"
DB_NAME="university_db"
DB_USER="root"
DB_PASS=""
LOG_FILE="/var/log/backup.log"
DATE=$(date +%F)

mkdir -p "$BACKUP_DIR"

API_BACKUP_FILE="$BACKUP_DIR/api_backup_$DATE.tar.gz"
tar -czf "$API_BACKUP_FILE" "$API_DIR" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "[$(date)] API files backed up successfully to $API_BACKUP_FILE" >> "$LOG_FILE"
else
    echo "[$(date)] ERROR: Failed to back up API files" >> "$LOG_FILE"
fi

DB_BACKUP_FILE="$BACKUP_DIR/db_backup_$DATE.sql"
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$DB_BACKUP_FILE" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "[$(date)] Database backed up successfully to $DB_BACKUP_FILE" >> "$LOG_FILE"
else
    echo "[$(date)] ERROR: Failed to back up database" >> "$LOG_FILE"
fi

find "$BACKUP_DIR" -type f -mtime +7 -exec rm {} \; >> "$LOG_FILE" 2>&1
echo "[$(date)] Old backups older than 7 days deleted" >> "$LOG_FILE"

