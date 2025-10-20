#!/bin/bash
set -e
BACKUP_DIR="{{ backup_dir }}/incremental"
mkdir -p "$BACKUP_DIR"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
pg_basebackup -U postgres -D "$BACKUP_DIR/base_$TIMESTAMP" -Ft -z -Xs -P
find "$BACKUP_DIR" -type f -mtime +3 -delete
