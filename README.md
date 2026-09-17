# SID Fit Coach AI

**Fitness coaching agent** — resistance training · hypertrophy · nutrition · recovery · adherence · progress.

Vietnamese-first. Source-bounded. Safety-first. **FitCoach-only**.  
**P5.3:** Humanizer (giọng coach người thật) + Full Skills Playbook (S1–S17).

> Upstream knowledge: [`Nohfinl99/Fit_Coach-AI_V1`](https://github.com/Nohfinl99/Fit_Coach-AI_V1) (anh Minh)  
> Bản này: restructure + packaging + domain lock + humanizer/skills harden cho Custom GPT.

---

## Agent làm gì / không làm gì

| ✅ Trong scope | ❌ Ngoài scope (từ chối) |
|---|---|
| Lập / chỉnh plan tập hypertrophy–strength | Tin tức, chính trị, tài chính, code, pháp lý |
| Giải thích volume, RIR, progression, fatigue | Chẩn đoán / điều trị bệnh·chấn thương |
| Dinh dưỡng tổng quát, macro, timing, adherence | Kê thuốc, steroid, rehab protocol |
| Check-in tiến độ, estimate (range + uncertainty) | Weight-cut / dehydration protocol |
| Competition peaking **education** + safety gate | Mọi chủ đề không phải Fit Coach |
| Bảng / checklist / chart-data (Business GPT) | Visual ngoài domain |

Hard gate: **GPT Instructions** + Master `A3.1`. Không partial answer ngoài Fit Coach.

---

## Cải tiến P5.3 (bản này)

| Trục | Trước | Sau |
|---|---|---|
| Giọng | Style rules rời, dễ robot | **A12.5 Humanizer** — coach người thật, direct hit, no empty praise |
| Skills | OA registry chung | **A15 S1–S17** must-have playbook / turn |
| Plan skill | Dễ thiếu block | Goal · tuần · progression 1 lever · recovery · metric+review |
| Visual | Không rõ | S14: markdown table + chart/Canvas khi runtime có |
| Production instr. | Contract ngắn | Full runtime: gate → skill → humanize → self-check |
| Science | — | **Không rewrite** category knowledge |

Chi tiết lỗi old vs new: [`docs/qa/ERROR_MATRIX.md`](docs/qa/ERROR_MATRIX.md)

---

## Deploy Custom GPT (4 bước)

1. GPT Builder → **Configure**
2. Paste `GPT_UPLOAD_READY/instructions/10-custom-gpt-production-instruction.md` → **Instructions**
3. Upload **đúng 19 file** trong `GPT_UPLOAD_READY/knowledge/`
4. Smoke:
   - Off-topic → refuse
   - High-risk safety
   - “RIR là gì?” → humanizer + S1
   - Xin plan thiếu schedule → 1 Q đắt + mini-framework
   - “Vẽ bảng so sánh split” → S14
   - Supplement + đang thuốc → no interaction advice

```bash
bash scripts/pack_gpt_upload.sh   # regenerate pack (assert = 19)
```

**Business GPT tip:** bật Advanced Data Analysis nếu muốn chart từ số user; Canvas cho program dài. Web browsing **OFF**.

---

## Cấu trúc repo

```text
knowledge/                 # runtime authority
  00-controller/           # 05 master · 02 safety · 13 routing
  training/ nutrition/ measurement/ competition/
GPT_UPLOAD_READY/          # CHỈ pack này upload
  instructions/            # paste Instructions (P5.3)
  knowledge/               # đúng 19 file
docs/
  deployment/              # manifest + production instruction source
  design/                  # design-only + superseded — KHÔNG upload
  qa/                      # tests · ERROR_MATRIX
scripts/pack_gpt_upload.sh
```

### Runtime package (19)

| Role | Files |
|---|---|
| Controller | `05-master-instruction.md` (A12.5 + A15) |
| Safety | `02-reasoning-safety-rules.md` |
| Routing | `13-knowledge-routing-and-behavior.md` |
| Domain | 16 category files (K01–K16) |

---

## Runtime flow

```text
request
  → Domain Lock (FitCoach-only)
  → Safety gate (02) nếu risk
  → 05 master
  → route tối thiểu (13) → category
  → verify retrieval
  → 1 primary skill (A15)
  → humanize (A12.5)
  → self-check → reply
```

### Skills nhanh (A15)

Explain · Compare · Recommend · **Build/Adjust plan** · Troubleshoot · Check-in · Estimate · Execution cues · Adherence · Supplement · Competition edu · Safety · **Visual/artifact** · Clarify · First-turn value · Continuity

---

## Owner checklist (anh Minh)

- [ ] Review `GPT_UPLOAD_READY/` (19 + instructions P5.3)
- [ ] Paste instructions mới (thay bản cũ trong Builder)
- [ ] Smoke humanizer + plan must-have + visual + off-topic + safety
- [ ] KIT runtime khi live (`docs/qa/12-…`)
- [ ] Không upload `docs/**` / raw books

---

## Credit

- **Nội dung / product owner:** anh Minh — [`Nohfinl99/Fit_Coach-AI_V1`](https://github.com/Nohfinl99/Fit_Coach-AI_V1)
- **Restructure · packaging · P5.3 humanizer/skills:** monas-ai mirror

License theo upstream author trừ khi anh Minh quy định khác.
