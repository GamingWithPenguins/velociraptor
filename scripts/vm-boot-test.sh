#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-boot-test}"
OCI_DIR="./out/oci-rechunked"
[[ -d "${OCI_DIR}" ]] || OCI_DIR="./out/oci"

echo "==> Running velociraptor VM mode: ${MODE}"
case "${MODE}" in
  boot-fast)
    exec bcvk ephemeral run-ssh --virtiofs "oci:${OCI_DIR}"
    ;;
  boot-test)
    bcvk ephemeral run --timeout 180 "oci:${OCI_DIR}" -- \
      "systemctl is-system-running --wait && bootc status"
    ;;
  disk)
    mkdir -p ./out/disk
    bootc install to-disk --via-loopback "./out/disk/velociraptor.raw"
    exec qemu-system-x86_64 -enable-kvm -m 4096 -smp 4 \
      -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2/ovmf/OVMF_CODE.fd \
      -drive format=raw,file="./out/disk/velociraptor.raw"
    ;;
  *)
    echo "Usage: $0 [boot-fast|boot-test|disk]" >&2
    exit 1
    ;;
esac
