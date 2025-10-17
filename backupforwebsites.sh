#!/bin/bash

# -----------------------------------------
# Backup for Websites - Created by Azan Sagheer
# -----------------------------------------


SRC=${1:-/var/www}
DEST=${2:-/etc/backupofsites_$(date +%Y-%m-%d_%H-%M-%S).tar.gz}
LOGFILE='backup.log'
EMAIL='ChughtaiAzan97@gmail.com'
CLOUD_REMOTE='mydrive:backups'

echo "-----------------------------------------" | tee -a "$LOGFILE"
echo "Backup Script Started: $(date)" | tee -a "$LOGFILE"
echo "Source: $SRC" | tee -a "$LOGFILE"
echo "Destination: $DEST" | tee -a "$LOGFILE"

create_backup() {
    echo "Creating backup..." | tee -a "$LOGFILE"
    if sudo tar -czf "$DEST" "$SRC"; then
        echo "Backup created successfully at $DEST" | tee -a "$LOGFILE"
    else
        echo "Backup FAILED!" | tee -a "$LOGFILE"
        exit 1
    fi
}

send_email() {
    echo "Sending email notification..." | tee -a "$LOGFILE"
    echo -e "Subject: Backup Completed\n\nBackup created successfully at $DEST" | msmtp "$EMAIL"
    echo "Email sent to $EMAIL" | tee -a "$LOGFILE"
}

upload_cloud() {
    echo "Uploading backup to cloud..." | tee -a "$LOGFILE"
    CLOUD_DEST="$CLOUD_REMOTE/$(basename "$DEST")"
    if rclone copy "$DEST" "$CLOUD_DEST"; then
        echo "Backup uploaded to cloud at $CLOUD_DEST" | tee -a "$LOGFILE"
    else
        echo "Cloud upload FAILED!" | tee -a "$LOGFILE"
    fi
}

rotate_backups() {
    echo "Rotating old backups (keep last 5)..." | tee -a "$LOGFILE"
    sudo find /etc/ -name "backupofsites_*.tar.gz" -type f -mtime +5 -exec rm -f {} \;
    echo "Old backups rotated." | tee -a "$LOGFILE"
}

create_backup
send_email
upload_cloud
rotate_backups

echo "Backup Script Completed: $(date)" | tee -a "$LOGFILE"
echo "-----------------------------------------" | tee -a "$LOGFILE"

