#!/usr/bin/env bash
set -euo pipefail

KEY_DIR="./keys"
mkdir -p "${KEY_DIR}"

if [[ -f "${KEY_DIR}/MOK.key" ]]; then
  echo "==> Secure Boot dev keys already exist in ${KEY_DIR}"
  exit 0
fi

echo "==> Generating velociraptor Secure Boot MOK development keypair"
openssl req -new -x509 -newkey rsa:2048 -nodes -days 3650 \
  -subj "/CN=velociraptor Secure Boot Dev MOK/" \
  -keyout "${KEY_DIR}/MOK.key" \
  -out "${KEY_DIR}/MOK.pem"

openssl x509 -outform DER -in "${KEY_DIR}/MOK.pem" -out "${KEY_DIR}/MOK.der"
echo "==> Wrote ${KEY_DIR}/MOK.{key,pem,der}"
