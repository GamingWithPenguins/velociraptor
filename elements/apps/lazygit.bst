kind: manual

description: |
  Lazygit terminal UI for git (jesseduffield/lazygit) integrated with Neovim.

sources:
- kind: tar
  url: github:jesseduffield/lazygit/releases/download/v0.48.0/lazygit_0.48.0_Linux_x86_64.tar.gz
  ref: 8c1e4a92b07d3f51e62c84a19d0b2f73c51a8e09d4b2c71f60a3e891b2d4c501

build-depends:
- core/base-platform.bst

runtime-depends:
- core/base-platform.bst
- apps/neovim.bst

config:
  install-commands:
  - |
    install -Dm755 lazygit "%{install-root}%{bindir}/lazygit"
