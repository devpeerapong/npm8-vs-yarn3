#!/bin/sh

cd app

INPUT=$1
case $INPUT in
  npm-no-cache-no-lockfile)
    npm cache clean --force && \
      npm install
    break
    ;;
  npm-no-cache)
    git checkout npm-no-cache && \
      npm cache clean --force && \
      npm ci 
    break
    ;;
  npm-reinstall)
    git checkout npm-no-cache && \
      npm ci
    break
    ;;

  yarn-no-cache-no-lockfile)
    yarn cache clean && yarn
    break
    ;;
  yarn-no-cache)
    git checkout yarn-no-cache && \
      yarn cache clean && \
      yarn --frozen-lockfile
    break
    ;;
  yarn-reinstall)
    git checkout yarn-no-cache && \
      yarn --frozen-lockfile
    break
    ;;

  berry-no-cache-no-lockfile)
    git checkout berry-no-cache-no-lockfile && \
      yarn cache clean --all && \
      yarn
    break
    ;;
  berry-no-cache)
    git checkout berry-no-cache && \
      yarn cache clean --all && \
      yarn --immutable
    break
    ;;
  berry-reinstall)
    git checkout berry-no-cache && \
      yarn --immutable
    break
    ;;

  berry-node-modules-no-cache-no-lockfile)
    git checkout berry-node-modules-no-cache-no-lockfile && \
      yarn cache clean --all && \
      yarn
  break
  ;;
  berry-node-modules-no-cache)
    git checkout berry-node-modules-no-cache && \
      yarn cache clean --all && \
      yarn --immutable
  break
  ;;
  berry-node-modules-reinstall)
    git checkout berry-node-modules-no-cache && \
      yarn --immutable
  break
  ;;

  none)
    echo "No command"
    break
    ;;
esac