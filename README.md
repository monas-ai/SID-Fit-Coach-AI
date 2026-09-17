# SID Fit Coach AI

**Fitness coaching agent** — resistance training · hypertrophy · nutrition · recovery · adherence · progress.

Vietnamese-first. Source-bounded. Safety-first. **FitCoach-only** (không trả lời ngoài domain).

> Upstream knowledge: [`Nohfinl99/Fit_Coach-AI_V1`](https://github.com/Nohfinl99/Fit_Coach-AI_V1) (anh Minh)  
> Bản này: chỉnh cấu trúc + packaging + harden scope để review / deploy Custom GPT.

---

## Agent làm gì / không làm gì

| ✅ Trong scope | ❌ Ngoài scope (từ chối) |
|---|---|
| Lập / chỉnh plan tập hypertrophy–strength | Tin tức, chính trị, tài chính, code, pháp lý |
| Giải thích volume, RIR, progression, fatigue | Chẩn đoán / điều trị bệnh·chấn thương |
| Dinh dưỡng tổng quát, macro, timing, adherence | Kê thuốc, steroid, rehab protocol |
| Check-in tiến độ, estimate (range + uncertainty) | Weight-cut / dehydration protocol |
| Competition peaking **education** + safety gate | Mọi chủ đề không phải Fit Coach |

Hard gate nằm trong **GPT Instructions** + Master `A3.1`. Agent sau này **không** trả lời partial ngoài Fit Coach.

---

## Deploy Custom GPT (4 bước)

1. Mở GPT Builder → **Configure**
2. Paste `GPT_UPLOAD_READY/instructions/10-custom-gpt-production-instruction.md` vào **Instructions**
3. Upload **đúng 19 file** trong `GPT_UPLOAD_READY/knowledge/`
4. Smoke test: off-topic refuse · high-risk safety · “RIR là gì?” · plan thiếu schedule · supplement + thuốc

```bash
bash scripts/pack_gpt_upload.sh   # regenerate pack (assert = 19 files)
```

---

## Cấu trúc repo

```text
knowledge/                 # runtime authority (hierarchy)
  00-controller/           # 05 master · 02 safety · 13 routing
  training/ nutrition/ measurement/ competition/
GPT_UPLOAD_READY/          # pack phẳng — chỉ cái này upload
  instructions/            # paste vào GPT Instructions
  knowledge/               # đúng 19 file
docs/
  deployment/              # manifest + production instruction source
  design/                  # design-only + superseded (03, 11) — KHÔNG upload
  qa/                      # tests · checkpoints · ERROR_MATRIX
scripts/pack_gpt_upload.sh
```

### Runtime package (19)

| Role | Files |
|---|---|
| Controller | `05-master-instruction.md` |
| Safety | `02-reasoning-safety-rules.md` |
| Routing | `13-knowledge-routing-and-behavior.md` |
| Domain | 16 category files (K01–K16) |

**Không upload:** `docs/**`, superseded `03`/`11`, design architect, pain miner, QA.

---

## Runtime flow

```text
request
  → Domain Lock (FitCoach-only)     # refuse off-topic
  → 05 master
  → safety gate (02) nếu risk/scope
  → route tối thiểu (13) → category
  → verify retrieval · output · self-check
```

---

## Đã sửa so với repo cũ

Chi tiết 18 lỗi: [`docs/qa/ERROR_MATRIX.md`](docs/qa/ERROR_MATRIX.md) · [`error_matrix.json`](docs/qa/error_matrix.json) · [`error_matrix.csv`](docs/qa/error_matrix.csv)

| Trước (flat V1) | Sau (SID) |
|---|---|
| 33 file root lẫn design/QA | Hierarchy theo role |
| README = dump instruction | README deploy-ready |
| Routing 03+11 cạnh tranh | Gộp `13` · manifest 19 |
| Phụ thuộc file không upload | Deps runtime = `02`+`13` |
| Off-topic gate yếu | **Hard FitCoach-only** |
| Không error ledger | Matrix DB old vs new |

Science/knowledge **không rewrite** — restructure + packaging + scope harden.

---

## Owner checklist (anh Minh)

- [ ] Review `GPT_UPLOAD_READY/` (19 + instructions)
- [ ] Review Domain Lock trong instructions + Master A3.1
- [ ] Chạy smoke tests ở trên
- [ ] Đánh dấu KIT runtime trong `docs/qa/12-…` khi live
- [ ] Không commit/upload raw books / personal exports vào runtime pack

---

## Credit

- **Nội dung / product owner:** anh Minh — [`Nohfinl99/Fit_Coach-AI_V1`](https://github.com/Nohfinl99/Fit_Coach-AI_V1)
- **Restructure & packaging:** monas-ai mirror for review

License theo upstream author trừ khi anh Minh quy định khác.
