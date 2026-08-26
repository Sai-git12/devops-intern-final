#!/bin/bash

S3_BUCKET="nomad-backup-sai-2026"
BACKUP_DIR="/tmp/nomad-backups"

mkdir -p "$BACKUP_DIR"

echo "Scanning Nomad jobs across all namespaces..."

NAMESPACES=$(curl -s http://127.0.0.1:4646/v1/namespaces | jq -r '.[].Name')

for NAMESPACE in $NAMESPACES
do
    echo "Processing namespace: $NAMESPACE"

    JOBS=$(curl -s "http://127.0.0.1:4646/v1/jobs?namespace=$NAMESPACE" | jq -r '.[].ID')

    for JOB in $JOBS
    do
        echo "Processing job: $JOB"

        JOB_JSON="$BACKUP_DIR/${NAMESPACE}_${JOB}.json"

        curl -s \
            "http://127.0.0.1:4646/v1/job/$JOB?namespace=$NAMESPACE" \
            > "$JOB_JSON"

        jq -r '
            .TaskGroups[]?.Tasks[]?
            | select(.Driver == "docker")
            | .Config.volumes[]?
        ' "$JOB_JSON" | while read VOLUME
        do
            HOST_PATH=$(echo "$VOLUME" | cut -d ":" -f 1)

            if [ -d "$HOST_PATH" ]; then
                ARCHIVE="$BACKUP_DIR/${NAMESPACE}_${JOB}.tar"

                echo "Archiving volume: $HOST_PATH"

                tar -cf "$ARCHIVE" "$HOST_PATH"

                aws s3 cp "$ARCHIVE" \
                    "s3://${S3_BUCKET}/backups/${NAMESPACE}_${JOB}.tar"

                echo "Backup uploaded for: $JOB"
            else
                echo "Volume path not found: $HOST_PATH"
            fi
        done

        rm -f "$JOB_JSON"
    done
done

echo "All Nomad volume backups completed."