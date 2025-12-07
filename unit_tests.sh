#!/usr/bin/env bash
set -e

echo "[TEST] Activating virtual environment"
. .venv/bin/activate

echo "[TEST] Setting PYTHONPATH to project root"
export PYTHONPATH="$PWD"

echo "[TEST] Running pytest"
mkdir -p reports

pytest \
  --junitxml=reports/junit.xml \
  tests
