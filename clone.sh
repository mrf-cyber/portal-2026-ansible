#!/bin/bash
# Clone Portal Admin repo using deploy key
set -e

REPO="git@github.com:mrf-cyber/portal-2026-react.git"
DEST="/home/sistemas/clone/portal-2026-react"
KEY="$HOME/.ssh/repo-deploy-key-react"

if [ -d "$DEST" ]; then
    echo "Directory $DEST already exists. Pulling latest..."
    GIT_SSH_COMMAND="ssh -i $KEY" git -C "$DEST" pull origin main
else
    echo "Cloning repo..."
    mkdir -p /home/sistemas/clone
    GIT_SSH_COMMAND="ssh -i $KEY" git clone "$REPO" "$DEST"
fi

echo "Done: $DEST"
