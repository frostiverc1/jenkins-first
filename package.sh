cat > package.sh << 'EOF'
#!/usr/bin/env bash
set -e

echo "[PACKAGE] Packaging dist folder"

if [ ! -d dist ]; then
  echo "[PACKAGE] dist directory not found. Did build run?"
  exit 1
fi

mkdir -p artifacts
tar czf artifacts/app.tar.gz dist

echo "[PACKAGE] Created artifacts/app.tar.gz"
EOF
