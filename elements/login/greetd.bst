kind: manual

description: |
  greetd minimal login daemon built offline via freedesktop-sdk rust.bst + cargo2.

sources:
- kind: git_repo
  url: github:kennylevinsen/greetd.git
  track: 0.10.*
  ref: 0.10.3-0-g82e4d1c90b22
- kind: cargo2

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: components/rust.bst
- core/base-platform.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/linux-pam.bst

runtime-depends:
- core/base-platform.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/linux-pam.bst

config:
  build-commands:
  - |
    cargo build --release --offline
  install-commands:
  - |
    install -Dm755 target/release/greetd "%{install-root}%{bindir}/greetd"
    install -Dm755 target/release/agreety "%{install-root}%{bindir}/agreety"
    install -Dm644 greetd.service "%{install-root}%{libdir}/systemd/system/greetd.service"
    mkdir -p "%{install-root}/etc/greetd"
