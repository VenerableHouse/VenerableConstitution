#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
  # This is the only interesting line in the whole script. GH_TOKEN is defined in the Travis settings for this repository.
  # The value of GH_TOKEN is a Github Personal Access Token with write access to the VenerableWebsite repository.
  git clone https://${GH_TOKEN}@github.com/VenerableHouse/VenerableWebsite.git
}

commit_constitution() {
  cp _build/constitution.pdf VenerableWebsite/ruddock/static/constitution/
  cd VenerableWebsite
  git add ruddock/static/constitution/constitution.pdf
  git commit --message "Update constitution.pdf. [Travis build: $TRAVIS_BUILD_NUMBER]"
}

upload_constitution() {
  git push --quiet 
}

setup_git
commit_constitution
upload_constitution
