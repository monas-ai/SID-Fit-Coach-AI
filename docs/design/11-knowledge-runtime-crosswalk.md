# 11 — Knowledge Runtime Crosswalk

> [!IMPORTANT]
> **REFERENCE ONLY — KHÔNG CÒN LÀ RUNTIME AUTHORITY (từ 2026-09-05).**
>
> ### Thay đổi: Gộp crosswalk vào `13-knowledge-routing-and-behavior.md`
>
> * **Vấn đề cũ (file 11 tách khỏi file 03):** Crosswalk K01–K16 là bảng operational thực sự dùng để route intent → category filename, nhưng nó bị deploy tách rời khỏi behavioral taxonomy và KBC checkpoint ở file 03. Model runtime phải load hai file để hoàn thành một quyết định routing. Ngoài ra `Shared Route Contract` và `Global Constraints` ở file này trùng lặp một phần với `Matrix invariants` của file 03, tạo hai nguồn cho cùng một constraint.
> * **Cập nhật (2026-09-05):** Crosswalk K01–K16 được đưa lên **§1** của `13-knowledge-routing-and-behavior.md` làm entry point routing (vì đây là bước đầu tiên runtime cần), kèm `Shared Route Contract` (§10) và `Global Constraints` (§11) giữ nguyên nguyên văn. Toàn bộ 16 rows, source blocks/page ranges và runtime-use column không đổi.
> * **Trạng thái file này:** GIỮ NGUYÊN, không xóa, dùng làm reference và audit trail. **Không upload vào Knowledge nữa.** Nếu file 13 khác file này về scientific meaning, file 13 thắng và phải ghi routing defect để review.

**Runtime status:** SUPERSEDED BY `13-knowledge-routing-and-behavior.md`

## Crosswalk

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

## Shared Route Contract

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

## Global Constraints

- `SC-B`: retrieve only enough for one discriminator.
- `SC-C`: no category may create a workout/treatment workaround.
- `SC-D`: categories may support boundary/facts/confirmed professional limits only.
- `SC-A`: KBC and applicable DP remain mandatory.
- K14/K15 and supplement/medical contexts retain expert-policy gaps.
- Full-source verification is mandatory when decomposition and source appear inconsistent or a material claim needs detail.

## Coverage

Sixteen consolidated categories, all 24 P3 `KN-*` clusters, and all 14 `BK-*` classes are represented either directly in the table or by their named functional category. No substantive `A0/A1` source block remains unclassified; context-only/excluded blocks are not routed as advice.
