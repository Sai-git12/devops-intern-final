# DevOps Internship Final Project

## Project Description

This repository contains my DevOps internship final project. It demonstrates containerization, Python application execution, monitoring setup, Nomad configuration, system information scripting, and CI automation using GitHub Actions.

## Author

Name: Sai Lakshmi

## Date

August 12, 2026

## Technologies Used

- Python 3.11
- Docker
- Git
- GitHub
- GitHub Actions
- HashiCorp Nomad
- Grafana Loki
- Bash/Shell scripting

## Project Structure

### `.github/workflows/ci.yml`

Contains the GitHub Actions CI pipeline. The workflow runs when changes are pushed to the `main` branch. It checks out the repository, sets up Python 3.11, and runs `hello.py`.

### `monitoring/loki_setup.txt`

Contains setup information for Loki-based monitoring.

### `nomad/hello.nomad`

Contains the Nomad job configuration used for the project.

### `scripts/sysinfo.sh`

A shell script used to collect and display system information.

### `Dockerfile`

Defines how the Docker image is created. It uses Python 3.11-slim, creates an `/app` working directory, copies `hello.py` into the container, and runs the Python application when the container starts.

### `hello.py`

Python application file executed directly and also through the Docker container and CI pipeline.

## Git and GitHub Usage

Git and GitHub are used for version control and project management. Project files are stored in the GitHub repository, and changes are committed to the main branch.

## GitHub Actions CI Pipeline

The CI pipeline is configured in `.github/workflows/ci.yml`.

The pipeline:

1. Runs when changes are pushed to the `main` branch.
2. Uses an Ubuntu runner.
3. Checks out the repository.
4. Sets up Python 3.11.
5. Runs `hello.py`.

## Monitoring

The `monitoring/loki_setup.txt` file contains the setup information for Loki-based monitoring.

## Nomad

The `nomad/hello.nomad` file contains the Nomad job configuration used in the project.

## Setup and Run

### Run the Python application

```bash
python hello.py
```

### Run with Docker

```bash
docker build -t devops-intern-final .
```

```bash
docker run --rm devops-intern-final
```

### Run CI Pipeline

Push changes to the `main` branch. The GitHub Actions workflow will automatically run.

## Work Completed

- Created a Python application.
- Created a Dockerfile to containerize the application.
- Added GitHub Actions CI automation.
- Added Loki monitoring setup documentation.
- Added Nomad job configuration.
- Added a Linux system information script.
- Used Git and GitHub for version control.
- Added project documentation and usage instructions.

## Internship Submission

This repository contains my completed DevOps internship project, including the application, Docker configuration, CI pipeline, monitoring documentation, Nomad configuration, scripts, and project documentation.
