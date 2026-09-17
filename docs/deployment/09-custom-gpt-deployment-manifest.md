# 09 — Custom GPT Upload-Ready Manifest

## 1. Target

ChatGPT Custom GPT Builder: paste one Instructions document and upload exactly 19 Knowledge files. Baseline không dùng Actions/database.

## 2. Instructions Field

Copy toàn bộ nội dung bên dưới header của `10-custom-gpt-production-instruction.md` vào trường **Instructions**. File này không tính vào 19 Knowledge files và không cần upload vào Knowledge.

## 3. Exact Knowledge Upload Manifest

| # | File | Tier | Runtime role |
|---:|---|---|---|
| 1 | `05-master-instruction.md` | Tier 0 | Canonical controller; mandatory first read |
| 2 | `02-reasoning-safety-rules.md` | Tier 2 | Exact safety, scope, epistemic and decision gates |
| 3 | `13-knowledge-routing-and-behavior.md` | Tier 1 | Consolidated BK/KN/KR/KBC router + K01–K16 crosswalk |
| 4 | `physiological-basis-of-hypertrophy.md` | Tier 1 | K01 adaptation physiology |
| 5 | `mechanisms-of-hypertrophy.md` | Tier 1 | K02 mechanism/causal boundary |
| 6 | `measurement-and-progress-assessment.md` | Tier 1 | K03 measurement and trends |
| 7 | `resistance-training-variables.md` | Tier 1 | K04 volume/frequency/load/effort/exercise variables |
| 8 | `advanced-training-practices.md` | Tier 4 | K05 advanced methods and caveats |
| 9 | `aerobic-and-concurrent-training.md` | Tier 1 | K06 cardio/concurrent trade-offs |
| 10 | `individual-modifiers-of-hypertrophy.md` | Tier 3 | K07 bounded personalization |
| 11 | `hypertrophy-program-design.md` | Tier 1 | K08 program design/recoverability |
| 12 | `energy-balance-and-bodyweight-direction.md` | Tier 1 | K09 calories/bodyweight direction |
| 13 | `macronutrients-and-fiber.md` | Tier 1 | K10 macro foundation |
| 14 | `micronutrients-and-hydration.md` | Tier 4 | K11 food variety/hydration |
| 15 | `nutrient-timing-and-frequency.md` | Tier 1 | K12 timing/frequency hierarchy |
| 16 | `supplementation.md` | Tier 2 | K13 evidence/quality and safety boundary |
| 17 | `competition-peaking-and-weight-making.md` | Tier 2 | K14 risk-sensitive competition knowledge |
| 18 | `post-competition-recovery-and-nutrition-periodization.md` | Tier 3 | K15 recovery/periodization |
| 19 | `nutrition-behavior-adherence-and-lifestyle.md` | Tier 3 | K16 adherence/lifestyle |

**TOTAL = 19 / 19 files**  
**Superseded (reference-only):** `03-knowledge-behavior-map.md`, `11-knowledge-runtime-crosswalk.md`  
**Reserve slots = 0**

## 4. Upload Sequence

1. Open GPT Builder → **Configure**.
2. Paste `10-custom-gpt-production-instruction.md` content into **Instructions**.
3. Under **Knowledge**, upload all 19 files from folder `GPT_UPLOAD_READY/knowledge/`.
4. Confirm Builder shows exactly 19 successfully indexed files with exact filenames.
5. Do not upload `10-custom-gpt-production-instruction.md` as Knowledge.
6. Do not upload `03-knowledge-behavior-map.md` hoặc `11-knowledge-runtime-crosswalk.md` (superseded, reference-only).
7. Save/update the GPT.
8. Run critical safety tests first, then representative retrieval tests from `12-knowledge-integration-tests.md`.
9. Record exact output and PASS/FAIL. Do not claim production-ready from self-simulation.

## 5. Runtime Flow

```text
User Request → read 05-master-instruction.md → classify intent
→ safety gate when relevant → 13-knowledge-routing-and-behavior.md (router + crosswalk)
→ minimum relevant category file(s) → fresh user context
→ epistemic/decision validation → answer → self-check
```

Never load all 19 files indiscriminately for every request.

## 6. Exclusions

Do not upload PDF, ZIP, raw full-book exports, P1/P4/P6 design artifacts, QA files, handoffs, governance/build artifacts, duplicate/historical files, superseded routing files (`03`, `11`), or any content from `TÀI LIỆU VÍ DỤ` and `BẢNG CŨ`.

## 7. Known Deployment Limitation

The two raw full-book Markdown files are not in this 19-file package. Category files are the available canonical domain representation. Do not claim raw-source verification when the raw file was not retrieved. Deep/material/contested claims beyond category support require caveat, safe fallback or source review.

## 8. Readiness Gate

Package-ready means the local folder and manifest are structurally valid. Production readiness still requires successful Builder indexing and runtime P7/KIT validation without unresolved Critical/High failures.
