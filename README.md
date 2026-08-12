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

## Docker Usage

The Dockerfile uses the `python:3.11-slim` base image.

To build the Docker image:

```bash
docker build -t devops-intern-final .
