# Changelog

## 2026-09-17 — owner-ready harden (anh Minh)

- README hiện đại, purpose-first, deploy 4 bước
- **Hard FitCoach-only domain lock** (production instruction + Master A3.1 + A13 row)
- Lược production instruction (bỏ dài dòng, giữ contract)
- Error matrix DB: `docs/qa/ERROR_MATRIX.md` + `.json` + `.csv` (18 lỗi old vs new)
- STRUCTURE/CHANGELOG gọn cho review

## 2026-09-17 — restructure v1

- Fork/repackage from `Nohfinl99/Fit_Coach-AI_V1`
- Split flat root → `knowledge/` · `GPT_UPLOAD_READY/` · `docs/*`
- Superseded `03`+`11` → `docs/design/`
- `scripts/pack_gpt_upload.sh` (assert 19)
- No science rewrite
