#!/bin/bash
set -e

# The 'install.sh' entrypoint script is always executed as the root user.
#
which curl > /dev/null || (apt update && apt install curl -y -qq)
if ! which rustup > /dev/null; then   
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
fi

curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

cp -a $HOME/.cargo/bin/wasm-pack /usr/local/bin