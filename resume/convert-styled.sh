#!/usr/bin/env zsh
# convert-styled.sh — Convert one or more Markdown files to HTML, DOCX, and PDF.
# PDF is generated from the DOCX (via LibreOffice) so template styles are preserved.
# Usage: ./convert-styled.sh [file1.md file2.md ...]   (default: resume.md)

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
RESET='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
RESUME_TEMPLATE="$SCRIPT_DIR/resume-template.docx"
COVER_TEMPLATE="$SCRIPT_DIR/cover-template.docx"

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

  # Use cover template if filename contains "_cover"
  if [[ "$BASE" == *_cover* ]]; then
    TEMPLATE="$COVER_TEMPLATE"
  else
    TEMPLATE="$RESUME_TEMPLATE"
  fi

  generated=()

  echo -e "\n${CYAN}Converting: $INPUT_PATH${RESET}"

  # DOCX
  if pandoc "$INPUT_PATH" -o "$DOCX_PATH" --reference-doc="$TEMPLATE" 2>/dev/null; then
    echo -e "  ${GREEN}[DOCX]  OK -> $DOCX_PATH${RESET}"
    generated+=("$DOCX_PATH")
  else
    echo -e "  ${RED}[DOCX]  FAILED${RESET}"
    continue
  fi

  # PDF from DOCX via LibreOffice (preserves template styles)
  if libreoffice --headless --convert-to pdf "$DOCX_PATH" --outdir "$DIR" 2>/dev/null; then
    echo -e "  ${GREEN}[PDF]   OK -> $PDF_PATH${RESET}"
    generated+=("$PDF_PATH")
  else
    echo -e "  ${RED}[PDF]   FAILED — is LibreOffice installed?${RESET}"
  fi

  echo -e "\n${CYAN}Generated ${#generated[@]} file(s):${RESET}"
  for f in "${generated[@]}"; do
    echo -e "  ${GRAY}$f${RESET}"
  done
done
