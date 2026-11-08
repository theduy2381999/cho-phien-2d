#!/usr/bin/env bash
# Deploy the game to Netlify: https://chophien.netlify.app
# Usage: ./deploy.sh "note for this deploy"
set -euo pipefail
cd "$(dirname "$0")"

SITE_ID="d51d9126-9fa0-4806-b769-648a8016712f"   # the chophien site
mkdir -p dist
cp index.html dist/index.html

netlify deploy --prod --dir dist --site "$SITE_ID" --message "${1:-Update game}"
