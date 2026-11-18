arch := "x86_64"
registry := "ghcr.io/velociraptor-os/velociraptor"

default:
  @just --list

validate:
  bst -o arch {{arch}} show --deps all --format '%{name} (%{kind})' oci/bootc-image.bst

lint:
  ./scripts/rechunk-oci.sh ./out/oci ./out/oci-rechunked

track:
  ./scripts/bootstrap-track.sh

build:
  ./scripts/build-oci.sh latest

rechunk:
  ./scripts/rechunk-oci.sh ./out/oci ./out/oci-rechunked

gen-dev-keys:
  ./scripts/gen-dev-keys.sh

boot-fast:
  ./scripts/vm-boot-test.sh boot-fast

boot-test:
  ./scripts/vm-boot-test.sh boot-test

show-me-the-future: build rechunk
  ./scripts/vm-boot-test.sh disk

push tag="latest": rechunk
  PUSH=1 ./scripts/build-oci.sh {{tag}}

shell element="desktop/umbriel.bst":
  bst -o arch {{arch}} shell {{element}}

show-closure:
  bst show --deps all --format '%{name} (%{kind})' oci/bootc-image.bst
