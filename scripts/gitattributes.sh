#!/bin/bash

if [ -e .gitattributes ]; then
  echo ".gitattributes already exists."
  exit 1
fi
echo '*.tf text eol=lf
*.md text eol=lf' > .gitattributes
echo "created .gitattributes"
