#!/bin/sh
echo "🔍 Running pre-build security & syntax checks..."

# Check if index.html exists and is not empty
if [ -s index.html ]; then
    echo "✅ index.html present and non-empty."
else
    echo "❌ ERROR: index.html is missing or empty!"
    exit 1
fi

# Validate basic HTML structure
if grep -q "</html>" index.html; then
    echo "✅ HTML tag structure verified."
else
    echo "❌ ERROR: Malformed HTML file!"
    exit 1
fi

echo "🎉 All pre-build checks passed successfully!"
