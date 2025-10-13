#!/bin/bash
set -e

LATEST_BACKUP=$(ls -t {{ backup_dir }}/full/*.sql.gz | head -n 1)
if [ -z "$LATEST_BACKUP" ]; then
  echo "No backup found!"
  exit 1
fi

echo "Restoring from $LATEST_BACKUP..."
gunzip -c "$LATEST_BACKUP" | psql -U postgres
echo "Restore complete."
