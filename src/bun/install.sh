#!/bin/bash
set -e

die() { echo "$*" 1>&2 ; exit 1; }

# The 'install.sh' entrypoint script is always executed as the root user.
#
LOCAL_INSTALL=0
which curl > /dev/null || (apt update && apt install curl -y -qq)
which unzip > /dev/null || (apt update && apt install unzip -y -qq)

curl -fsSL https://bun.sh/install | bash

test -f ~/.bashrc && source ~/.bashrc 

BUN_INSTALL=`which bun` || die "bun install location not found!"

if [ $LOCAL_INSTALL -gt 0 ] ; then
    echo "bun is installed at $BUN_INSTALL"
    cp -a "$BUN_INSTALL" "/usr/local/bin/bun"
else
    if [ "$BUN_INSTALL" != "/usr/bin/bun" ] && [ "$BUN_INSTALL" != "/usr/local/bin/bun" ] ; then
        cp -a "$BUN_INSTALL" "/usr/local/bin/bun"
    fi
fi

echo '# bun' >> /etc/bash.bashrc
echo 'export BUN_INSTALL="$HOME/.bun"' >> /etc/bash.bashrc
echo 'export PATH=$BUN_INSTALL/bin:$PATH' >> /etc/bash.bashrc


