# 04 — SID Fit Coach Conversation State Architecture

**Phase:** P4 — Workflow & Conversation State  
**Authority:** `design-conversation-architect.md` V3  
**Dependencies:** `01-output-architecture.md`, `02-reasoning-safety-rules.md`, `03-knowledge-behavior-map.md`  
**Status:** New architecture artifact; không sửa hoặc thay thế file cũ

> State biểu diễn cognitive condition hiện tại, không phải chủ đề sách. Transition chỉ xảy ra khi có signal/condition kiểm chứng được; không chuyển state chỉ vì bot vừa trả lời xong.

## 1. State Model Principles

```text
Input → retrieve fresh context → frame state
→ global interrupt/safety → context gate
→ knowledge route + KBC → reasoning/decision gate
→ output → writeback → transition evaluation
```

1. Mỗi state có một primary cognitive task.
2. Safety có thể interrupt mọi state.
3. Một lượt hỏi tối đa một primary question.
4. Output không mặc định tạo transition.
5. Knowledge chỉ dùng qua `BK/KN` map và `KBC-01`–`KBC-08`.
6. Recommendation chỉ xuất sau `DP` gate và safety phù hợp.
7. Current facts có freshness; hypothesis không tự thành fact.
8. State phải có entry, exit, fallback và progress condition.
9. Style/length không đổi state, safety hoặc action logic.
10. P4 reference upstream IDs thay vì duplicate policy.

## 2. State Registry

| State | Tên | Purpose | Entry summary | Exit summary |
|---|---|---|---|---|
| `CS-00` | Entry / Frame | Xác định signal, intent, decision và context | Tin mới/chủ đề mới/route chưa rõ | Intent/state đích hoặc interrupt rõ |
| `CS-10` | Clarify | Lấy một input có thể đổi branch/action | Critical unknown tồn tại | Input đủ, user không biết, hoặc redirect |
| `CS-20` | Assess | Đặt fact/signal vào baseline và time horizon | Có dữ liệu cần contextualize | Meaning đủ cho decide/review hoặc cần clarify |
| `CS-30` | Explain / Compare | Giải thích meaning/cơ chế/trade-off | User cần hiểu, không nhất thiết cần plan | Need đã đáp ứng hoặc user yêu cầu quyết định/plan |
| `CS-40` | Formulate | Chọn recommendation/option phù hợp | DP gate gần đủ/đủ; safety clear | Action được chốt, plan cần xây, hoặc thiếu input |
| `CS-50` | Build Plan | Tạo plan có cấu trúc và đo được | User yêu cầu plan; DP gate đủ | Plan hợp lệ và được trình bày/accepted |
| `CS-60` | Active Plan | Giữ active plan và chờ execution/feedback | Plan tồn tại | Check-in, constraint/goal change, safety hoặc closure |
| `CS-70` | Review | Đánh giá check-in/snapshot/trend | Có feedback/log/time window | Maintain, adjust, clarify hoặc safety |
| `CS-80` | Adjust | Sửa dependency bị ảnh hưởng trong plan | Evidence/constraint/goal đòi thay đổi | Plan version mới hoặc thiếu context |
| `CS-90` | Safety / Redirect | Xử lý `SC-B/C/D` và pause normal coaching | Global safety/scope interrupt | Clarified route, bounded resume hoặc professional redirect |
| `CS-95` | Continuity | Save/view/restore/forget/handoff context | Memory command hoặc context transfer | Context reconciled và state tiếp theo rõ |

## 3. State Specifications

### CS-00 — Entry / Frame

- **Entry:** message mới; topic/goal đổi; resume chưa rõ.
- **Required context:** current message; fresh stable context nếu có.
- **Cognitive task:** xác định user cần explanation, decision, plan, review, action hay safety handling.
- **Knowledge:** chưa retrieve sâu; chỉ metadata/route hints.
- **Reasoning:** frame trước; `RM-07` nếu có risk signal.
- **Outputs:** `OA-01`, `OA-03`, `OA-11`, `OA-12`.
- **Safety:** chạy `SAFE-01` và scope gate trước route thường.
- **Exit:** intent + required condition đủ để chọn `CS-10/20/30/40/50/70/90/95`.
- **Writeback:** chỉ exact signal/intent nếu user nói rõ.
- **Fallback:** ambiguous nhưng không material → chọn generic direct response; material → `CS-10`.

### CS-10 — Clarify

- **Entry:** một decision-relevant unknown; `SC-B`; conflict cần xác nhận.
- **Required context:** known facts, missing item, branches mà answer có thể đổi.
- **Cognitive task:** chọn one next-best question.
- **Knowledge:** minimum node metadata; không knowledge dump.
- **Reasoning:** mode hỗ trợ theo task; `RM-07` cho safety clarification.
- **Outputs:** `OA-01`.
- **Safety:** `SAFE-03`; nếu supported trigger rõ → `CS-90`.
- **Exit:** answer đủ route; user không biết; question không còn đổi decision.
- **Next:** `CS-20/30/40/50/70/80/90`.
- **Writeback:** confirmed answer; không lưu guessed answer.
- **Fallback:** đổi abstract label thành behavior anchor; sau repair không tiến triển → generic ceiling/redirect, không loop.

### CS-20 — Assess

- **Entry:** signal, measurement hoặc context cần interpretation.
- **Required context:** fact, baseline/time horizon; `DP-04/06/10` khi liên quan.
- **Cognitive task:** tách snapshot/trend, signal/meaning và uncertainty.
- **Knowledge:** `BK-ASSESS`, `BK-RECOVERY`, `BK-ENERGY`; `KN-MPA-01`, `KN-HPD-02`, `KN-EBW-01/02`.
- **Reasoning:** `RM-06`, hỗ trợ `RM-03`.
- **Outputs:** `OA-02`, `OA-08`, `OA-09`; `OA-01` nếu thiếu.
- **Safety:** pain/systemic signal chạy `TRG-01/02/03`.
- **Exit:** meaning đủ cho `CS-40`; longitudinal review → `CS-70`; thiếu → `CS-10`.
- **Writeback:** timestamped current facts và bounded assessment.
- **Fallback:** nói rõ chưa đủ để kết luận cause; chọn next observation.

### CS-30 — Explain / Compare

- **Entry:** user hỏi “là gì/vì sao/A hay B”; safety clear.
- **Required context:** question/options; goal/constraints khi lựa chọn phụ thuộc context.
- **Cognitive task:** direct explanation hoặc trade-off.
- **Knowledge:** `BK-EXPLAIN`, `BK-COMPARE` và node tối thiểu phù hợp.
- **Reasoning:** `RM-04` hoặc `RM-02`.
- **Outputs:** `OA-03`, `OA-04`; hỗ trợ `OA-05` chỉ khi DP đủ.
- **Safety:** KBC evidence/context checks; risk-sensitive node → `CS-90`.
- **Exit:** question được đáp ứng; user muốn action → `CS-40`; muốn plan → `CS-50`; thiếu criterion → `CS-10`.
- **Writeback:** preference/decision factor user xác nhận; không lưu background science.
- **Fallback:** mixed evidence → conditional branches/caveat.

### CS-40 — Formulate

- **Entry:** context đủ để chọn action/option; safety `SC-A`.
- **Required context:** applicable `DP-01`–`DP-13`; relevant `KN/BK` passed KBC.
- **Cognitive task:** chọn action phù hợp hơn alternatives.
- **Knowledge:** class theo decision; minimum sufficient nodes.
- **Reasoning:** `RM-02`, `RM-03` hoặc `RM-05`.
- **Outputs:** `OA-05`; `OA-04/07/14/15` khi phù hợp.
- **Safety:** no recommendation khi `SC-B/C/D` chưa giải quyết.
- **Exit:** action được đưa; structured plan cần → `CS-50`; active plan change → `CS-80`.
- **Writeback:** decision, rationale, next trigger.
- **Fallback:** DP thiếu → `CS-10`; knowledge fail → caveat/generalize/redirect.

### CS-50 — Build Plan

- **Entry:** request plan + minimum inputs hợp lệ.
- **Required context:** `DP-01` hoặc `DP-07`; goal, schedule/resources, experience, constraints, preferences.
- **Cognitive task:** tạo plan thực thi, tiến triển và review được.
- **Knowledge:** `BK-PROGRAM/PROGRESS/EXERCISE/ENERGY/NUTRITION` theo scope.
- **Reasoning:** `RM-05`, hỗ trợ `RM-01/02`.
- **Outputs:** `OA-06`, hỗ trợ `OA-14/15`.
- **Safety:** risk/condition check; assumptions phải hiện.
- **Exit:** plan có execution + measurement + review trigger.
- **Next:** `CS-60`; nếu blocker → `CS-10/90`.
- **Writeback:** plan version, confirmed targets, dependencies, review trigger.
- **Fallback:** framework/starting point thay false precision.

### CS-60 — Active Plan

- **Entry:** plan đã được tạo/khôi phục và context hợp lệ.
- **Required context:** current plan version, goal, constraints, next review trigger.
- **Cognitive task:** giữ continuity; không tự thay đổi plan.
- **Knowledge:** chỉ retrieve khi user hỏi/thực thi hoặc có feedback.
- **Reasoning:** theo request; không có default plan rewrite.
- **Outputs:** `OA-05`, `OA-13`, `OA-14/15`.
- **Safety:** global interrupts luôn active.
- **Exit:** feedback → `CS-20/70`; material change → `CS-80`; safety → `CS-90`; memory command → `CS-95`.
- **Writeback:** execution facts và next trigger; không tạo compliance trait.
- **Fallback:** thiếu active-plan detail → `CS-10` hoặc `CS-95` restore.

### CS-70 — Review

- **Entry:** check-in, daily/weekly data hoặc trigger review đạt.
- **Required context:** window, metrics thực có, active goal/plan.
- **Cognitive task:** đánh giá evidence và chọn maintain/adjust/observe.
- **Knowledge:** `BK-ASSESS/PROGRESS/RECOVERY/BEHAVIOR`; relevant KN nodes.
- **Reasoning:** `RM-06`, hỗ trợ `RM-03`.
- **Outputs:** `OA-09`, `OA-02`; hỗ trợ `OA-07`.
- **Safety:** new symptoms/unsafe behavior interrupt.
- **Exit:** maintain → `CS-60`; change justified → `CS-80`; missing → `CS-10`; safety → `CS-90`.
- **Writeback:** trend, adherence facts, review decision và rationale.
- **Fallback:** snapshot không đủ → maintain/observe, không automatic change.

### CS-80 — Adjust

- **Entry:** review evidence, new constraint hoặc goal change ảnh hưởng plan.
- **Required context:** active plan, changed fact, affected dependency, applicable DP.
- **Cognitive task:** giữ phần không ảnh hưởng; sửa đúng phần cần đổi.
- **Knowledge:** class/node gắn dependency bị ảnh hưởng.
- **Reasoning:** `RM-02/03/05/06` tùy cause của adjustment.
- **Outputs:** `OA-07`; hỗ trợ `OA-09`.
- **Safety:** safety change → `CS-90`, không workaround.
- **Exit:** plan version mới + review trigger → `CS-60`.
- **Writeback:** delta, reason, invalidated old field, next review.
- **Fallback:** evidence thiếu → `CS-10/70`; không viết lại toàn plan.

### CS-90 — Safety / Redirect

- **Entry:** `SC-B/C/D`, `SAFE-01`, `TRG-01`–`TRG-18`, scope boundary.
- **Required context:** exact reported fact và relevant current context.
- **Cognitive task:** clarify tối thiểu, stop normal coaching hoặc redirect.
- **Knowledge:** chỉ `BK-SAFETY-CONSTRAINT`/facts cần cho boundary.
- **Reasoning:** `RM-07`.
- **Outputs:** `OA-01`, `OA-11`, `OA-12`.
- **Safety:** `SC-C` ưu tiên nếu trùng `SC-D`; no diagnosis/treatment/workaround.
- **Exit:** `SC-B` được phân biệt; request chuyển in-scope; hoặc deliberate pause/redirect.
- **Next:** state phù hợp mới; không tự resume dựa trên bot clearance.
- **Writeback:** minimal timestamped user-reported safety fact và advice; không diagnosis.
- **Fallback:** qualified-support route; giữ general support tách khỏi trigger nếu an toàn.

### CS-95 — Continuity

- **Entry:** lưu/xem/khôi phục/quên hoặc handoff context.
- **Required context:** confirmed facts, plan, latest decision, timestamps.
- **Cognitive task:** tạo hoặc reconcile portable context.
- **Knowledge:** không cần domain retrieval trừ validation reference.
- **Reasoning:** procedural + conflict detection.
- **Outputs:** `OA-13`.
- **Safety:** sensitive data minimal; stale safety fact không thành current clearance.
- **Exit:** card/context hợp lệ và target state được xác định.
- **Next:** `CS-00/60/70/90` tùy restored condition.
- **Writeback:** chỉ confirmed/reconciled fields; “quên” ngừng dùng trong active context.
- **Fallback:** conflict → `CS-10`; missing noncritical → null/unknown.

## 4. Transition Table

| ID | Current | Signal/condition | Guard/action | Next | Writeback/failure |
|---|---|---|---|---|---|
| T-001 | CS-00 | Safety/scope signal | Apply P2 class | CS-90 | Exact fact only |
| T-002 | CS-00 | Material ambiguity | Identify highest-value unknown | CS-10 | No guessed intent |
| T-003 | CS-00 | Measurement/signal to interpret | Baseline/time check | CS-20 | Timestamp fact |
| T-004 | CS-00 | Knowledge/compare request clear | Select BK/KN + KBC | CS-30 | None required |
| T-005 | CS-00 | Action request + DP sufficient | Safety clear | CS-40 | Decision context |
| T-006 | CS-00 | Structured plan request | DP sufficient; else T-002 | CS-50 | Plan inputs |
| T-007 | CS-00 | Check-in with active plan | Window/data exists | CS-70 | Feedback facts |
| T-008 | CS-00 | Memory command | Route command | CS-95 | None until validate |
| T-010 | CS-10 | User supplies discriminator | Reframe after answer | CS-20/30/40/50/70/80/90 | Save confirmed answer |
| T-011 | CS-10 | User says “không biết” | Behavior-anchor repair once | CS-10 | If still blocked, generic/redirect |
| T-012 | CS-10 | Question no longer changes action | Stop asking | CS-30/40 | Mark unknown, ceiling |
| T-020 | CS-20 | Meaning sufficient, action requested | DP + KBC pass | CS-40 | Bounded assessment |
| T-021 | CS-20 | Longitudinal/active-plan review | Time window valid | CS-70 | Trend inputs |
| T-022 | CS-20 | Critical input absent | One question | CS-10 | Unknown remains unknown |
| T-030 | CS-30 | Explanation satisfied | No new decision | CS-30 | Remain/close, no forced transition |
| T-031 | CS-30 | User requests recommendation | DP check | CS-40/10 | Decision factors |
| T-032 | CS-30 | User requests plan | DP check | CS-50/10 | Plan intent |
| T-040 | CS-40 | Action can be expressed in 1–3 steps | OA-05 | CS-40/60 | Decision + next trigger |
| T-041 | CS-40 | Decision requires structured plan | DP sufficient | CS-50 | Selected direction |
| T-042 | CS-40 | Active-plan delta | Existing plan exists | CS-80 | Affected dependency |
| T-050 | CS-50 | Plan complete and valid | Execution/review blocks present | CS-60 | New plan version |
| T-051 | CS-50 | Blocking input/risk appears | Clarify or interrupt | CS-10/90 | No incomplete global draft |
| T-060 | CS-60 | New check-in | Determine snapshot/review | CS-20/70 | Timestamp feedback |
| T-061 | CS-60 | Goal/constraint changes materially | Invalidate affected dependency | CS-80 | New fact + old invalidation |
| T-062 | CS-60 | User needs form/how-to | DP-12 and safety clear | CS-30/40 | No plan rewrite |
| T-070 | CS-70 | Evidence supports maintain | No automatic change | CS-60 | Maintain rationale |
| T-071 | CS-70 | Evidence supports change | Affected dependency clear | CS-80 | Review conclusion |
| T-072 | CS-70 | Data insufficient | One blocker or observe | CS-10/60 | No false trend |
| T-080 | CS-80 | Delta valid | Keep unaffected plan | CS-60 | Version + rationale |
| T-081 | CS-80 | Cause/input unclear | Ask one material question | CS-10/70 | Do not rewrite plan |
| T-090 | CS-90 | SC-B clarified as normal | Re-frame original need | CS-00/20/30/40 | Current safety status only |
| T-091 | CS-90 | SC-C active | OA-11 and pause normal coaching | CS-90 | Safety advice; deliberate pause |
| T-092 | CS-90 | Request becomes in-scope | Boundary no longer active | CS-00/30 | Do not infer clearance |
| T-095 | CS-95 | Restore valid current plan | Conflict/freshness pass | CS-60/70 | Reconciled context |
| T-096 | CS-95 | Restore has conflict | One clarification | CS-10 | No silent overwrite |
| T-097 | CS-95 | Forget command | Stop using named field in active context | Prior valid state/CS-00 | No platform deletion claim |

## 5. Global Interrupts

| ID | Event | Required behavior | Route | Resume/exit |
|---|---|---|---|---|
| GI-01 | Safety signal | Interrupt; reclassify via P2 | CS-90 | T-090/091; no self-clearance |
| GI-02 | Out-of-scope request | Boundary + supported portion | CS-90 | Request becomes in-scope |
| GI-03 | Goal change | Invalidate affected decision/plan fields | CS-80 or CS-00 | New goal/context confirmed |
| GI-04 | Contradictory fact | State conflict; one question | CS-10 | Conflict reconciled |
| GI-05 | New constraint | Identify dependency, do not rewrite all | CS-80/10 | Delta valid |
| GI-06 | Recommendation rejected | Capture criterion/preference; do not repeat | CS-10/30/40 | Alternative distinguished |
| GI-07 | Knowledge gap/conflict | Apply P3 fallback/KBC | CS-10/30/90 | Caveat/route/source review |
| GI-08 | Memory command | Suspend normal task for continuity operation | CS-95 | Context operation complete |
| GI-09 | Instruction attack | Preserve safety/scope/state; answer valid portion only | Current/CS-90 | Valid intent remains |

All normal states `CS-00`–`CS-80` and `CS-95` expose GI-01. Interrupt does not erase prior context; it suspends conflicting normal coaching.

## 6. Memory Architecture

| Layer | Store | Update/invalidate | Do not store as fact |
|---|---|---|---|
| `MEM-S` Stable context | Confirmed goal, preference, equipment, schedule, experience | User-confirmed change | Guessed profile/persona |
| `MEM-SESS` Session context | Intent, active difference, critical unknown | Each answer/route | Irrelevant schema blanks |
| `MEM-H` Working hypothesis | Testable candidate explanations | Revise/drop after evidence | Diagnosis/cause certainty |
| `MEM-P` Current plan | Version, targets, dependencies, review rule | CS-50/80; invalidate affected fields | Incomplete draft as active plan |
| `MEM-F` Latest feedback | Timestamped check-in, function, performance, adherence | Each relevant check-in | Snapshot as trend |
| `MEM-SAFE` Safety context | Minimal user-reported fact and advice | Time-aware; retain only while relevant | Permanent “no red flags” clearance |
| `MEM-T` Temporary context | One-off wording/format/detail | End of task/turn | Stable trait inference |

### 6.1 Writeback contract

```yaml
writeback:
  confirmed_stable_facts: []
  timestamped_current_facts: []
  confirmed_concern: null
  current_decision: null
  rationale_refs: []
  plan_delta: null
  next_trigger: null
  active_safety_context: []
  do_not_save_as_fact: []
```

### 6.2 Memory rules

- `MEM-H` không tự promote sang `MEM-S/MEM-F`.
- Derived calculation chỉ lưu kèm source values/method đủ rõ.
- Stale field chuyển unknown/null hoặc được xác nhận; không giả current.
- Plan change phải trace tới user fact/trend/constraint.
- OA-13 là portable fallback; static knowledge file không phải live memory.
- Không nói “đã lưu vĩnh viễn”.
- Restore card: parse → freshness/conflict check → confirm blocker → route state.
- Forget: ngừng dùng field trong active context; không hứa thay đổi platform memory.

## 7. End-to-End Workflow

```text
A. RECEIVE
  exact message + active context
B. RETRIEVE
  MEM-S/P/F/SAFE with freshness
C. FRAME
  CS-00 identifies need/current condition
D. INTERRUPT
  GI registry + SC/SAFE/TRG
E. CONTEXT GATE
  already known? fresh? material unknown?
F. KNOWLEDGE
  BK → KN candidates → KBC-01..08
G. REASON
  one primary RM → applicable DP
H. OUTPUT
  OA + adaptive depth + one question OR 1–3 actions
I. WRITEBACK
  confirmed facts/decision/next trigger only
J. TRANSITION
  evaluate explicit T condition; otherwise remain
```

### 7.1 Execution precedence

```text
Global interrupt
> safety/scope
> freshness/conflict
> state entry/exit
> knowledge/reasoning
> output/style
> writeback/enrichment
```

### 7.2 No-progress repair

1. Không lặp nguyên câu hỏi.
2. Chuyển label trừu tượng thành behavior anchor.
3. Nếu answer không còn đổi action, dừng hỏi.
4. Dùng generic ceiling, caveat hoặc redirect.
5. Nêu next trigger để user quay lại khi có dữ liệu.

## 8. Dead-State, Loop và Coverage Analysis

| Check | Result | Control |
|---|---|---|
| Unreachable state | PASS | Mỗi state có incoming route trong T table |
| State không exit | PASS WITH BOUNDARY | CS-90 có deliberate pause T-091; resume không tự clearance |
| Clarification loop | PASS | T-011 repair một lần, T-012 generic ceiling |
| Explain/Formulate overlap | PASS | CS-30 hiểu/trade-off; CS-40 chốt action sau DP |
| Assess/Review overlap | PASS | CS-20 single signal; CS-70 active time window/plan decision |
| Review auto-adjust | PASS | T-070/071 tách maintain và justified change |
| Goal change ignored | PASS | GI-03/T-061 invalidates affected dependency |
| Memory restores stale fact | PASS | T-095/096 + freshness check |
| Safety unavailable from normal state | PASS | GI-01 global reachability |
| Knowledge bypasses P2/P3 | PASS | KBC trước output; state references only |

### 8.1 Upstream coverage

- Outputs: `OA-01`–`OA-15` được phân bổ; OA-11/12 tại CS-90, OA-13 tại CS-95.
- Reasoning: `RM-01`–`RM-07` có state route.
- Decisions: `DP-01`–`DP-13` được gọi theo state/domain, không duplicate.
- Safety: `SC-A`–`SC-D`, `SAFE-01`–`SAFE-05`, `TRG-01`–`TRG-18` qua GI-01/CS-90.
- Knowledge: 14 `BK` classes và 24 `KN` clusters khả dụng qua CS-20/30/40/50/70/80; explain-only/constraint nodes giữ P3 ceiling.
- Checkpoints: `KBC-01`–`KBC-08` nằm trước reasoning/output/writeback.

## 9. Conflicts with Existing Conversation/Memory Design

| ID | Tension | P4 decision |
|---|---|---|
| CF-01 | Memory protocol cũ chứa profile cá nhân mẫu | Không kế thừa giá trị; chỉ dùng schema principles |
| CF-02 | `no current red flags reported` dễ thành clearance | Chỉ user-reported timestamped context; không permanent fact |
| CF-03 | Command-based memory có thể bị hiểu là state truth | Command là interface; validated context mới là state input |
| CF-04 | Platform memory availability không chắc | Conversation-scoped + OA-13 portable fallback |
| CF-05 | Candidate state có thể thành topic taxonomy | State khóa theo cognitive condition và exit behavior |
| CF-06 | Output completion dễ bị dùng làm transition | T table yêu cầu explicit signal/guard |
| CF-07 | Safety state có thể thành dead end | Deliberate pause được phép; resume cần new valid signal, không bot clearance |

## 10. Evaluation Checklist

- [x] Mỗi state có purpose, entry, required context, task, knowledge, outputs, safety, exit, next, memory và fallback.
- [x] Transitions dựa trên signal/guard.
- [x] Safety interrupt đi từ mọi normal state.
- [x] Knowledge router và KBC được tích hợp trước output.
- [x] Output contracts được tích hợp theo state.
- [x] Memory không biến hypothesis/snapshot thành fact/trend.
- [x] Có repair cho unknown/off-topic/no-progress.
- [x] Không có orphan state rõ ràng.
- [x] Deliberate safety pause được phân biệt với dead state.
- [x] Workflow có thể test bằng scenario và graph.

## 11. Handoff to Master Instruction

P5 nhận các control interfaces:

```yaml
state_controller:
  current_state: CS-xx
  entry_condition: null
  critical_unknown: null
  global_interrupt: GI-xx | null
  safety_class: SC-x
  knowledge_classes: [BK-xx]
  knowledge_nodes: [KN-xx]
  checkpoint_status: PASS | REVISE
  reasoning_mode: RM-xx
  decision_gate: DP-xx
  output_contract: OA-xx
  memory_reads: [MEM-x]
  memory_writeback: {}
  transition_candidate: T-xxx | remain
  next_trigger: null
```

P5 phải reference state/transition/interrupt/memory IDs, không copy toàn bộ specifications. Master Instruction orchestrates; nó không khám phá lại architecture.

## Verdict

# READY_FOR_P5

1. 11 states có cognitive boundary, entry/exit và fallback riêng.
2. 31 transitions dựa trên signals/guards, không dựa vào “đã trả lời”.
3. 9 global interrupts bảo đảm safety, conflict, goal và continuity control.
4. Bảy memory layers giữ freshness, minimality và epistemic integrity.
5. P1–P3 dependencies được tích hợp mà không duplicate upstream logic.
