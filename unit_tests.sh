cat > unit_tests.sh << 'EOF'
#!/usr/bin/env bash
set -e

echo "[TEST] Running fake unit tests"

mkdir -p reports

cat > reports/junit.xml << 'XML'
<testsuite name="example-tests" tests="2" failures="0" errors="0" skipped="0">
    <testcase classname="example.Class1" name="testOne"/>
    <testcase classname="example.Class1" name="testTwo"/>
</testsuite>
XML

echo "[TEST] Tests finished, JUnit report written to reports/junit.xml"
EOF
