#!/usr/bin/env bash
# Deploy game lên Netlify: https://cho-phien-2d.netlify.app
# Cách dùng: ./deploy.sh "ghi chú cho lần deploy"
set -euo pipefail
cd "$(dirname "$0")"

SITE_ID="ae85e4d6-0f16-497c-9878-4a1ce51a983d"   # site cho-phien-2d
mkdir -p dist
cp index.html dist/index.html

netlify deploy --prod --dir dist --site "$SITE_ID" --message "${1:-Cập nhật game}"
