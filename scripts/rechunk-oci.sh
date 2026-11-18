#!/usr/bin/env bash
set -euo pipefail

IN_OCI="${1:-./out/oci}"
OUT_OCI="${2:-./out/oci-rechunked}"
TARGET_LAYERS="${TARGET_LAYERS:-120}"

rm -rf "${OUT_OCI}"
mkdir -p "${OUT_OCI}"

echo "==> Rechunking ${IN_OCI} into up to ${TARGET_LAYERS} OCI layers for velociraptor"
if command -v chunkah >/dev/null 2>&1; then
  chunkah rechunk --max-layers "${TARGET_LAYERS}" "${IN_OCI}" "${OUT_OCI}"
else
  cp -a "${IN_OCI}/." "${OUT_OCI}/"
fi

echo "==> Running bootc container lint validation"
if command -v podman >/dev/null 2>&1; then
  podman run --rm "oci:${OUT_OCI}" bootc container lint
fi
