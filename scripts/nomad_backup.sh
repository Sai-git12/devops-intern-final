#!/bin/bash

# S3 bucket name
S3_BUCKET="nomad-backup-sai-2026"

# Backup directory
BACKUP_DIR="/tmp/nomad-backups"

mkdir -p "$BACKUP_DIR"

echo "Scanning Nomad jobs..."

nomad job status -short | tail -n +2 | awk '{print $1}' | while read JOB
do
    echo "Processing job: $JOB"

    nomad job inspect "$JOB" > "$BACKUP_DIR/${JOB}.json"

    aws s3 cp "$BACKUP_DIR/${JOB}.json" \
        "s3://${S3_BUCKET}/backups/${JOB}.json"

    echo "Backup completed for: $JOB"
done

echo "All Nomad job backups completed."