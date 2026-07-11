#!/usr/bin/env bash
set -euo pipefail

GIT_COMMIT=$(git log -1 --format=%h 2>/dev/null || echo "unknown")
APP_VERSION=$(git describe --tags --always --dirty 2>/dev/null || echo "0.0.0")
BUILD_DATE=$(date +"%m-%d-%Y %H:%M %p %Z")

# 🎯 Sanitized version for Docker tags (NO + allowed!)
# Replace + with - and ensure tag is valid
DOCKER_TAG="${APP_VERSION//+/-}"

cat > VERSION << EOF
${APP_VERSION}
${BUILD_DATE}
EOF

docker build \
  --build-arg APP_VERSION="$APP_VERSION" \
  --build-arg APP_BUILD_DATE="$(date -u +"%Y-%m-%d")" \
  --build-arg GIT_COMMIT="$GIT_COMMIT" \
  -t rubydev1.fjrg.net/friends:"$DOCKER_TAG" \
  -t rubydev1.fjrg.net/friends:latest \
  .

docker push rubydev1.fjrg.net/friends:"$DOCKER_TAG"
docker push rubydev1.fjrg.net/friends:latest
echo "✅ Push complete"

echo "🔑 Built git commit: ${GIT_COMMIT}"
echo "✅ APP version: ${APP_VERSION}"
echo "🏷️ Docker tag: ${DOCKER_TAG}"
echo "📅 Build Date: ${BUILD_DATE}"



