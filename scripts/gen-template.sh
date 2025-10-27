#!/bin/sh
set -e

TEMPLATE_PATH="templates/basic"

echo "📁 Specify the path to generate the project, relative to the repo root:"
read -r GEN_PATH

if [ -z "$GEN_PATH" ]; then
  echo "❌ Error: Path cannot be empty."
  exit 1
fi

FULL_GEN_PATH=$(realpath "$GEN_PATH")
FULL_TEMPLATE_PATH=$(realpath "$TEMPLATE_PATH")

# Check if template path exists
if [ ! -d "$FULL_TEMPLATE_PATH" ]; then
  echo "❌ Error: Template path does not exist: $FULL_TEMPLATE_PATH"
  exit 1
fi

echo "🚀 Generating project in: $FULL_GEN_PATH"

# Run cookiecutter and capture output/errors
if ! ./scripts/cookiecutter.sh "$FULL_TEMPLATE_PATH" -o "$FULL_GEN_PATH" 2>&1; then
  echo ""
  echo "❌ Error: Failed to generate project. Please check the errors above."
  
  # Check if partial output was created
  if [ -d "$FULL_GEN_PATH" ]; then
    echo "⚠️  Warning: Partial output found in $FULL_GEN_PATH"
    echo "💡 Tip: Remove the directory manually if needed: rm -rf $FULL_GEN_PATH"
  fi
  
  exit 1
fi

echo ""
echo "✅ Project generated successfully!"
