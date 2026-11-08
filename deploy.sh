#!/usr/bin/env bash
# Deploy the game to Netlify: https://cho-phien-2d.netlify.app
# Usage: ./deploy.sh "note for this deploy"
set -euo pipefail
cd "$(dirname "$0")"

SITE_ID="ae85e4d6-0f16-497c-9878-4a1ce51a983d"   # the cho-phien-2d site
mkdir -p dist
cp index.html dist/index.html

netlify deploy --prod --dir dist --site "$SITE_ID" --message "${1:-Update game}"
