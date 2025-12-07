#!/usr/bin/env bash
set -e

echo "[BUILD] Starting build for jenkins-first"
echo "[BUILD] Workspace: $(pwd)"

mkdir -p dist
echo "Hello from build at $(date)" > dist/app.txt

echo "[BUILD] Build finished. Files in dist:"
ls -R dist
