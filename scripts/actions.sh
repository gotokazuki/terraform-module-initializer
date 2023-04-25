#!/bin/bash

ACTIONS_WORKFLOWS_DIR=.github/workflows
FILE_NAME=fmt.yml

mkdir -p $ACTIONS_WORKFLOWS_DIR

if [ -n "$(ls $ACTIONS_WORKFLOWS_DIR)" ]; then
  echo "$ACTIONS_WORKFLOWS_DIR not empty."
  exit 1
fi

curl -fsSL https://raw.githubusercontent.com/gotooooo/terraform-module-initializer/main/files/$FILE_NAME > $ACTIONS_WORKFLOWS_DIR/$FILE_NAME
echo "created $ACTIONS_WORKFLOWS_DIR/$FILE_NAME"
