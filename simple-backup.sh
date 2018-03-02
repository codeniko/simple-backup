#!/bin/bash

####### ONLY EDIT THIS PART ########
GITHUB_USER='codeniko'
####################################

GITIGNORE='.gitignore'

function create_gitignore() {
  #echo "Creating $GITIGNORE file."
  echo "$GITIGNORE" > "$GITIGNORE"
  echo "$0" | awk -F '/' '{ print $NF }' >> "$GITIGNORE"
}

function init_repo() {
  echo 'This looks like a new project. What did you name your repository?'
  echo ''
  echo -n 'Repo name: '
  read repo_name
  test -z $repo_name && echo "Repo name required." 1>&2 && exit 1
  git init > /dev/null
  git remote add origin "git@github.com:$GITHUB_USER/$repo_name.git"
}

function get_repo_name() {
  git remote -v | head -n 1 | cut -d '/' -f 2 | awk -F'\.git ' '{print $1}'
}

function commit_changes() {
  local repo_name="$(get_repo_name)"
  if [ "$?" -eq 0 ]; then
    test -z $repo_name && echo 'Something went wrong, could not find repo name.' 1>&2 && exit 1

    echo "Commiting changes to: $GITHUB_USER/$repo_name"
    echo ''
    git add .
    git commit -m "Last changes - $(date)"
    git push -u origin master
    echo ''
    echo 'Done!'
    echo ''
  else
    echo 'Failed to get repo_name, get Niko' && exit 1
  fi
}

clear

if [ "$PWD" == "$HOME" ]; then
  # go to directory where script is located
  cd "$(dirname $0)"
fi

if [ -d '.git' ]; then
  commit_changes 
else
  init_repo
  create_gitignore
  commit_changes 
fi
