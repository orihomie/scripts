#!/usr/bin/env bash

OS=linux
ARCH=amd64
REPO=
NAME=

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -o|--os)
      OS="$2"
      shift
      shift
      ;;
    -n|--name)
      NAME="$2"
      shift
      shift
      ;;
    -r|--repo)
      REPO="$2"
      shift
      shift
      ;;
    -a|--arch)
      ARCH="$2"
      shift
      shift
      ;;
    -h|--help)
      echo "Usage: install.sh [OPTION]"
      echo ""
      echo "Options:"
      echo "  -o, --os      Operating system (linux/windows, default linux)"
      echo "  -a, --arch    Architecture (amd64 or aarch64, default: amd64)"
      echo "  -n, --name    Tool name, you can find it on release page"
      echo "  -r, --repo    Github repo in a format: owner/repo"
      echo "  -h, --help    Show this help message"
      exit 0
      ;;
    *)
      echo "Invalid option: $key"
      exit 1
      ;;
  esac
done

REL_URL="https://api.github.com/repos/${REPO}/releases/latest"

REL_VER=$(wget -qO - $REL_URL | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')

FULL_NAME="${NAME}-${REL_VER}-${OS}-${ARCH}"

DOWNLOAD_URL="https://github.com/${REPO}/releases/download/v${REL_VER}/${FULL_NAME}.tar.gz"

curl -L --fail --remote-name-all $DOWNLOAD_URL 2>/dev/null
curl -L --fail --remote-name-all "${DOWNLOAD_URL}.sha256sum" 2>/dev/null

sha256sum --check ${FULL_NAME}.tar.gz.sha256sum > /dev/null

rm "${FULL_NAME}.tar.gz.sha256sum"

echo "${FULL_NAME}.tar.gz"
