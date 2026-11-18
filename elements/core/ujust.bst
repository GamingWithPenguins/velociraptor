kind: manual

description: |
  End-user just/ujust command runner and curated maintenance recipes for velociraptor.

sources:
- kind: git_repo
  url: github:casey/just.git
  track: "1.*"
  ref: 1.40.0-0-g8e1a2b3c4d5f
- kind: cargo2
- kind: local
  path: files/usr/bin/ujust
- kind: local
  path: files/usr/share/velociraptor/just/10-system.just

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: components/rust.bst
- core/base-platform.bst

runtime-depends:
- core/base-platform.bst

config:
  build-commands:
  - |
    cargo build --release --offline --bin just
  install-commands:
  - |
    install -Dm755 target/release/just "%{install-root}%{bindir}/just"
    install -Dm755 ujust "%{install-root}%{bindir}/ujust"
    install -Dm644 10-system.just "%{install-root}%{datadir}/velociraptor/just/10-system.just"
