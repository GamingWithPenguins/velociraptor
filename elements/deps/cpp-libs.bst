kind: cmake

description: |
  C++ ecosystem libraries (sdbus-cpp, tomlplusplus, nlohmann-json, md4c) for Noctalia v5 & Umbriel portal.

sources:
- kind: git_repo
  url: github:Kistler-Group/sdbus-cpp.git
  track: v2.*
  ref: v2.1.0-0-g62f8c9a1d402
- kind: git_repo
  url: github:marzer/tomlplusplus.git
  directory: thirdparty/tomlplusplus
  track: v3.*
  ref: v3.4.0-0-g91b2e4d8c311
- kind: git_repo
  url: github:nlohmann/json.git
  directory: thirdparty/nlohmann-json
  track: v3.*
  ref: v3.11.3-0-g1c89a0e4f219

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-cmake.bst
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- core/base-platform.bst

runtime-depends:
- core/base-platform.bst

variables:
  cmake-local: >-
    -DSDBUSCPP_BUILD_CODEGEN=ON
    -DCMAKE_CXX_STANDARD=20
