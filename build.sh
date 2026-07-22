#!/usr/bin/env bash
set -euo pipefail
rm -rf dist && mkdir -p dist
for d in assets css js images img fonts media api docs; do [ -d "$d" ] && cp -R "$d" dist/; done
cp ./*.html dist/ 2>/dev/null || true
for f in robots.txt sitemap.xml favicon.ico _headers manifest.json; do [ -f "$f" ] && cp "$f" dist/; done
echo "dist: $(find dist -type f | wc -l | tr -d ' ') files"
