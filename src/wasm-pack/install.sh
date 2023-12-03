#!/bin/sh
set -e

# The 'install.sh' entrypoint script is always executed as the root user.
#

curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh