if [[ -n "${1:-}" ]]; then
  APP_VERSION="$1"
  echo "📦 Using provided version: ${APP_VERSION}"
else
  APP_VERSION=$(git describe --tags --always --dirty 2>/dev/null || echo "0.0.0")
  echo "🔍 Using git describe: ${APP_VERSION}"
fi

BUILD_DATE=$(date +"%m-%d-%Y %I:%M %p %Z")

# 🎯 Sanitized version for Docker tags (NO + allowed!)
# Replace + with - and ensure tag is valid
DOCKER_TAG="${APP_VERSION}"
DOCKER_TAG="${DOCKER_TAG//+/-}"

echo "✅ Built version: ${APP_VERSION}"
echo "🏷️ Docker tag: ${DOCKER_TAG}"
echo "✅ Built Date: ${BUILD_DATE}"

cat > VERSION << EOF
${APP_VERSION}
${BUILD_DATE}
EOF
