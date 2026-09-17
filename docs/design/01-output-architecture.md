# 01 — SID Fit Coach Output Architecture

**Phase:** P1 — Output Architecture  
**Authority:** `design-conversation-architect.md` V3  
**Language:** Vietnamese-first

> Đây là artifact mới. File cũ chỉ dùng tham khảo. Safety Rules, Knowledge Router và State Machine thuộc P2–P4.

## 1. Design Goal

```text
User need + context sufficiency + risk + requested depth
→ output contract + modality + generation profile
```

Output phải đúng intent, có thể hành động, không quá tải, một câu hỏi chính mỗi lượt, không hỏi lại dữ liệu còn hiệu lực, chỉ advice sau khi đủ distinction, và dùng tiếng Việt tự nhiên. Thuật ngữ chuyên môn chỉ dùng khi cần và giải thích ngắn.

Cấu trúc lượt là các block linh hoạt:

```text
Acknowledge/Mirror (khi có ích)
+ một insight (khi cần)
+ một primary question HOẶC 1–3 actions
+ uncertainty/safety slot (khi cần)
+ next trigger (khi cần continuity)
```

## 2. Source-derived Requirements

| ID | Requirement | Source | Status |
|---|---|---|---|
| SR-01 | Vietnamese-first; không lộ taxonomy nội bộ | Conversation Design §1.2, §13 | FACT — project rule |
| SR-02 | Một primary question/lượt | Conversation Design §11.3, §15 | FACT — project rule |
| SR-03 | Không hỏi lại fact còn hiệu lực | Conversation Design §8 | FACT — project rule |
| SR-04 | Safety trước advice | Conversation Design Operating Loop, §9 | FACT — project rule |
| SR-05 | Chỉ giải thích knowledge cần cho decision | Conversation Design §7, §15.2 | FACT — project rule |
| SR-06 | Advice phải qua decision-before-advice gate | Conversation Design §15.1 | FACT — project rule |
| SR-07 | Mirror optional, không tự gán cảm xúc | Conversation Design §12 | FACT — project rule |
| SR-08 | Độ dài thích ứng theo turn | Conversation Design §14 | FACT — project rule |
| SR-09 | Decision turn tối đa 1–3 actions | Conversation Design §14–15 | FACT — project rule |
| SR-10 | Safety output ngắn, trực tiếp, không chẩn đoán/workaround | Conversation Design §9.2 | FACT — project rule |
| SR-11 | Mixed evidence giữ caveat | KB README và 16 decomposition §6–7 | FACT — source rule |
| SR-12 | Output bao phủ explanation, comparison, planning, measurement, adjustment, adherence | 16 category decompositions | FACT — coverage |
| SR-13 | Hỗ trợ visual qua `gym-visual-coach` | User-confirmed capability | USER FACT |
| SR-14 | Sampling chỉ dùng nếu platform hỗ trợ | Conversation Design §19 | RECOMMENDATION |

Epistemic status dùng nội bộ để audit. End-user thấy câu tự nhiên như “chưa đủ dữ liệu để kết luận”, không thấy nhãn `FACT/HYPOTHESIS` máy móc.

## 3. Output Taxonomy

| ID | Loại output | Purpose | Trigger |
|---|---|---|---|
| OA-01 | Làm rõ trọng điểm | Lấy một input làm đổi decision | Thiếu context quan trọng |
| OA-02 | Đánh giá theo bối cảnh | Đặt signal vào đúng time horizon | Check-in/log/measurement |
| OA-03 | Giải thích trực tiếp | Trả lời “là gì/vì sao” | Knowledge question |
| OA-04 | So sánh lựa chọn | Tách trade-off để chọn A/B | Có nhiều option |
| OA-05 | Khuyến nghị hành động | Chốt 1–3 actions | Đủ precondition, safety clear |
| OA-06 | Kế hoạch có cấu trúc | Tạo plan thực hiện và đo được | Yêu cầu workout/nutrition plan |
| OA-07 | Điều chỉnh kế hoạch | Sửa phần bị ảnh hưởng | Feedback/constraint/goal đổi |
| OA-08 | Xử lý vấn đề | Tách khả năng và next test | Plateau/fatigue/result lệch |
| OA-09 | Check-in / review | Tách snapshot/trend, chốt focus | Daily/weekly review |
| OA-10 | Ước lượng có sai số | Cho range và uncertainty | Meal text/photo |
| OA-11 | Chuyển hướng an toàn | Dừng coaching thường | Safety trigger |
| OA-12 | Chuyển hướng phạm vi | Giữ boundary, route phù hợp | Ngoài scope/capability |
| OA-13 | Tóm tắt tiếp nối | Đóng gói confirmed context | Lưu/xem/khôi phục/handoff |
| OA-14 | Hướng dẫn thực hiện | Chỉ dẫn setup/form/how-to | User cần cách làm |
| OA-15 | Coaching bằng hình ảnh | Làm rõ giải phẫu/form | Visual có utility rõ |

Boundary: OA-02 đánh giá một signal, OA-09 tổng hợp tiến trình; OA-03 giải thích, OA-14 hướng dẫn; OA-04 so option đã biết, OA-08 điều tra result lệch; OA-05 action mới, OA-07 sửa active plan; OA-11 do risk, OA-12 do scope.

## 4. Response Contracts

Mỗi contract áp dụng schema: Purpose → Trigger → Required Inputs → Required Blocks → Optional Blocks → Forbidden → Depth → Personalization → Safety/Uncertainty → Next Action → Exit.

### OA-01 — Làm rõ trọng điểm
- **Inputs:** message, known context, critical unknown.
- **Required:** acknowledge nếu cần + một primary question.
- **Optional:** một insight “vì sao hỏi”; 2–3 lựa chọn cùng test một distinction.
- **Forbidden:** bundle câu hỏi, hỏi lại fact, jargon, advice sớm.
- **Depth:** D1. **Exit:** đủ input để route hoặc cần wording repair.

### OA-02 — Đánh giá theo bối cảnh
- **Inputs:** signal, time horizon, baseline nếu có.
- **Required:** fact đúng + nhận định có điều kiện + ý nghĩa hiện tại.
- **Optional:** OA-01 hoặc next observation.
- **Forbidden:** snapshot thành trend, cause certainty, diagnosis.
- **Depth:** D1–D2. **Exit:** meaning và bước tiếp rõ.

### OA-03 — Giải thích trực tiếp
- **Inputs:** câu hỏi, source support, technical preference nếu biết.
- **Required:** direct answer + practical meaning.
- **Optional:** ví dụ, comparison, caveat.
- **Forbidden:** knowledge dump, jargon không giải thích, cá nhân hóa thiếu context.
- **Depth:** D1–D3. **Exit:** user hiểu khái niệm/lý do và ứng dụng.

### OA-04 — So sánh lựa chọn
- **Inputs:** options, goal, constraints.
- **Required:** criteria + khác biệt + lựa chọn có điều kiện/OA-01.
- **Optional:** bảng ngắn, pros/cons.
- **Forbidden:** “tốt nhất” phổ quát, quá nhiều option.
- **Depth:** D2–D3. **Exit:** factors và decision rõ.

### OA-05 — Khuyến nghị hành động
- **Inputs:** goal, facts, constraints, rationale, safety clear.
- **Required:** kết luận + lý do cốt lõi + 1–3 actions.
- **Optional:** alternative, monitoring, next trigger.
- **Forbidden:** premature/generic advice, guarantee, hơn ba actions.
- **Depth:** D1–D2. **Exit:** biết làm gì, vì sao, khi review.

### OA-06 — Kế hoạch có cấu trúc
- **Inputs:** goal, schedule, equipment/resources, experience, constraints, preferences.
- **Required:** goal/scope + gaps + plan + execution + progression/review.
- **Optional:** table, substitutions, OA-15, export-ready layout.
- **Forbidden:** false precision, hidden assumption, rigid universal plan.
- **Depth:** D4. **Exit:** plan triển khai, đo và review được.

### OA-07 — Điều chỉnh kế hoạch
- **Inputs:** active plan, new fact, affected dependency.
- **Required:** phần giữ + phần đổi + lý do + review trigger.
- **Forbidden:** viết lại toàn plan, đổi nhiều biến vô cớ, snapshot thành trend.
- **Depth:** D2–D4. **Exit:** version mới và review point rõ.

### OA-08 — Xử lý vấn đề
- **Inputs:** baseline, pattern, recent changes, co-signals, safety.
- **Required:** framing + evidence + highest-value difference + OA-01/action test.
- **Forbidden:** khẳng định root cause, checklist dài, diagnosis.
- **Depth:** D2–D3. **Exit:** có branch hoặc dữ liệu tiếp theo.

### OA-09 — Check-in / review
- **Inputs:** time window, metrics, adherence, goal.
- **Required:** dữ liệu có thật + snapshot/trend + kết luận giới hạn + một focus.
- **Optional:** scorecard, OA-07.
- **Forbidden:** fabricated metric, automatic change, moral judgment.
- **Depth:** daily D1–D2; weekly D3–D4. **Exit:** biết giữ/đổi/theo dõi gì.

### OA-10 — Ước lượng có sai số
- **Inputs:** thành phần quan sát/mô tả được.
- **Required:** điều nhận diện + range + nguồn sai số chính.
- **Optional:** một clarification, cách cân bằng.
- **Forbidden:** số chính xác giả, assumption ẩn, bù trừ cực đoan.
- **Depth:** D1–D2. **Exit:** có range và hiểu limitation.

### OA-11 — Chuyển hướng an toàn
- **Inputs:** exact reported fact, trigger context nếu biết.
- **Required:** acknowledge + safety priority + stop trigger + qualified support + diagnostic boundary.
- **Forbidden:** diagnosis, reassurance, workaround workout, treatment.
- **Depth:** D1–D2; không cắt action. **Exit:** dừng normal coaching; P2 định nghĩa điều kiện quay lại.

### OA-12 — Chuyển hướng phạm vi
- **Inputs:** loại request, phần còn hỗ trợ được.
- **Required:** boundary ngắn + route phù hợp.
- **Forbidden:** refusal chung, phán xét, giả capability.
- **Depth:** D1–D2. **Exit:** biết giới hạn và bước phù hợp.

### OA-13 — Tóm tắt tiếp nối
- **Inputs:** confirmed facts, current decision, constraints, next trigger.
- **Required:** stable facts + timestamped state + decision + next review.
- **Forbidden:** diagnosis/hypothesis thành fact, permanent-memory claim, data thừa.
- **Depth:** D2–D4. **Exit:** lượt sau tiếp tục không reset.

### OA-14 — Hướng dẫn thực hiện
- **Inputs:** task, equipment/context, experience/limitations khi liên quan.
- **Required:** mục tiêu + setup + 2–3 cues + stop cue + self-check.
- **Optional:** substitute, giải thích thuật ngữ, OA-15.
- **Forbidden:** anatomy lecture, quá nhiều cues, rehabilitation.
- **Depth:** D2–D3. **Exit:** biết setup, cues và khi dừng.

### OA-15 — Coaching bằng hình ảnh
- **Inputs:** bài/chủ đề, góc nhìn, mục tiêu hình, phần nhấn.
- **Required:** `gym-visual-coach` request + caption Việt + 1–3 điểm quan sát + text fallback.
- **Forbidden:** hình chẩn đoán/treatment, hình trang trí, hình không hướng dẫn.
- **Depth:** D3–D4. **Exit:** visual giải quyết đúng ambiguity.

## 5. Adaptive Depth Model

| Depth | Dùng khi | Target UX |
|---|---|---:|
| D1 — Trả lời nhanh | Clarification/direct answer/action | 35–70 từ; soft ceiling ~90 |
| D2 — Coaching tiêu chuẩn | Assessment/recommendation/check-in | 50–120 từ; mirror ~140 |
| D3 — Giải thích sâu | User yêu cầu bản chất/comparison | 120–220 từ; mở rộng theo yêu cầu |
| D4 — Kế hoạch có cấu trúc | Plan/review/table/visual brief | Không ceiling từ cứng; ưu tiên scanability |

```text
Safety → OA-11 D1–D2
Critical context thiếu → OA-01 D1
Deep explanation requested → D3
Plan/review/visual artifact → D4
Còn lại → D1/D2 theo complexity
```

Compression: cắt ví dụ phụ → context lặp → background chưa cần → secondary action. Không cắt safety, uncertainty ảnh hưởng decision, primary question, core rationale.

## 6. Information Priority

### P0
Direct answer/primary question; safety action; core rationale; material uncertainty; estimate range/error source; blocking gap; scope boundary; next action cần thiết.

### P1
Mirror chính xác; confirmed personalization; một insight; monitoring/next trigger; alternative; phần giữ nguyên khi adjustment; visual caption/cues.

### P2
Background science; nhiều ví dụ; bảng dài; secondary alternatives; citations chi tiết; anatomy depth; full memory schema; export formatting.

**Priority proposal:** Safety > correctness/uncertainty > decision > preference > personalization > style > brevity > enrichment. P2 formalize rule này.

## 7. Output Selection Matrix

| Need | Context | Risk | Primary | Supporting | Depth |
|---|---|---|---|---|---|
| Khái niệm nhanh | Đủ | Clear | OA-03 | — | D1 |
| Hiểu sâu | Đủ source | Clear | OA-03 | OA-04 | D3 |
| Advice thiếu discriminator | Thiếu | Clear/unclear | OA-01 | — | D1 |
| Chọn A/B | Đủ | Clear | OA-04 | OA-05 | D2–D3 |
| Chốt action | Đủ | Clear | OA-05 | OA-02 | D2 |
| Workout/nutrition plan | Đủ | Clear | OA-06 | OA-14/15 | D4 |
| Feedback đổi plan | Có active plan | Clear | OA-07 | OA-09 | D2–D4 |
| Kết quả bất thường | Chưa rõ cause | Clear/unclear | OA-08 | OA-01/02 | D2–D3 |
| Daily/weekly review | Snapshot/time-series | Clear | OA-09 | OA-02/07 | D1–D4 |
| Meal estimate | Partial | Clear | OA-10 | OA-05 | D1–D2 |
| Red flag | Bất kỳ | High | OA-11 | — | D1–D2 |
| Ngoài scope | Bất kỳ | Normal | OA-12 | in-scope OA | D1 |
| Continuity | Confirmed | Theo context | OA-13 | — | D2–D4 |
| How-to/form | Đủ task | Clear | OA-14 | OA-15 | D2–D3 |
| Hình form/giải phẫu | Đủ brief | Clear | OA-15 | OA-14/03 | D3–D4 |

### 7.1 Selection order

Safety/scope → user need → context freshness → OA-01 nếu thiếu critical input → primary contract → depth/modality → tối đa một supporting contract → priority → generation profile.

### 7.2 Generation Profiles

Chỉ áp dụng nếu provider hỗ trợ:

| Profile | Use | Temperature | Top-p | Top-k | Max output guidance |
|---|---|---:|---:|---:|---|
| GP-01 Stable Coach | OA-01/02/05/07/09/10/12/13/14 | 0.35–0.50 | 0.88–0.93 | 32–48 | Theo D1/D2; token đủ tránh cắt câu |
| GP-02 Safety & Evidence | OA-11; evidence-sensitive OA-03/08 | 0.10–0.25 | 0.78–0.86 | 16–28 | D1/D2; không cắt escalation |
| GP-03 Deep Explanation | OA-03/04/08 D3 | 0.35–0.55 | 0.90–0.94 | 36–52 | Đủ 120–220+ từ |
| GP-04 Structured Artifact | OA-06/09/13/15 D4 | 0.30–0.50 | 0.88–0.94 | 32–48 | Theo kích thước plan/table/visual brief |

`max_length`/max output tokens là giới hạn hạ tầng, không đồng nhất word budget UX. Không chỉnh top-p/top-k ngẫu nhiên từng câu; router chọn profile theo contract/risk/depth. Provider không hỗ trợ top-k thì bỏ. Sampling chỉ đổi wording, không đổi safety, evidence hay decision.

## 8. Architecture Conflict Register

| Tension | Impact | Decision bản mới |
|---|---|---|
| File cũ cho 2 câu hỏi; V3 cho 1 primary question | Interview bot | Theo V3 |
| Template cũ phơi epistemic labels | Robotic output | Track nội bộ, diễn đạt tự nhiên |
| Master cũ chạy workflow trong một answer | Advice sớm/overload | Progressive disclosure |
| Word budget khác max tokens | Cắt output/quá dài | Lưu và test riêng |
| Platform có thể không expose top-p/top-k | Config không áp dụng được | Optional deployment profile |
| Chưa có interface `gym-visual-coach` | Chưa gọi chính xác | OA-15 + validate sau |

## 9. Open Gaps

| ID | Gap | Handoff |
|---|---|---|
| GAP-01 | Safety class/rule ID | P2 |
| GAP-02 | State ID/transitions | P4 |
| GAP-03 | Knowledge node → output | P3 |
| GAP-04 | Interface `gym-visual-coach` | Validate khi runtime implementation |
| GAP-05 | Provider/token limits | Benchmark |
| GAP-06 | PDF/QR/export runtime | Không hứa; export-ready/fallback |
| GAP-07 | Source conflict authority | P3 |
| GAP-08 | Technical-depth preference schema | P4 |
| GAP-09 | Competition/weight-making risk | P2 |

## 10. Evaluation Checklist

- [x] 15 output types có purpose riêng và boundary.
- [x] Mỗi contract có input, blocks, forbidden, depth và exit.
- [x] Có selection logic, adaptive depth, P0/P1/P2.
- [x] Bám one-primary-question và progressive disclosure.
- [x] Vietnamese-first; thuật ngữ phải giải thích.
- [x] Safety có vị trí nhưng chưa over-design P2.
- [x] Bao phủ 16 decomposition: science, training variables, program design, measurement, nutrition, supplements, adherence và competition/recovery.
- [x] OA-15 bao phủ visual coaching.
- [x] Tách UX word budget khỏi max output tokens.
- [x] Top-p/top-k theo profile và không đổi decision logic.

## 11. Handoff to Reasoning & Safety

P2 cần formalize:

1. Khi nào uncertainty bắt buộc và wording tự nhiên.
2. Minimum inputs cho OA-05/06/07.
3. Trigger chọn OA-11 so với OA-01 safety clarification.
4. Scope cho competition/weight making/supplements/medical context.
5. Allowed/forbidden behavior và điều kiện quay lại coaching.
6. Confidence khi nào ảnh hưởng action.
7. Conflict priority ở §6.
8. Personalization ceiling khi thiếu context/risk unclear.
9. Cấm OA-15 dùng để diagnosis/treatment.
10. Safety action bất biến theo generation profile.

## Verdict

# READY_FOR_P2

1. Contract taxonomy không trùng chức năng lớn.
2. Có selection, depth, priority và generation control.
3. Bám Conversation Design V3 và Vietnamese-first.
4. Bao phủ decomposition mà chưa lấn P3.
5. Safety/rule needs được handoff rõ.
