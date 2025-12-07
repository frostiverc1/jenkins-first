cat > lint.sh << 'EOF'
#!/usr/bin/env bash
set -e

echo "[LINT] Running fake lint checks"
sleep 1
echo "[LINT] All good. No issues found."
EOF
