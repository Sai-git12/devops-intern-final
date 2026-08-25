$NomadAddr = "http://127.0.0.1:4646"

Write-Host "Scanning Nomad jobs..."

$jobs = Invoke-RestMethod -Uri "$NomadAddr/v1/jobs"

foreach ($job in $jobs) {
    $jobId = $job.ID
    Write-Host "Checking job: $jobId"

    $details = Invoke-RestMethod -Uri "$NomadAddr/v1/job/$jobId"

    foreach ($group in $details.TaskGroups) {
        foreach ($task in $group.Tasks) {

            if ($task.Driver -eq "docker") {
                Write-Host "Docker task found: $($task.Name)"

                if ($task.Config.volumes) {
                    foreach ($volume in $task.Config.volumes) {
                        Write-Host "Docker volume: $volume"
                    }
                }
            }
        }
    }
}

Write-Host "Nomad job scan completed."