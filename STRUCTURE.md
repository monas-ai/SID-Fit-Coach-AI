# STRUCTURE — SID Fit Coach AI

## Rules

1. Runtime authority chỉ trong `knowledge/**`
2. Upload Custom GPT chỉ từ `GPT_UPLOAD_READY/` (flat, đúng 19 file)
3. `docs/design|qa|deployment` **không** upload
4. Giữ filename 19 runtime files (router + manifest phụ thuộc tên)
5. Sửa science → sửa `knowledge/**` → chạy `scripts/pack_gpt_upload.sh`

## Map

| Path | Role |
|---|---|
| `knowledge/00-controller/` | `05` master · `02` safety · `13` routing |
| `knowledge/training/` | K01 K02 K04–K08 |
| `knowledge/measurement/` | K03 |
| `knowledge/nutrition/` | K09–K13 K16 |
| `knowledge/competition/` | K14 K15 |
| `GPT_UPLOAD_READY/instructions/` | Paste GPT Instructions (FitCoach-only hard gate) |
| `GPT_UPLOAD_READY/knowledge/` | 19 flat files |
| `docs/design/` | design-only + **SUPERSEDED** `03` `11` |
| `docs/qa/` | tests · checkpoints · **ERROR_MATRIX** |
| `docs/deployment/` | manifest · production instruction source |

## Superseded (reference only)

- `03-knowledge-behavior-map.md` → merged into `13`
- `11-knowledge-runtime-crosswalk.md` → merged into `13`
