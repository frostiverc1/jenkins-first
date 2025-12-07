#!/usr/bin/env bash
set -e

echo "[LINT] Activating virtual environment"
. .venv/bin/activate

echo "[LINT] Running flake8 on app"

