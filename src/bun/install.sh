#!/bin/bash
set -e

die() { echo "$*" 1>&2 ; exit 1; }

# The 'install.sh' entrypoint script is always executed as the root user.
#
LOCAL_INSTALL=0
which curl > /dev/null || (apt update && apt install curl -y -qq)
which unzip > /dev/null || (apt update && apt install unzip -y -qq)

export BUN_INSTALL=/usr/local

curl -fsSL https://bun.sh/install | bash

test -f ~/.bashrc && source ~/.bashrc 

echo '# bun' >> /etc/bash.bashrc
echo 'export BUN_INSTALL="$HOME/.bun"' >> /etc/bash.bashrc
echo 'export PATH=$BUN_INSTALL/bin:$PATH' >> /etc/bash.bashrc


