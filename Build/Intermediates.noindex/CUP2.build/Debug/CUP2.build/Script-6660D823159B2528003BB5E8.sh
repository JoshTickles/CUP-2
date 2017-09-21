#!/bin/sh
#!/bin/bash
#
# Sets the version string to a monotonically increased string, based on
# the number of git commits.

set -o errexit
set -o nounset

VERSION=$(git --git-dir="$PROJECT_DIR/.git" --work-tree="$PROJECT_DIR" rev-list master | wc -l)
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $VERSION" "$TARGET_BUILD_DIR/$INFOPLIST_PATH"

