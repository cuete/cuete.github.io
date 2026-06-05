#!/usr/bin/env zsh
# convert.sh — Convert a Markdown resume to HTML, DOCX, and PDF using pandoc.
# Usage: ./convert.sh [input.md]   (default: resume.md)

set -euo pipefail

# ── Colors ──────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
RESET='\033[0m'

# ── Input validation ─────────────────────────────────────────────────────────
INPUT_FILE="${1:-resume.md}"

if [[ ! -f "$INPUT_FILE" ]]; then
  echo -e "${RED}ERROR: File not found: $INPUT_FILE${RESET}"
  exit 1
fi

if [[ "${INPUT_FILE##*.}" != "md" ]]; then
  echo -e "${RED}ERROR: Input must be a .md file, got: $INPUT_FILE${RESET}"
  exit 1
fi

# ── Paths ─────────────────────────────────────────────────────────────────────
INPUT_PATH="$(cd "$(dirname "$INPUT_FILE")" && pwd)/$(basename "$INPUT_FILE")"
DIR="$(dirname "$INPUT_PATH")"
BASE="$(basename "$INPUT_PATH" .md)"

HTML_PATH="$DIR/$BASE.html"
DOCX_PATH="$DIR/$BASE.docx"
PDF_PATH="$DIR/$BASE.pdf"

generated=()

echo -e "\n${CYAN}Converting: $INPUT_PATH${RESET}"

# ── HTML ──────────────────────────────────────────────────────────────────────
if pandoc "$INPUT_PATH" -o "$HTML_PATH" --standalone 2>/dev/null; then
  echo -e "  ${GREEN}[HTML]  OK -> $HTML_PATH${RESET}"
  generated+=("$HTML_PATH")
else
  echo -e "  ${RED}[HTML]  FAILED${RESET}"
fi

# ── DOCX ──────────────────────────────────────────────────────────────────────
if pandoc "$INPUT_PATH" -o "$DOCX_PATH" 2>/dev/null; then
  echo -e "  ${GREEN}[DOCX]  OK -> $DOCX_PATH${RESET}"
  generated+=("$DOCX_PATH")
else
  echo -e "  ${RED}[DOCX]  FAILED${RESET}"
fi

# ── PDF — try default engine first, fall back to wkhtmltopdf ─────────────────
if pandoc "$INPUT_PATH" -o "$PDF_PATH" 2>/dev/null; then
  echo -e "  ${GREEN}[PDF]   OK -> $PDF_PATH${RESET}"
  generated+=("$PDF_PATH")
elif pandoc "$INPUT_PATH" -o "$PDF_PATH" --pdf-engine=wkhtmltopdf 2>/dev/null; then
  echo -e "  ${GREEN}[PDF]   OK (wkhtmltopdf) -> $PDF_PATH${RESET}"
  generated+=("$PDF_PATH")
else
  echo -e "  ${RED}[PDF]   FAILED — install wkhtmltopdf (https://wkhtmltopdf.org) or a LaTeX distribution (TeX Live / MacTeX)${RESET}"
fi

# ── Summary ───────────────────────────────────────────────────────────────────
echo -e "\n${CYAN}Generated ${#generated[@]} file(s):${RESET}"
for f in "${generated[@]}"; do
  echo -e "  ${GRAY}$f${RESET}"
done
