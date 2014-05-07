#!/bin/bash
set -x
set -e

export WORKSPACE=$HOME/zerovm-cli
export GITURL=$1
export BRANCH=$2

sudo apt-get update
sudo apt-get install --yes --force-yes python-software-properties
# install non-standard python versions:
sudo add-apt-repository ppa:fkrull/deadsnakes
sudo apt-get install --yes --force-yes python-pip python3.2 python3.3 python3.4
sudo pip install tox

git clone $GITURL/zerovm-cli.git $WORKSPACE
cd $WORKSPACE
git fetch origin +refs/pull/*:refs/remotes/origin/pr/*
git checkout $BRANCH

tox
