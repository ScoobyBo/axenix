#!/bin/bash
set -e

BACKUP_DIR="{{ backup_dir }}/full"
mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
pg_dumpall -U postgres | gzip > "$BACKUP_DIR/full_$TIMESTAMP.sql.gz"
find "$BACKUP_DIR" -type f -mtime +7 -delete
