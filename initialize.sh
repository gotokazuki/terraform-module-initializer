#!/bin/bash

set -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gotooooo/terraform-module-initializer/main/scripts/editorconfig.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gotooooo/terraform-module-initializer/main/scripts/gitattributes.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gotooooo/terraform-module-initializer/main/scripts/gitignore.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gotooooo/terraform-module-initializer/main/scripts/terraform.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gotooooo/terraform-module-initializer/main/scripts/actions.sh)"
