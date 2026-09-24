#!/usr/bin/env zsh
# convert.sh — Convert one or more Markdown files (resume and/or cover
# letter) to a template-styled PDF via pandoc + LibreOffice.
# Cover letters (filename containing "_cover") use cover-template.docx;
# everything else uses resume-template.docx. The intermediate .docx is
# deleted once the PDF is confirmed to exist and be nonzero size - only
# .md and .pdf should remain (see feedback_job_applications memory).
# Resumes in this script's own folder (the baseline) also get a standalone
# .html styled with resume.css; files elsewhere (job applications) don't.
# Usage: ./convert.sh [file1.md file2.md ...]   (default: resume.md)

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
RESET='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
RESUME_TEMPLATE="$SCRIPT_DIR/resume-template.docx"
COVER_TEMPLATE="$SCRIPT_DIR/cover-template.docx"
LUA_FILTER="$SCRIPT_DIR/strip-ids.lua"
HTML_CSS="$SCRIPT_DIR/resume.css"

INPUT_FILES=("${@:-resume.md}")

for INPUT_FILE in "${INPUT_FILES[@]}"; do
  if [[ ! -f "$INPUT_FILE" ]]; then
    echo -e "${RED}ERROR: File not found: $INPUT_FILE${RESET}"
    continue
  fi

  if [[ "${INPUT_FILE##*.}" != "md" ]]; then
    echo -e "${RED}ERROR: Input must be a .md file, got: $INPUT_FILE${RESET}"
    continue
  fi

  INPUT_PATH="$(cd "$(dirname "$INPUT_FILE")" && pwd)/$(basename "$INPUT_FILE")"
  DIR="$(dirname "$INPUT_PATH")"
  BASE="$(basename "$INPUT_PATH" .md)"

  DOCX_PATH="$DIR/$BASE.docx"
  PDF_PATH="$DIR/$BASE.pdf"

  if [[ "$BASE" == *_cover* ]]; then
    TEMPLATE="$COVER_TEMPLATE"
  else
    TEMPLATE="$RESUME_TEMPLATE"
  fi

  echo -e "\n${CYAN}Converting: $INPUT_PATH${RESET}"

  if [[ "$DIR" == "$SCRIPT_DIR" && "$BASE" != *_cover* ]]; then
    HTML_PATH="$DIR/$BASE.html"
    if (cd "$DIR" && pandoc "$INPUT_PATH" -s --embed-resources --css "$(basename "$HTML_CSS")" --metadata pagetitle="$BASE" -o "$HTML_PATH" 2>/dev/null); then
      echo -e "  ${GREEN}[HTML]  OK -> $HTML_PATH${RESET}"
    else
      echo -e "  ${RED}[HTML]  FAILED${RESET}"
    fi
  fi

  if ! pandoc "$INPUT_PATH" -o "$DOCX_PATH" --reference-doc="$TEMPLATE" --lua-filter="$LUA_FILTER" 2>/dev/null; then
    echo -e "  ${RED}[DOCX]  FAILED${RESET}"
    continue
  fi
  echo -e "  ${GREEN}[DOCX]  OK -> $DOCX_PATH${RESET}"

  if ! soffice --headless --convert-to pdf --outdir "$DIR" "$DOCX_PATH" 2>/dev/null; then
    echo -e "  ${RED}[PDF]   FAILED — is LibreOffice installed?${RESET}"
    continue
  fi

  if [[ -s "$PDF_PATH" ]]; then
    echo -e "  ${GREEN}[PDF]   OK -> $PDF_PATH${RESET}"
    rm -f "$DOCX_PATH"
    echo -e "  ${GRAY}[CLEANUP] removed $DOCX_PATH${RESET}"
  else
    echo -e "  ${RED}[PDF]   FAILED — no/empty output, keeping $DOCX_PATH for troubleshooting${RESET}"
  fi
done
