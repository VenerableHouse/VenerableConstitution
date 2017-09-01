#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
  git clone https://${GH_TOKEN}@github.com/RuddockHouse/RuddockWebsite.git
}

commit_constitution() {
  cp _build/constitution.pdf RuddockWebsite/ruddock/static/constitution/
  cd RuddockWebsite
  git add ruddock/static/constitution/constitution.pdf
  git commit --message "Update constitution.pdf. [Travis build: $TRAVIS_BUILD_NUMBER]"
}

upload_constitution() {
  git push --quiet 
}

setup_git
commit_constitution
upload_constitution
