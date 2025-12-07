#!/usr/bin/env bash
set -e

echo "[PACKAGE] Packaging app source"

if [ ! -d app ]; then
  echo "[PACKAGE] app directory not found"
  exit 1
fi

mkdir -p artifacts

tar czf artifacts/app-source.tar.gz app tests requirements.txt

echo "[PACKAGE] Created artifacts/app-source.tar.gz"
