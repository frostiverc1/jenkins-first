#!/usr/bin/env bash
set -e

echo "[BUILD] Creating or reusing virtual environment"

# Create venv if missing
if [ ! -d ".venv" ]; then
  python3 -m venv .venv
fi

# Activate virtual environment
. .venv/bin/activate

echo "[BUILD] Installing dependencies"
pip install --upgrade pip
pip install -r requirements.txt

echo "[BUILD] Compiling Python files"
python -m compileall app

echo "[BUILD] Build complete"
