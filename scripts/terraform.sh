#!/bin/bash

## functions
create_file_if_not_exists () {
  if [ -e "$1" ]; then
    echo "$1 already exists."
    exit 1
  fi
  touch "$1"
  echo "created $1"
}

TERRAFORM_VERSION_FILE_NAME=.terraform-version
TERRAFORM_VERSION=$(curl -fsSL https://raw.githubusercontent.com/gotokazuki/terraform-module-initializer/main/files/$TERRAFORM_VERSION_FILE_NAME)

## create .terraform-version
if [ -e $TERRAFORM_VERSION_FILE_NAME ]; then
  echo "$TERRAFORM_VERSION_FILE_NAME already exists."
  exit 1
fi
echo "$TERRAFORM_VERSION" > $TERRAFORM_VERSION_FILE_NAME
echo "created $TERRAFORM_VERSION_FILE_NAME"

## create tf files
create_file_if_not_exists main.tf
create_file_if_not_exists variables.tf
create_file_if_not_exists outputs.tf
create_file_if_not_exists versions.tf

## create examples template
EXAMPLES_COMPLETE_DIR=examples/complete
mkdir -p $EXAMPLES_COMPLETE_DIR

if [ -n "$(ls $EXAMPLES_COMPLETE_DIR)" ]; then
  echo "$EXAMPLES_COMPLETE_DIR not empty."
  exit 1
fi

EXAMPLE_FILE_NAMES=(main.tf variables.tf outputs.tf versions.tf providers.tf locals.tf)

for NAME in "${EXAMPLE_FILE_NAMES[@]}"
do
  touch $EXAMPLES_COMPLETE_DIR/"$NAME"
done

echo "$TERRAFORM_VERSION" > $EXAMPLES_COMPLETE_DIR/$TERRAFORM_VERSION_FILE_NAME
echo "created $EXAMPLES_COMPLETE_DIR/"
