#!/bin/zsh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude ".osx" \
        --exclude "backup.sh" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude "LICENSE-MIT.txt" \
        -avh --no-perms . ~;
    source ~/.zshrc;
}

read REPLY\?"This may overwrite existing files in your home directory. Are you sure? (y/n) "
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
fi;

unset doIt;
