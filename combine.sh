#!/usr/bin/env bash
# combine.sh — GoodEpoch Cursor Rules Pack v1
# Merge multiple .cursorrules files into one with section headers
#
# Usage:
#   chmod +x combine.sh
#   ./combine.sh ../frameworks/nextjs-app-router.cursorrules ../styles/tailwind-v4.cursorrules > ../.cursorrules
#   ./combine.sh [file1] [file2] ... > output.cursorrules
#
# Options:
#   --output FILE    Write to file instead of stdout
#   --help           Show this help

set -euo pipefail

OUTPUT=""
FILES=()

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --output)
      OUTPUT="$2"
      shift 2
      ;;
    --help|-h)
      echo "Usage: $0 [OPTIONS] file1.cursorrules [file2.cursorrules ...]"
      echo ""
      echo "Options:"
      echo "  --output FILE    Write output to FILE instead of stdout"
      echo "  --help           Show this help"
      echo ""
      echo "Examples:"
      echo "  # Combine Next.js + Tailwind + shadcn + testing rules"
      echo "  $0 ../frameworks/nextjs-app-router.cursorrules \\"
      echo "     ../styles/tailwind-v4.cursorrules \\"
      echo "     ../styles/shadcn-ui.cursorrules \\"
      echo "     ../concerns/testing.cursorrules \\"
      echo "     > /your/project/.cursorrules"
      echo ""
      echo "  # Write to file directly"
      echo "  $0 --output /your/project/.cursorrules \\"
      echo "     ../frameworks/nextjs-app-router.cursorrules \\"
      echo "     ../styles/tailwind-v4.cursorrules"
      exit 0
      ;;
    -*)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
    *)
      FILES+=("$1")
      shift
      ;;
  esac
done

# Validate we have files to combine
if [[ ${#FILES[@]} -eq 0 ]]; then
  echo "Error: No input files specified." >&2
  echo "Run '$0 --help' for usage." >&2
  exit 1
fi

# Validate all files exist
for file in "${FILES[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "Error: File not found: $file" >&2
    exit 1
  fi
done

# Build output
COMBINED=""

# Header
COMBINED+="# Combined Cursor Rules — GoodEpoch Cursor Rules Pack v1"$'\n'
COMBINED+="# Generated: $(date '+%Y-%m-%d %H:%M:%S')"$'\n'
COMBINED+="# Sources:"$'\n'
for file in "${FILES[@]}"; do
  COMBINED+="#   - $(basename "$file")"$'\n'
done
COMBINED+="#"$'\n'
COMBINED+="# To regenerate:"$'\n'
COMBINED+="# cd composing && ./combine.sh \\"$'\n'
for i in "${!FILES[@]}"; do
  file="${FILES[$i]}"
  if [[ $i -lt $(( ${#FILES[@]} - 1 )) ]]; then
    COMBINED+="#   ${file} \\"$'\n'
  else
    COMBINED+="#   ${file}"$'\n'
  fi
done
COMBINED+=$'\n'
COMBINED+="# ============================================================"$'\n'
COMBINED+=$'\n'

# Append each file with a separator
for file in "${FILES[@]}"; do
  filename=$(basename "$file")
  ruleset_name="${filename%.cursorrules}"
  ruleset_name="${ruleset_name//-/ }"
  # Title case the name
  ruleset_display=$(echo "$ruleset_name" | awk '{for(i=1;i<=NF;i++){$i=toupper(substr($i,1,1))tolower(substr($i,2))}}1')

  COMBINED+="# ============================================================"$'\n'
  COMBINED+="# RULESET: ${ruleset_display}"$'\n'
  COMBINED+="# Source:  ${filename}"$'\n'
  COMBINED+="# ============================================================"$'\n'
  COMBINED+=$'\n'

  # Strip comment lines at top of file that contain "GoodEpoch Cursor Rules Pack"
  # (avoids duplicate headers) and append the content
  content=$(grep -v "^# .*GoodEpoch Cursor Rules Pack" "$file" | grep -v "^# Applies to:" | grep -v "^# Packages:" | grep -v "^# Stack:" | grep -v "^# Composable:" | grep -v "^# Note:" | grep -v "^# Compatible with:" || true)

  COMBINED+="${content}"$'\n'
  COMBINED+=$'\n'
done

# Output
if [[ -n "$OUTPUT" ]]; then
  # Create parent directory if it doesn't exist
  mkdir -p "$(dirname "$OUTPUT")"
  printf '%s' "$COMBINED" > "$OUTPUT"
  echo "Written to: $OUTPUT" >&2
  # Count lines
  line_count=$(printf '%s' "$COMBINED" | wc -l)
  echo "Total lines: ${line_count}" >&2
else
  printf '%s' "$COMBINED"
fi
