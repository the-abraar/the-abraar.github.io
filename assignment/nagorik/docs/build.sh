#!/bin/sh
# Render each Markdown doc to ../<slug>/index.html. Needs pandoc. Rerun after editing a .md.
set -e
cd "$(dirname "$0")"
render() { # $1 source .md, $2 output slug
  mkdir -p "../$2"
  title=$(grep -m1 '^# ' "$1" | sed 's/^# //')
  pandoc -f gfm -t html5 --template template.html \
    -M pagetitle="$title" -M source="$1" "$1" -o "../$2/index.html"
}
render my_product_building_approach.md approach
render tin-shotti-prd.md prd
render test-cases.md test-cases
render brand-guidelines.md brand-guidelines
render ui-ux-principles.md ui-ux-principles
