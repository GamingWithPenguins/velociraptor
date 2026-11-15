kind: manual

description: |
  bootc transactional OCI host manager built via freedesktop-sdk rust.bst + cargo2 (Dakotaraptor pattern).

sources:
- kind: git_repo
  url: github:bootc-dev/bootc.git
  track: v1.*
  ref: v1.1.6-0-g3b7c82a1e5f0
- kind: cargo2

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: components/rust.bst
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-make.bst
- core/base-platform.bst
- deps/system-plumbing.bst

runtime-depends:
- core/kernel.bst
- core/bootloader.bst
- deps/system-plumbing.bst

config:
  build-commands:
  - |
    cargo build --release --offline --bin bootc
  install-commands:
  - |
    make install-all DESTDIR="%{install-root}" PREFIX="%{prefix}"
