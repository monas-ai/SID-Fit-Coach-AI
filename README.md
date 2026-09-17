# SID Fit Coach AI — Restructured

Bản **chỉnh lý cấu trúc** từ [`Nohfinl99/Fit_Coach-AI_V1`](https://github.com/Nohfinl99/Fit_Coach-AI_V1).

Giữ nguyên nội dung knowledge & instruction; chỉ **tách thư mục theo vai trò runtime** để dễ review, maintain và deploy Custom GPT.

---

## Vì sao chỉnh lại?

Repo gốc để **toàn bộ 33 file phẳng ở root**:
- Controller / safety / routing trộn với design-only docs
- File đã superseded (`03`, `11`) nằm cạnh runtime authority
- QA, checkpoint, deployment manifest không có chỗ riêng
- Khó biết file nào **bắt buộc upload** vs file nào chỉ để design/audit

Bản này tách rõ **runtime knowledge** · **design reference** · **QA** · **deployment pack**.

---

## Cấu trúc

```text
.
├── README.md
├── STRUCTURE.md
├── knowledge/                      # 19 file production runtime (có hierarchy)
│   ├── 00-controller/              # master + safety + routing
│   ├── training/                   # K01–K08 (trừ measurement)
│   ├── nutrition/                  # K09–K13, K16
│   ├── measurement/                # K03
│   └── competition/                # K14–K15
├── GPT_UPLOAD_READY/               # pack phẳng sẵn để upload Custom GPT
│   ├── instructions/               # paste vào GPT Instructions
│   └── knowledge/                  # đúng 19 file, tên file giữ nguyên
├── docs/
│   ├── design/                     # design-only / superseded reference
│   ├── qa/                         # scenario + integration tests + checkpoints
│   └── deployment/                 # manifest + production instruction
└── scripts/
    └── pack_gpt_upload.sh          # regenerate GPT_UPLOAD_READY từ knowledge/
```

---

## Runtime package (19 files)

| # | File | Role |
|---:|---|---|
| 1 | `05-master-instruction.md` | Controller — đọc trước mọi request |
| 2 | `02-reasoning-safety-rules.md` | Safety / scope / epistemic gates |
| 3 | `13-knowledge-routing-and-behavior.md` | Router + K01–K16 crosswalk |
| 4–19 | 16 category files | Domain knowledge (training / nutrition / measurement / competition) |

**Không upload (reference only):**
- `03-knowledge-behavior-map.md`, `11-knowledge-runtime-crosswalk.md` (superseded bởi `13`)
- Toàn bộ `docs/design/*`, `docs/qa/*` (trừ khi audit)

Chi tiết upload: `docs/deployment/09-custom-gpt-deployment-manifest.md`

---

## Deploy Custom GPT (nhanh)

1. Mở GPT Builder → **Configure**
2. Paste nội dung `GPT_UPLOAD_READY/instructions/10-custom-gpt-production-instruction.md` vào **Instructions**
3. Upload **đúng 19 file** trong `GPT_UPLOAD_READY/knowledge/`
4. Chạy smoke tests trong `docs/qa/12-knowledge-integration-tests.md` (safety trước)

Hoặc regenerate pack:

```bash
bash scripts/pack_gpt_upload.sh
```

---

## Runtime flow (rút gọn)

```text
User request
  → 05-master-instruction.md
  → safety gate (nếu có risk/scope signal) via 02
  → 13-knowledge-routing-and-behavior.md (chọn category tối thiểu)
  → category file(s) + fresh user facts
  → output + self-check
```

**Identity:** SID Fit Coach — Vietnamese-first coaching (resistance training, hypertrophy, nutrition, recovery, adherence, progress). **Không** phải bác sĩ / PT lâm sàng / prescriber.

---

## Thay đổi so với repo gốc

| Trước | Sau |
|---|---|
| 33 file flat root | Hierarchy theo role |
| Design + runtime lẫn | `docs/design` vs `knowledge` |
| Superseded 03/11 cạnh authority | Reference-only trong `docs/design` |
| Không có pack upload | `GPT_UPLOAD_READY/` sẵn 19 file |
| README = dump master | README = map + deploy guide |

**Nội dung knowledge không rewrite.** Đây là restructure + packaging, không phải rewrite science.

---

## Nguồn

- Upstream: https://github.com/Nohfinl99/Fit_Coach-AI_V1
- Restructured for review / public deploy readiness
- Maintainer mirror: monas-ai

## License / credit

Nội dung gốc thuộc upstream author (`Nohfinl99`). Bản này chỉ tổ chức lại cấu trúc để review và deploy.
