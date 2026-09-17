#!/usr/bin/env bash
# Regenerate GPT_UPLOAD_READY/ from knowledge/ hierarchy.
# Custom GPT Builder needs flat filenames matching the deployment manifest.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT_K="$ROOT/GPT_UPLOAD_READY/knowledge"
OUT_I="$ROOT/GPT_UPLOAD_READY/instructions"

mkdir -p "$OUT_K" "$OUT_I"
rm -f "$OUT_K"/*.md

# Controller
cp "$ROOT/knowledge/00-controller/05-master-instruction.md" "$OUT_K/"
cp "$ROOT/knowledge/00-controller/02-reasoning-safety-rules.md" "$OUT_K/"
cp "$ROOT/knowledge/00-controller/13-knowledge-routing-and-behavior.md" "$OUT_K/"

# Categories
cp "$ROOT/knowledge/training/"*.md "$OUT_K/"
cp "$ROOT/knowledge/nutrition/"*.md "$OUT_K/"
cp "$ROOT/knowledge/measurement/"*.md "$OUT_K/"
cp "$ROOT/knowledge/competition/"*.md "$OUT_K/"

# Instructions field (not counted in the 19 knowledge files)
cp "$ROOT/docs/deployment/10-custom-gpt-production-instruction.md" "$OUT_I/"

count="$(find "$OUT_K" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')"
echo "Packed $count knowledge files → $OUT_K"
if [[ "$count" != "19" ]]; then
  echo "ERROR: expected 19 knowledge files, got $count" >&2
  ls -1 "$OUT_K"
  exit 1
fi
echo "OK — GPT_UPLOAD_READY is upload-ready."
