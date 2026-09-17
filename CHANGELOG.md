# Changelog

## P5.4 — Instructions ≤8k chars (2026-09-17)

- Condensed Custom GPT Instructions under OpenAI **8000-character** limit (was ~12.8k chars).
- Kept HARD domain lock, safety, humanizer core, S1–S17 skill table, self-check.
- Detail remains in knowledge (`05-master-instruction.md`, category files) — not duplicated in Instructions.
- Sync: `GPT_UPLOAD_READY/instructions/` + `docs/deployment/`.


## 2026-09-17 — P5.3 Humanizer + Full Skills

- Production instruction rewrite: gate → skill → humanize → self-check
- Master **A12.5 Humanizer Layer** (voice DO/DON'T + skeleton)
- Master **A15 Full Skills Playbook** S1–S17 (must-have / cấm)
- S14 Visual/artifact cho Business GPT (table/chart/Canvas)
- A14 self-check + A14.1 checklist: skill + humanizer
- README deploy + P5.3 map; ERROR_MATRIX + ERR-19…22
- Pack sync `GPT_UPLOAD_READY/` (vẫn 19 knowledge files)
- **Không** rewrite science category knowledge

## 2026-09-17 — owner-ready harden (anh Minh)

- README hiện đại, purpose-first, deploy 4 bước
- **Hard FitCoach-only domain lock** (instruction + Master A3.1)
- Error matrix DB: md + json + csv
- STRUCTURE/CHANGELOG gọn

## 2026-09-17 — restructure v1

- Fork/repackage from `Nohfinl99/Fit_Coach-AI_V1`
- Split flat root → `knowledge/` · `GPT_UPLOAD_READY/` · `docs/*`
- Superseded `03`+`11` → `docs/design/`
- `scripts/pack_gpt_upload.sh` (assert 19)
- No science rewrite
