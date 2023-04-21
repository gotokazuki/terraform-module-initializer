#!/bin/bash

ACTIONS_WORKFLOWS_DIR=.github/workflows
mkdir -p $ACTIONS_WORKFLOWS_DIR

if [ -n "$(ls $ACTIONS_WORKFLOWS_DIR)" ]; then
  echo "$ACTIONS_WORKFLOWS_DIR not empty."
  exit 1
fi

echo 'name: fmt
on: push
jobs:
  terraform-apply:
    name: terraform fmt
    runs-on: ubuntu-latest
    timeout-minutes: 5
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: set env
        id: set-env
        run: |
          terraform_version=`cat .terraform-version`
          echo $terraform_version
          echo "terraform_version=$terraform_version" >> $GITHUB_OUTPUT
      - uses: hashicorp/setup-terraform@v2
        with:
          terraform_version: ${{ steps.set-env.outputs.terraform_version }}
      - name: terraform fmt
        run: |
          terraform fmt -check -recursive -list=true -diff' > $ACTIONS_WORKFLOWS_DIR/fmt.yml
