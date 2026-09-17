# STRUCTURE — SID Fit Coach AI (restructured)

## 1. Mục tiêu cấu trúc

1. **Một chỗ duy nhất cho runtime authority** (`knowledge/`)
2. **Một pack phẳng sẵn upload** (`GPT_UPLOAD_READY/`) — Custom GPT cần flat filenames
3. **Design / QA / deployment tách hẳn** — không lẫn vào knowledge upload
4. **Giữ nguyên filename gốc** của 19 runtime files (manifest & router phụ thuộc tên file)

## 2. Map file → thư mục

### Controller (`knowledge/00-controller/`)

| File | Runtime role |
|---|---|
| `05-master-instruction.md` | Tier 0 controller |
| `02-reasoning-safety-rules.md` | Safety / scope / epistemic |
| `13-knowledge-routing-and-behavior.md` | BK/KN/KR + K01–K16 |

### Training (`knowledge/training/`)

| File | K |
|---|---|
| `physiological-basis-of-hypertrophy.md` | K01 |
| `mechanisms-of-hypertrophy.md` | K02 |
| `resistance-training-variables.md` | K04 |
| `advanced-training-practices.md` | K05 |
| `aerobic-and-concurrent-training.md` | K06 |
| `individual-modifiers-of-hypertrophy.md` | K07 |
| `hypertrophy-program-design.md` | K08 |

### Measurement (`knowledge/measurement/`)

| File | K |
|---|---|
| `measurement-and-progress-assessment.md` | K03 |

### Nutrition (`knowledge/nutrition/`)

| File | K |
|---|---|
| `energy-balance-and-bodyweight-direction.md` | K09 |
| `macronutrients-and-fiber.md` | K10 |
| `micronutrients-and-hydration.md` | K11 |
| `nutrient-timing-and-frequency.md` | K12 |
| `supplementation.md` | K13 |
| `nutrition-behavior-adherence-and-lifestyle.md` | K16 |

### Competition (`knowledge/competition/`)

| File | K |
|---|---|
| `competition-peaking-and-weight-making.md` | K14 |
| `post-competition-recovery-and-nutrition-periodization.md` | K15 |

### Design reference only (`docs/design/`)

- `01-output-architecture.md`
- `04-conversation-state-workflow.md`
- `06-runtime-prompt-stack.md`
- `design-conversation-architect.md`
- `pain_point_difference_miner.md`
- `03-knowledge-behavior-map.md` ← **SUPERSEDED** by `13`
- `11-knowledge-runtime-crosswalk.md` ← **SUPERSEDED** by `13`

### QA (`docs/qa/`)

- `07-scenario-tests.md`
- `12-knowledge-integration-tests.md`
- `CHECKPOINTS.md`

### Deployment (`docs/deployment/`)

- `08-knowledge-deployment-integration.md`
- `09-custom-gpt-deployment-manifest.md`
- `10-custom-gpt-production-instruction.md`

## 3. GPT_UPLOAD_READY contract

- `instructions/10-custom-gpt-production-instruction.md` → paste vào GPT **Instructions** (không upload Knowledge)
- `knowledge/*` → **đúng 19 file**, filename khớp manifest §3
- Không include `03` / `11` / design / qa

## 4. Quy tắc maintain

1. Sửa science/runtime → sửa trong `knowledge/**` trước
2. Chạy `scripts/pack_gpt_upload.sh` để sync pack phẳng
3. Không đổi tên 19 runtime files trừ khi cập nhật đồng bộ: router `13` + manifest `09` + tests `12`
4. File superseded giữ trong `docs/design` làm audit trail — không xóa lịch sử
