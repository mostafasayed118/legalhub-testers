#!/usr/bin/env bash
# Builds the credential-free LegalHub development APK for the Android emulator.
# Called by the workflow as: bash "$GITHUB_WORKSPACE/scripts/build/legalhub.sh"
# Run from the app directory; ARTIFACT is resolved by scripts/build/android.sh.
set -euo pipefail

ROOT=${GITHUB_WORKSPACE:-$PWD}
FLUTTER_VERSION=3.50.0

if ! command -v flutter >/dev/null 2>&1; then
  git clone --depth 1 -b "$FLUTTER_VERSION" https://github.com/flutter/flutter.git "$RUNNER_TEMP/flutter"
  export PATH="$RUNNER_TEMP/flutter/bin:$PATH"
fi
flutter --version

flutter pub get
# Flutter 3.50's gen-l10n template needs the material_ui/cupertino_ui import fix.
[ -f tool/fix_l10n_delegate_imports.dart ] && dart run tool/fix_l10n_delegate_imports.dart

# No key.properties in CI: Gradle still configures the release signing block,
# so the documented debug-signing opt-in is required.
ALLOW_DEBUG_SIGNING=true flutter build apk --debug \
  --flavor development \
  -t lib/main_development.dart \
  --target-platform android-x64
