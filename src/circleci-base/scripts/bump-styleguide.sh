#!/usr/bin/env bash
set -u

FOLDER="/tmp/workspace/"
mkdir -p "$FOLDER"
cd "$FOLDER" || exit 1

REPOS=(
  planet4-master-theme
  planet4-plugin-gutenberg-blocks
  planet4-landing-page
)

for repo in "${REPOS[@]}"; do
  echo "Cloning repository"
  echo
  printf "%s" "$repo"
  echo

  git clone --recurse-submodules git@github.com:jen-cub/"$repo" "$repo"

  pushd "$repo" || exit 1

  git config user.email "jencub@gmail.com"
  git config user.name "Jen"
  git config push.default simple

  git submodule update --init --recursive
  git submodule foreach "git fetch origin; git checkout \$(git describe --tags \$(git rev-list --tags --max-count=1))"

  if [[ -n $(git status -s) ]]; then
    git add .
    git commit -m ":robot: Bump styleguide"
    git push origin master
  fi

  popd || exit 1
done
