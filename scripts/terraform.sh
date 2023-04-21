#!/bin/bash

## create .terraform-version
if [ -e .terraform-version ]; then
  echo ".terraform-version already exists."
  exit 1
fi
echo '1.4.4' > .terraform-version
echo "created .terraform-version"

## create tf files
if [ -e main.tf ]; then
  echo "main.tf already exists."
  exit 1
fi
touch main.tf
echo "created main.tf"

if [ -e veriables.tf ]; then
  echo "veriables.tf already exists."
  exit 1
fi
touch veriables.tf
echo "created variables.tf"

if [ -e outputs.tf ]; then
  echo "outputs.tf already exists."
  exit 1
fi
touch outputs.tf
echo "created outputs.tf"

if [ -e versions.tf ]; then
  echo "versions.tf already exists."
  exit 1
fi
touch versions.tf
echo "created versions.tf"

## create examples template
EXAMPLES_COMPLETE_DIR=examples/complete
mkdir -p $EXAMPLES_COMPLETE_DIR

if [ -n "$(ls $EXAMPLES_COMPLETE_DIR)" ]; then
  echo "$EXAMPLES_COMPLETE_DIR not empty."
  exit 1
fi

touch $EXAMPLES_COMPLETE_DIR/main.tf
touch $EXAMPLES_COMPLETE_DIR/variables.tf
touch $EXAMPLES_COMPLETE_DIR/outputs.tf
touch $EXAMPLES_COMPLETE_DIR/versions.tf
touch $EXAMPLES_COMPLETE_DIR/providers.tf
touch $EXAMPLES_COMPLETE_DIR/locals.tf
echo '1.4.4' > $EXAMPLES_COMPLETE_DIR/.terraform-version
echo "created examples/complete/"
