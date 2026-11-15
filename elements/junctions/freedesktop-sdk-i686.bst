kind: junction

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: freedesktop-sdk-25.08.0
  ref: freedesktop-sdk-25.08.0-0-g8a14c2e9f0b1

config:
  options:
    target_arch: i686
    bootstrap_build_arch: x86_64
