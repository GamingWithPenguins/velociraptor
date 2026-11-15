#!/usr/bin/env bash
set -euo pipefail

ARCH="x86_64"

echo "==> Step 1: Tracking BuildStream junctions (freedesktop-sdk, i686 compat & plugins)"
bst -o arch "${ARCH}" source track \
  junctions/freedesktop-sdk.bst \
  junctions/freedesktop-sdk-i686.bst \
  junctions/buildstream-plugins.bst \
  junctions/bst-plugins-community.bst

echo "==> Step 2: Tracking all upstream git_repo, tar, and cargo2 sources across velociraptor"
bst -o arch "${ARCH}" source track --deps all oci/bootc-image.bst

echo "==> All element refs and Cargo.lock crate checksums are now pinned for GitHub publication."
