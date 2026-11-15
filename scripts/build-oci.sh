#!/usr/bin/env bash
set -euo pipefail

ARCH="x86_64"
REGISTRY="ghcr.io/velociraptor-os/velociraptor"
TAG="${1:-latest}"
OUT_DIR="./out/oci"

echo "==> Building velociraptor (${ARCH}) via BuildStream 2"
bst -o arch "${ARCH}" build oci/bootc-image.bst

rm -rf "${OUT_DIR}"
mkdir -p "${OUT_DIR}"
bst -o arch "${ARCH}" artifact checkout --directory "${OUT_DIR}" oci/bootc-image.bst

echo "==> Checked out OCI image layout at: ${OUT_DIR}"

if command -v skopeo >/dev/null 2>&1 && [[ "${PUSH:-0}" == "1" ]]; then
  echo "==> Pushing oci:${OUT_DIR} to docker://${REGISTRY}:${TAG}"
  skopeo copy "oci:${OUT_DIR}" "docker://${REGISTRY}:${TAG}"
fi
