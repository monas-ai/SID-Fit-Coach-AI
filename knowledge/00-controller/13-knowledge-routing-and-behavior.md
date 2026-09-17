# 13 — SID Fit Coach Knowledge Routing & Behavior

**Phase:** P5.1 — Consolidated Knowledge Routing  
**Authority:** `SID_Fit_Coach_Design Conservation/design-conversation-architect.md` V3  
**Supersedes:** `03-knowledge-behavior-map.md`, `11-knowledge-runtime-crosswalk.md`  
**Dependencies:** `02-reasoning-safety-rules.md`, `05-master-instruction.md`  
**Language:** Vietnamese-first  
**Status:** Consolidated runtime routing authority; file 03 và 11 giữ nguyên làm reference

> [!NOTE]
> File này hợp nhất `03-knowledge-behavior-map.md` (behavioral taxonomy, KN/BK registry, knowledge-to-behavior matrix, router, KBC checkpoint) và `11-knowledge-runtime-crosswalk.md` (K01–K16 routing table, shared route contract, global constraints) thành **một routing authority duy nhất**. Mục đích: giảm retrieval surface, loại bỏ overlap giữa hai file và giảm context bloat khi runtime. Không đổi nội dung evidence, safety outcome hoặc decision gate của hai file gốc. Nếu hai file gốc khác file này về meaning, file này thắng và ghi routing defect để review.

---

## 1. Runtime Crosswalk (K01–K16)

Bảng routing chính: user intent → category file. Dùng để chọn đúng canonical category file trước khi retrieve.

| K | Category file | P3 behavior/node | Source blocks and ranges | Runtime use |
|---|---|---|---|---|
| K01 | `physiological-basis-of-hypertrophy.md` | `BK-EXPLAIN`, `KN-PBH-01` | H01; Science pp.10–38 | Bounded physiology explanation |
| K02 | `mechanisms-of-hypertrophy.md` | `BK-EXPLAIN`, `KN-MHY-01` | H02; Science pp.39–65 | Mechanism/cause boundary |
| K03 | `measurement-and-progress-assessment.md` | `BK-ASSESS/PROGRESS`, `KN-MPA-01` | H03 pp.66–86; N07 Nutrition pp.175–193 | Snapshot/trend/measurement |
| K04 | `resistance-training-variables.md` | `BK-COMPARE/PROGRESS/EXERCISE`, `KN-RTV-01`, `KN-RTV-02`, `KN-RTV-03` | H04; Science pp.87–144 | Volume/load/exercise variables |
| K05 | `advanced-training-practices.md` | `BK-COMPARE`, `KN-ATP-01` | H05; Science pp.145–158 | Conditional advanced methods |
| K06 | `aerobic-and-concurrent-training.md` | `BK-CARDIO`, `KN-ACT-01` | H06 pp.159–174; N02 pp.55–60 | Cardio/concurrent trade-offs |
| K07 | `individual-modifiers-of-hypertrophy.md` | personalization, `KN-IMH-01` | H07; Science pp.175–186 | Non-deterministic modifiers |
| K08 | `hypertrophy-program-design.md` | `BK-PROGRAM/EXERCISE`, `KN-HPD-01`, `KN-HPD-02` | H08; Science pp.187–219 | Program/recoverability |
| K09 | `energy-balance-and-bodyweight-direction.md` | `BK-ENERGY`, `KN-EBW-01`, `KN-EBW-02` | H09 pp.220–221; N02 pp.42–73 | Gain/cut/maintenance ranges |
| K10 | `macronutrients-and-fiber.md` | `BK-NUTRITION`, `KN-MAF-01` | H10 pp.222–230; N03 pp.74–103 | Macro/meal structure |
| K11 | `micronutrients-and-hydration.md` | `BK-NUTRITION`, `KN-MIH-01` | N04; Nutrition pp.104–116 | General food/hydration education |
| K12 | `nutrient-timing-and-frequency.md` | `BK-NUTRITION`, `KN-NTF-01` | H11/12 pp.231–239; N05 pp.117–141 | Timing after fundamentals |
| K13 | `supplementation.md` | `BK-SUPPLEMENT`, `KN-SUP-01`, `KN-SUP-02` | N06; Nutrition pp.142–174 | Evidence/quality screen |
| K14 | `competition-peaking-and-weight-making.md` | `BK-COMPETITION/SAFETY-CONSTRAINT`, `KN-CPW-01`, `KN-CPW-02` | N08; Nutrition pp.194–225 | High-level only; acute protocol blocked |
| K15 | `post-competition-recovery-and-nutrition-periodization.md` | `BK-COMPETITION`, `KN-PCR-01`, `KN-PCR-02` | N09; Nutrition pp.226–244 | Bounded recovery/periodization |
| K16 | `nutrition-behavior-adherence-and-lifestyle.md` | `BK-BEHAVIOR`, `KN-NBA-01`, `KN-NBA-02` | N01 pp.22–41; N10 pp.245–273 | Sustainable adherence behavior |

## 2. Behavioral Knowledge Taxonomy

Chọn một primary `BK-*` theo role hành vi của request, không theo tên chủ đề.

| Class | Role | Typical nodes | Behavioral output |
|---|---|---|---|
| BK-ASSESS | Đánh giá baseline/snapshot/trend | MPA, HPD-02, EBW | Chọn signal và time horizon |
| BK-EXPLAIN | Giải thích meaning/mechanism | PBH, MHY | Direct answer có evidence boundary |
| BK-COMPARE | So trade-off/options | RTV, ATP, ACT, NTF | Criteria + conditional choice |
| BK-PROGRAM | Tạo cấu trúc plan | HPD, RTV | Plan blocks và review trigger |
| BK-PROGRESS | Progression/adjustment | MPA, RTV-02, HPD-02 | Giữ/đổi đúng biến |
| BK-EXERCISE | Selection/execution context | RTV-03, HPD-01 | Selection rationale/cues |
| BK-RECOVERY | Soreness/fatigue/recoverability | HPD-02, MPA | Difference + trend/action |
| BK-CARDIO | Aerobic/concurrent | ACT | Modality/spacing trade-off |
| BK-ENERGY | Bodyweight direction | EBW | Range, phase, monitoring |
| BK-NUTRITION | Macros/micros/timing | MAF, MIH, NTF | Meal/target structure |
| BK-SUPPLEMENT | Quality/effectiveness | SUP | Evidence screen/caveat |
| BK-BEHAVIOR | Adherence/lifestyle | NBA | Sustainable implementation |
| BK-COMPETITION | Peaking/recovery | CPW, PCR | High-level route under strict gate |
| BK-SAFETY-CONSTRAINT | Giới hạn application | CPW, SUP, EBW, PCR | Block, caveat hoặc redirect |

## 3. Knowledge Registry

Node ID đại diện cho **behavioral cluster**; concept/function gốc giữ nguyên trong decomposition.

| Node ID | Behavioral cluster | Source category | Source nodes | Questions supported | Evidence/status |
|---|---|---|---|---|---|
| KN-PBH-01 | Nền tảng thích nghi cơ | Physiological Basis | C01–C05; F01–F03 | Cơ thể đáp ứng/thích nghi với tập thế nào? | Direct; caveat cho causal detail |
| KN-MHY-01 | Cơ chế hypertrophy có boundary | Mechanisms | C01–C04; F01–F04 | Tension, stress, damage nói gì về tăng cơ? | Mixed/context-dependent |
| KN-MPA-01 | Đo lường và trend đa tín hiệu | Measurement & Progress | C01–C05; F01–F05 | Tiến bộ thật hay measurement noise? | Direct; interpretive limits |
| KN-RTV-01 | Volume và frequency | Resistance Variables | C01–C02; F01–F02 | Chọn/phân bổ lượng tập thế nào? | Direct; individualized |
| KN-RTV-02 | Load, effort và progression inputs | Resistance Variables | C03, C06; F03 | Mức tạ và độ gắng sức nào phù hợp? | Direct; no universal optimum |
| KN-RTV-03 | Exercise, ROM, rest, tempo, order | Resistance Variables | C04–C06; F04–F05 | Cấu hình buổi/bài theo mục tiêu ra sao? | Direct; context-dependent |
| KN-ATP-01 | Kỹ thuật nâng cao | Advanced Practices | C01–C05; F01–F05 | Khi nào loaded stretch/rest-pause/drop/superset/eccentric có ích? | Mixed/caveated |
| KN-ACT-01 | Cardio và concurrent training | Aerobic & Concurrent | C01–C04; F01–F04 | Kết hợp cardio và tạ mà quản lý interference ra sao? | Mixed/context-dependent |
| KN-IMH-01 | Individual modifiers | Individual Modifiers | C01–C05; F01–F03 | Experience/age/sex/variability đổi expectation thế nào? | Direct + non-deterministic caveat |
| KN-HPD-01 | Exercise selection/program cycles | Program Design | C01–C04; F01–F02, F04 | Xây plan/chu kỳ từ constraints thế nào? | Direct; personalization required |
| KN-HPD-02 | Recoverable volume/fatigue | Program Design | C05; F03 | Khi nào lượng tập vượt khả năng hồi phục? | Direct; trend required |
| KN-EBW-01 | Energy balance và maintenance | Energy Balance | C01–C02; F01 | Hướng cân nặng/maintenance được ước lượng thế nào? | Direct; estimate uncertainty |
| KN-EBW-02 | Gain/cut/rate/surplus | Energy Balance | C03–C06; F02–F05 | Chọn phase và tốc độ thay đổi thế nào? | Direct; safety-sensitive |
| KN-MAF-01 | Protein, carbs, fat, fiber | Macros & Fiber | C01–C05; F01–F05 | Phân bổ macro theo phase ra sao? | Direct; starting ranges |
| KN-MIH-01 | Micronutrients, food variety, hydration | Micros & Hydration | C01–C05; F01–F04 | Giảm thiếu hụt và hỗ trợ hydration thế nào? | Direct; not medical treatment |
| KN-NTF-01 | Timing, frequency, diet breaks/refeeds | Nutrient Timing | C01–C06; F01–F04 | Timing có ưu tiên đến đâu và dùng khi nào? | Direct; hierarchy/context caveat |
| KN-SUP-01 | Supplement quality/evidence | Supplementation | C01–C05; F01–F03 | Sản phẩm/claim đáng tin đến đâu? | Direct; mixed categories retained |
| KN-SUP-02 | Minimum effective use | Supplementation | F04 | Có cần tăng dose không? | Narrow source scope; health gate |
| KN-CPW-01 | Physique peak strategies | Competition/Weight Making | C01–C03; F01–F02 | Peak strategy có những trade-off/risk nào? | Risk-sensitive; expert validation |
| KN-CPW-02 | Weight-class/cut/rehydration | Competition/Weight Making | C04–C05; F03–F04 | Chọn class/cut acute có implications gì? | High-risk; non-actionable ceiling |
| KN-PCR-01 | Post-competition recovery | Post-Competition | C01–C04; F01–F03 | Sau thi đấu cần route recovery theo lịch thế nào? | Risk-sensitive; expert boundary |
| KN-PCR-02 | Nutrition periodization | Post-Competition | C05; F04 | Tổ chức các phase dài hạn thế nào? | Direct; context required |
| KN-NBA-01 | Flexibility, tracking và adherence | Nutrition Behavior | C01–C04, C06; F01–F04 | Mức chính xác nào duy trì được? | Direct; behavior-focused |
| KN-NBA-02 | Social environment | Nutrition Behavior | C05; F05 | Môi trường/xã hội ảnh hưởng implementation thế nào? | Direct; no psychology diagnosis |

## 4. Knowledge-to-Behavior Matrix

| Node(s) | Trigger / intent | Required semantic context | Behavioral effect | RM / DP | Output | Safety dependency | Forbidden use | Fallback |
|---|---|---|---|---|---|---|---|---|
| KN-PBH-01 | Hỏi nền tảng thích nghi | Câu hỏi/scenario rõ | Giải thích một insight cần cho meaning | RM-04 | OA-03 | SC-A; EPI-05 | Cá nhân hóa causal outcome | Caveat/generalize |
| KN-MHY-01 | “Damage/burn/tension có tăng cơ?” | Mechanism được hỏi | Tách association khỏi causation; chặn soreness-as-KPI | RM-04 | OA-03/04 | EPI-03/05; TRG-07 | Tuyên bố một cơ chế là nguyên nhân duy nhất | Source caveat |
| KN-MPA-01 | Check-in/plateau/measurement | Baseline + time horizon | Tách noise/snapshot/trend; chọn metric có utility | RM-06; DP-10 | OA-02/09/08 | SAFE-01 | Một điểm đo thành trend | OA-01 |
| KN-RTV-01/02 | Chọn volume/frequency/load/effort | Goal, experience, plan, recovery | So option hoặc set starting structure | RM-02/05; DP-01/03 | OA-04/06/07 | TRG-06/07 | Universal optimum; tăng vì soreness | Clarify/general framework |
| KN-RTV-03 | Chọn bài/ROM/rest/order | Movement role, equipment, comfort | Chọn configuration và rationale | RM-01/02; DP-02/12 | OA-04/14/15 | TRG-02/03/16 | Dùng pain pattern để diagnosis | RM-07/OA-01/12 |
| KN-ATP-01 | Muốn kỹ thuật nâng cao | Experience, stable base, goal, fatigue budget | So lợi ích/chi phí và giới hạn use | RM-02; DP-01/03 | OA-04/05 | TRG-06/07 | Mặc định advanced = superior | Conventional alternative |
| KN-ACT-01 | Cardio cùng tập tạ/fat loss | Goal, modality, dose, lifting schedule, tolerance | Chọn modality/intensity/spacing | RM-02/05; DP-05 | OA-04/06/07 | TRG-01 | Exact universal interference threshold | Low-moderate starting option |
| KN-IMH-01 | Personalization/expectation | Confirmed modifier + goal | Điều chỉnh expectation/starting point | RM-02/05; DP-01 | OA-03/06 | TRG-14/18 | Stereotype/deterministic prediction | Generic plan + monitor |
| KN-HPD-01 | Yêu cầu program | DP-01 minimum inputs | Cấu trúc cycles/exercise strategy | RM-05; DP-01 | OA-06 | SAFE-01 | Plan khi context/risk thiếu | OA-01/framework |
| KN-HPD-02 | Mỏi/tụt performance lặp lại | Function, trend, active plan, changes | Recoverability review; xác định phần cần giảm/giữ | RM-03/06; DP-03/04 | OA-08/09/07 | TRG-02/05/06 | Chẩn đoán overtraining | Clarify/monitor |
| KN-EBW-01/02 | Maintenance/gain/cut/rate | Goal, trend, intake/activity, safety context | Range, phase decision, review trigger | RM-02/06; DP-06 | OA-03/05/06/09 | TRG-08/10/14/18 | False precision/medical diet | Education/range/redirect |
| KN-MAF-01 | Macro/meal plan | Energy direction, diet pattern, constraints | Macro starting ranges và meal structure | RM-05; DP-07 | OA-05/06 | TRG-08/14/18 | Medical nutrition therapy | General template/OA-12 |
| KN-MIH-01 | Variety/hydration/deficiency question | Diet phase, food pattern, reported context | Food variety/hydration behavior | RM-01/04; DP-07 | OA-03/05 | TRG-13/14 | Treat deficiency/dehydration clinically | General education/redirect |
| KN-NTF-01 | Meal timing/refeed/diet break | Daily fundamentals, phase, training timing | Đặt timing sau priorities; chọn conditional tactic | RM-02/05; DP-07 | OA-03/04/06 | TRG-08/10 | Timing thay calories/macros; compensation | Simplify to fundamentals |
| KN-SUP-01/02 | Sản phẩm/claim/dose | Ingredient, purpose, quality, health context | Screen transparency/evidence; avoid escalation | RM-02/04; DP-09 | OA-03/04/12 | TRG-11/12/14 | Interaction safety hoặc protocol khi thiếu context | Caveat/redirect |
| KN-CPW-01/02 | Peak/cut/rehydration | Competition context + support + safety screen | Chỉ high-level trade-off; block acute protocol | RM-02/07; DP-11 | OA-04/11/12 | TRG-13; SC-C/D | Actionable water/sodium/heat/diuretic steps | Qualified support |
| KN-PCR-01/02 | Post-show/recovery/periodization | Season status, current condition, support | Route recovery phase; long-term phase framing | RM-02/05; DP-06/11 | OA-04/06/12 | TRG-08/10/14 | Clinical recovery prescription | High-level framework/redirect |
| KN-NBA-01/02 | Khó duy trì/all-or-nothing/social friction | Confirmed obstacle + goal | Chọn precision tier, flexible action, environment lever | RM-03/05; DP-06/07/10 | OA-05/08/09 | TRG-08/09 | Gán personality/emotion; food morality | One small action/OA-01 |

### Matrix invariants

1. `SC-C`: không knowledge node nào được tạo workout/treatment workaround.
2. `SC-D`: node chỉ hỗ trợ boundary, facts hoặc confirmed professional limits.
3. `SC-B`: chỉ retrieve đủ để tạo một discriminator; không deep personalization.
4. `SC-A`: vẫn phải qua DP gate và epistemic control.
5. Mỗi lượt dùng minimum sufficient node set; supporting nodes tối đa khi thật sự đổi decision.

## 5. Knowledge Router

### 5.1 Router flow

```text
1 Frame signal + requested decision
2 Reuse fresh confirmed context
3 Apply SC/SAFE/TRG pre-filter
4 Select one primary BK class
5 Retrieve candidate nodes by behavior, not keyword alone
6 Check DP minimum inputs
7 Verify source/evidence/context
8 Resolve conflict or choose fallback
9 Select RM + OA
10 Run KBC checkpoint
11 Emit minimum necessary knowledge
12 Hand off semantic next requirement
```

### 5.2 Selection rules

| Router rule | Required behavior |
|---|---|
| KR-01 Decision relevance | Retrieve chỉ khi node đổi question, explanation, decision, plan, adjustment hoặc safety |
| KR-02 Minimum sufficient set | Ưu tiên một primary node/cluster; dừng khi đủ decision |
| KR-03 Context match | Kiểm tra goal, population, phase, experience và time horizon |
| KR-04 Safety first | P2 filter trước candidate ranking; blocked node không được “tham khảo” để lách rule |
| KR-05 Evidence fit | Direct > bounded derived; mixed giữ caveat; missing không thành fact |
| KR-06 No keyword routing | Cùng từ “đau”, “cut”, “recovery” không đồng nghĩa cùng node |
| KR-07 Progressive disclosure | Chỉ giải thích phần cần cho current decision; background là P2 content priority |
| KR-08 Fallback required | Không node hợp lệ → clarify, generalize, caveat hoặc redirect |

### 5.3 Representative routes

| Signal | Primary class/node | Gate | Effect → Output |
|---|---|---|---|
| “Không đau có nên tăng set?” | BK-EXPLAIN MHY + BK-PROGRESS RTV | TRG-07, DP-03 | Chặn soreness KPI; hỏi/đọc progress → OA-03/05 |
| “Hai buổi tạ tụt” | BK-RECOVERY HPD-02 + MPA | TRG-06, DP-04 | Trend/recoverability review → OA-08/09 |
| “Làm plan 3 buổi” | BK-PROGRAM HPD + RTV | DP-01 | Plan nếu đủ; nếu thiếu OA-01 → OA-06 |
| “Cardio có mất cơ?” | BK-CARDIO ACT | DP-05, EPI-05 | Contextual trade-off → OA-03/04 |
| “Cắt nước để cân ngày mai” | BK-SAFETY-CONSTRAINT CPW-02 | TRG-13 | Block protocol/redirect → OA-11/12 |
| “Bữa này bao nhiêu kcal?” | BK-ENERGY/MAF | DP-08 | Estimate range; source error → OA-10 |

## 6. Source Conflict Policy

| Conflict | Resolution |
|---|---|
| Project safety vs knowledge recommendation | P2 safety thắng |
| V3 conversation rule vs legacy protocol | V3 thắng về behavior/output |
| Decomposition vs full source | Decomposition là index; kiểm tra full source khi material claim cần độ chi tiết |
| Direct source vs derived interpretation | Direct support thắng; derived phải gắn basis/caveat |
| Hai source khác context/population | Không blend; route theo user context hoặc trình bày conditional branches |
| Mixed/contradictory findings | Không “bỏ phiếu”; giữ uncertainty và factors |
| Không đủ data để chọn implication | OA-01 nếu answer đổi action; nếu không, generic ceiling |
| Không giải được conflict | `NEEDS SOURCE REVIEW`; không recommendation mạnh |

**Source-use sequence:** safety/project authority → fresh user facts/active context → relevant primary source → decomposition representation → bounded interpretation.

## 7. Knowledge Coverage Matrix

| User need | Support | Coverage | Gap/boundary |
|---|---|---|---|
| Explain hypertrophy | PBH, MHY | COVERED | Mechanism causality caveats |
| Compare training variables | RTV, ATP | COVERED | Advanced practices mixed |
| Build/adjust program | HPD, RTV, IMH, MPA | COVERED | Requires profile/active plan |
| Assess progress/plateau | MPA, HPD-02 | COVERED | Longitudinal data required |
| Pain/soreness/readiness | HPD-02, MPA + pain source | PARTIAL | No diagnosis/clinical clearance |
| Exercise/form coaching | RTV-03, HPD-01 | COVERED | Exact visual tool interface missing |
| Cardio/concurrent | ACT | COVERED_WITH_CAVEATS | Interference context-dependent |
| Energy/bodyweight direction | EBW | COVERED | Estimates, health boundary |
| Macros/fiber/meals | MAF | COVERED | Not medical nutrition therapy |
| Micros/hydration | MIH | PARTIAL | Deficiency/clinical hydration outside scope |
| Timing/diet breaks/refeeds | NTF | COVERED_WITH_CAVEATS | Must not outrank fundamentals |
| Supplements | SUP | COVERED_WITH_CAVEATS | No interaction database |
| Adherence/lifestyle | NBA | COVERED | No psychology diagnosis |
| Competition peaking/weight cut | CPW | WEAK/RISK-SENSITIVE | Expert validation; acute protocol blocked |
| Post-competition recovery | PCR | PARTIAL/RISK-SENSITIVE | Clinical/psychological boundary |
| Meal photo estimate | EBW/MAF + OA-10 | PARTIAL | Food database/tool and portion uncertainty |
| Return after injury | None sufficient | MISSING FOR PROTOCOL | P2 redirect; confirmed limits only |

### Control-only outputs

- `OA-01`, `OA-11`, `OA-12`, `OA-13` có thể vận hành không cần domain node: chúng chủ yếu dùng context/safety/scope/memory control.
- Mọi OA khác đều có supporting knowledge class ở matrix; `OA-15` phụ thuộc thêm tool capability chưa xác nhận.

## 8. Orphan Knowledge và Missing Requirements

### 8.1 Orphan/candidate knowledge

| Candidate | Vì sao chưa map thành direct recommendation | Xử lý |
|---|---|---|
| Chi tiết endocrine/paracrine/autocrine | Thường không đổi quyết định runtime | Chỉ retrieve khi user yêu cầu deep explanation |
| “Induce muscle damage” như function | Có nguy cơ biến damage thành mục tiêu | Chỉ dùng để giải thích boundary, không prescribe |
| Một số advanced methods riêng lẻ | Utility phụ thuộc experience/equipment/fatigue | Conditional comparison, không default plan |
| Acute fluid/electrolyte manipulation | Rủi ro cao | Safety constraint/redirect, không actionable |
| Supplement C-list details | Không tạo positive behavior ngoài deprioritization | Evidence screen, không knowledge dump |

Không có **orphan behavior blocking**: các node không có utility trực tiếp đã được giới hạn thành explain-only, constraint hoặc candidate.

### 8.2 Missing knowledge requirements

| Gap ID | Missing | Runtime behavior | Future owner |
|---|---|---|---|
| KGAP-01 | Clinical pain/injury assessment | Không diagnosis; OA-11/12 | External expert/policy |
| KGAP-02 | Return-to-training protocol | Chỉ confirmed professional limits | Expert validation |
| KGAP-03 | Pregnancy/medication/condition specificity | Giảm personalization; redirect | Expert validation |
| KGAP-04 | Supplement interaction database | Không khẳng định interaction safety | External verified source |
| KGAP-05 | Minor/vulnerable-user policy | Conservative boundary | Policy/expert |
| KGAP-06 | Acute weight-cut safety authority | Block actionable protocol | Expert validation |
| KGAP-07 | Food image/portion database | Wide range + uncertainty | Runtime/tool layer |
| KGAP-08 | `gym-visual-coach` interface | Text fallback | Runtime implementation |
| KGAP-09 | Production source-update policy | Nêu knowledge cutoff/source set | P3 governance/revision |

## 9. Knowledge Behavior Checkpoint

`03_checkpoint.md` mẫu chỉ cung cấp pattern tự-review; logic IELTS không được kế thừa.

| ID | Gate | PASS khi | REVISE khi |
|---|---|---|---|
| KBC-01 | Source Accuracy | Claim trace đúng node/source/status | Sai source, unsupported fact |
| KBC-02 | Context Fit | Goal/population/phase/time horizon phù hợp | Node đúng keyword nhưng sai context |
| KBC-03 | Decision Utility | Node đổi meaning/question/decision/action | Chỉ làm response dài hơn |
| KBC-04 | Safety Dependency | SC/SAFE/TRG/DP đã chạy đúng | Node vượt safety/precondition |
| KBC-05 | Epistemic Integrity | Fact/inference/recommendation tách rõ | Mixed labels hoặc causal overclaim |
| KBC-06 | Output Fit | Đúng OA/depth/progressive disclosure | Knowledge dump/sai contract |
| KBC-07 | Traceability | Trace signal → node → effect → output | Không giải thích được vì sao node được dùng |
| KBC-08 | Conflict/Fallback | Mixed/missing có caveat/fallback | Conflict bị blend/ẩn |

```text
Candidate node set
→ KBC-01..08
→ PASS: node được ảnh hưởng final output
→ REVISE: đổi node / giảm scope / thêm caveat / fallback
```

Critical fail ở KBC-01, 04 hoặc 05 chặn output. Fail khác phải sửa trước output trừ khi route sang OA-01/OA-12 là fallback hợp lệ.

## 10. Shared Route Contract

```yaml
route_id: KRT-Kxx
states: [CS-20, CS-30, CS-40, CS-50, CS-70, CS-80]
phases: [PS-02, PS-03, PS-04, PS-05, PS-06]
required_context: []
reasoning_modes: []
decision_gates: []
safety_dependencies: [SAFE-01]
allowed_outputs: []
evidence_status: direct | mixed | derived | missing
caveats: []
forbidden_use: []
fallback: clarify | generalize | caveat | redirect
```

## 11. Global Constraints

- `SC-B`: retrieve only enough for one discriminator.
- `SC-C`: no category may create a workout/treatment workaround.
- `SC-D`: categories may support boundary/facts/confirmed professional limits only.
- `SC-A`: KBC and applicable DP remain mandatory.
- K14/K15 and supplement/medical contexts retain expert-policy gaps.
- Full-source verification is mandatory when decomposition and source appear inconsistent or a material claim needs detail.

## 12. Upstream Dependency Coverage

- Output contracts: `OA-01`–`OA-15`.
- Reasoning modes: `RM-01`–`RM-07`.
- Decision gates: `DP-01`–`DP-13`.
- Safety classes: `SC-A`–`SC-D`.
- P2 safety/trigger dependencies được reference theo từng route; control-only rules không bị copy vào knowledge nodes.

## Verdict

# READY_FOR_RUNTIME

1. Routing (K01–K16), behavioral taxonomy (BK-*), node registry (KN-*) và KBC checkpoint nằm trong một authority duy nhất, giảm retrieval surface từ 2 files xuống 1.
2. Không đổi evidence, safety outcome hoặc decision gate so với 03 và 11.
3. Source conflict, coverage, orphan và missing-knowledge analysis được giữ nguyên.
4. File 03 và 11 giữ nguyên làm reference; nếu khác file này về meaning, file này thắng.