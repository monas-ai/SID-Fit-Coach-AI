# Error Matrix — Old repo vs SID restructure

So sánh lỗi / risk của `Nohfinl99/Fit_Coach-AI_V1` (flat) với `monas-ai/SID-Fit-Coach-AI` (restructured + P5.3 humanizer/skills).

Nguồn: master change log P5.1–P5.3, deployment layout, production instruction, integration tests.

Machine-readable: [`error_matrix.json`](./error_matrix.json) · [`error_matrix.csv`](./error_matrix.csv)

---

## Legend

| Field | Meaning |
|---|---|
| `ERR-*` | ID ổn định |
| Severity | Critical / High / Medium / Low |
| Layer | structure · routing · continuity · retrieval · ux · scope · safety · packaging · docs · skills |
| Old status | observed / latent risk in upstream flat pack |
| New status | fixed / mitigated / still open |
| Owner | anh Minh (product) · monas-ai (packaging) |

---

## Matrix

| ID | Layer | Severity | Lỗi / risk (repo cũ) | Tác động | Fix (repo mới) | Status mới | Evidence |
|---|---|---|---|---|---|---|---|
| ERR-01 | structure | High | 33 file phẳng root: controller + design + QA + superseded lẫn nhau | Upload nhầm design/QA; agent retrieve file sai | Tách `knowledge/` · `docs/design|qa|deployment/` · `GPT_UPLOAD_READY/` | **fixed** | STRUCTURE + tree |
| ERR-02 | packaging | Critical | README = dump GPT instructions; không map deploy | Owner/reviewer không biết upload gì | README hiện đại: purpose · scope · 19-file pack · deploy 4 bước | **fixed** | README.md |
| ERR-03 | routing | High | Deploy song song `03` + `11` (semantic gần → retrieval cạnh tranh) | Context bloat, route conflict | Gộp → `13-knowledge-routing-and-behavior.md`; 03/11 reference-only | **fixed** | P5.1 change log |
| ERR-04 | packaging | High | Manifest 20 files (2 routing) | Dư file, risk index sai | Manifest **19 files** chuẩn | **fixed** | A0.1 + pack script |
| ERR-05 | routing | High | Master phụ thuộc `01`, `04` nhưng **không upload** → model bịa content | Hallucinate state/output contract | Dependencies runtime chỉ `02` + `13` | **fixed** | P5.1 §3 |
| ERR-06 | packaging | High | Không có pack phẳng sẵn upload | Người deploy copy sai / thiếu file | `GPT_UPLOAD_READY/` + `scripts/pack_gpt_upload.sh` (assert = 19) | **fixed** | pack script |
| ERR-07 | continuity | High | Không protocol phiên mới/kết phiên → giả nhớ hoặc bắt user kể lại | Churn #1 | A11.1 Session Continuity Protocol | **mitigated** | Master A11.1 |
| ERR-08 | retrieval | Critical | Không verification sau retrieve → advice lệch population/context | User không phát hiện advice sai nguồn | A4.1 Retrieval Verification Gate | **mitigated** | Master A4.1 |
| ERR-09 | ux | High | First turn toàn clarify → time-to-value cao | User bỏ cuộc | A10.1 First-Turn Value Delivery | **mitigated** | Master A10.1 |
| ERR-10 | ux | Medium | Self-check mơ hồ, thiếu fail-action | Bundle Q, dump KB, premature advice | A14.1 checklist + fail mapping (+ P5.3 skill/humanizer checks) | **mitigated** | Master A14.1 |
| ERR-11 | ux | Medium | Style thiếu hook / plain-language / anti-pattern | Giọng robot, jargon, fake empathy | A12.1–A12.4 + **A12.5 Humanizer** | **mitigated** | Master A12 |
| ERR-12 | docs | Medium | Superseded `03`/`11` nằm cạnh authority | Người mới upload nhầm | Chuyển `docs/design/`, đánh dấu SUPERSEDED | **fixed** | docs/design |
| ERR-13 | docs | Medium | Design-only (`01`,`04`,`06`, conversation architect, pain miner) lẫn runtime | Agent/design confusion | Chỉ trong `docs/design/` — **không** upload | **fixed** | tree |
| ERR-14 | scope | Critical | Off-topic gate yếu (chỉ professional/medical boundary) | Agent trả lời ngoài Fit Coach | **Hard FitCoach-only domain gate** trong production instruction + Master A3.1 | **fixed** | instruction + master |
| ERR-15 | safety | High | Safety rules đầy đủ nhưng dễ bị instruction attack / “bỏ rule” | Override scope/safety | Anti-override + refuse off-topic giữ nguyên | **mitigated** | 02 + production instr. |
| ERR-16 | qa | Medium | KIT structural/runtime phần lớn `NOT_RUN` / platform blocked | Chưa chứng minh live GPT | Giữ test suite; cần owner chạy trên Builder | **open** | docs/qa/12 |
| ERR-17 | packaging | Low | Không changelog / error ledger cho owner review | Khó audit diff | CHANGELOG + ERROR_MATRIX (md/json/csv) | **fixed** | docs/qa |
| ERR-18 | identity | Medium | Credit/ownership upstream mơ hồ trên mirror | Nhầm maintainer | README credit rõ: content `Nohfinl99` · restructure `monas-ai` | **fixed** | README |
| ERR-19 | ux | High | Giọng robot / empty praise / template mở bài | User cảm giác chatbot form | **A12.5 Humanizer** + production instr. voice contract + few-shot | **mitigated** | Master A12.5 · instr P5.3 |
| ERR-20 | skills | High | OA registry không có must-have playbook → plan/check-in lệch xương | Output thiếu block, generic coach | **A15 Full Skills S1–S17** must-have/cấm; 1 primary skill/turn | **mitigated** | Master A15 · instr §3 |
| ERR-21 | skills | Medium | Không skill visual/artifact rõ cho Business GPT | Bảng/chart yếu hoặc bịa số | **S14** table/checklist + chart only from user data + Canvas note | **mitigated** | A15 S14 · instr S14 |
| ERR-22 | packaging | Medium | Production instruction ngắn, thiếu skill+humanizer runtime surface | Builder chỉ dán contract loãng | Rewrite `10-…production-instruction.md` P5.3 full runtime | **fixed** | docs/deployment/10 |

---

## Tóm tắt theo status

| Status | Count | IDs |
|---|---:|---|
| fixed | 12 | 01 02 03 04 05 06 12 13 14 17 18 22 |
| mitigated (cần runtime validate) | 9 | 07 08 09 10 11 15 19 20 21 |
| open | 1 | 16 |

## Việc anh Minh nên làm tiếp

1. Upload đúng pack `GPT_UPLOAD_READY/` (19 knowledge + paste instructions **P5.3**).
2. Smoke: off-topic · safety · RIR humanizer · plan đủ 5 block · bảng so sánh · supplement+meds.
3. Đánh dấu KIT-101…112 khi chạy live.
4. Không upload `docs/**`.
