#!/bin/bash

FILE_NAME=.editorconfig

if [ -e $FILE_NAME ]; then
  echo "$FILE_NAME already exists."
  exit 1
fi

curl -fsSL https://raw.githubusercontent.com/gotooooo/terraform-module-initializer/main/files/$FILE_NAME > $FILE_NAME
echo "created $FILE_NAME"
