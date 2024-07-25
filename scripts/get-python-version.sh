#!/bin/bash

help() {
  cat << EOF
Get Python version expected by project.

Usage:
  $(basename "$0")
EOF
}

case $1 in -h | --help | help) help && exit ;; esac

set -euo pipefail

sed -n 's/python = "\^\([0-9.]*\)"$/\1/p' pyproject.toml
