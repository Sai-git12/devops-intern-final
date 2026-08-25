#!/bin/bash

NOMAD_ADDR="http://127.0.0.1:4646"

echo "Scanning Nomad jobs..."

curl -s "$NOMAD_ADDR/v1/jobs" |
jq -r '.[].ID' |
while read -r JOB_ID
do
    echo "Checking job: $JOB_ID"

    curl -s "$NOMAD_ADDR/v1/job/$JOB_ID" |
    jq -r '
        .TaskGroups[]?.Tasks[]?
        | select(.Driver == "docker")
        | .Config.volumes[]?
    '
done

echo "Nomad job scan completed."