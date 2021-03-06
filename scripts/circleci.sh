#!/usr/bin/env bash

set -e -u
set -o pipefail

source bootstrap.sh
ccache --version
ccache -p || true
ccache --show-stats || true
./configure CXX="ccache clang++ -Qunused-arguments"
make
make test