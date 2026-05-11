#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
SCRIPT_DIR=$(realpath "${SCRIPT_DIR:-.}")

XSL_FILE="$SCRIPT_DIR/osis-to-zef.xsl"

src_xml_file=$1
out_xml_file=$(sed -E 's#(\.osis)?\.xml$#.zef.xml#' <<<"$src_xml_file")

xsltproc "$XSL_FILE" "$src_xml_file" > "$out_xml_file"

# xmllint --format Riveduta-2020.zef.xml > Riveduta-2020.zef.xml