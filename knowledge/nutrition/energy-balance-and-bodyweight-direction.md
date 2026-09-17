---
artifact_type: SID_KNOWLEDGE_DECOMPOSITION
category: Energy Balance and Bodyweight Direction
status: PASS
sources:
  - science-development-muscle-hypertrophy.full.knowledge.md: pp.220–221
  - muscle-strength-training-pyramid-nutrition.full.knowledge.md: pp.42–73
confidence: HIGH
---

# Energy Balance and Bodyweight Direction

## 1. Category Definition

Scope: Energy balance, maintenance estimation, choosing gain/cut direction, rates of body-weight change and energy availability.

Boundary: Macronutrient composition is handled separately.

Source Coverage:
- science-development-muscle-hypertrophy.full.knowledge.md: pp.220–221
- muscle-strength-training-pyramid-nutrition.full.knowledge.md: pp.42–73

---

# 2. Conceptual Decomposition

## Core Concepts

### C01 — Energy balance

Definition: Net difference between energy intake and expenditure frames weight change and supports hypertrophy/fat-loss planning.

Source Evidence: Hypertrophy p.220; Nutrition pp.42–73

Relationships:
- relates_to: other concepts in this category where source context explicitly connects them
- depends_on: MISSING unless stated in Definition/Source Evidence
- affects: MISSING unless stated in Definition/Source Evidence
- part_of: Energy Balance and Bodyweight Direction

Conditions: Context-specific where the source distinguishes population, phase, modality or training status.

Exceptions / Boundaries: Do not generalize beyond the source coverage listed above.

Evidence: FACT_SOURCE

Confidence: HIGH

### C02 — Maintenance intake

Definition: Maintenance can be estimated from observed intake/body-weight trends or calculated estimates.

Source Evidence: Nutrition pp.44–49

Relationships:
- relates_to: other concepts in this category where source context explicitly connects them
- depends_on: MISSING unless stated in Definition/Source Evidence
- affects: MISSING unless stated in Definition/Source Evidence
- part_of: Energy Balance and Bodyweight Direction

Conditions: Context-specific where the source distinguishes population, phase, modality or training status.

Exceptions / Boundaries: Do not generalize beyond the source coverage listed above.

Evidence: FACT_SOURCE

Confidence: HIGH

### C03 — Gain-versus-cut decision

Definition: The nutrition source provides decision logic for choosing whether to gain or lose weight.

Source Evidence: Nutrition pp.49–54

Relationships:
- relates_to: other concepts in this category where source context explicitly connects them
- depends_on: MISSING unless stated in Definition/Source Evidence
- affects: MISSING unless stated in Definition/Source Evidence
- part_of: Energy Balance and Bodyweight Direction

Conditions: Context-specific where the source distinguishes population, phase, modality or training status.

Exceptions / Boundaries: Do not generalize beyond the source coverage listed above.

Evidence: FACT_SOURCE

Confidence: HIGH

### C04 — Rate of weight change

Definition: Recommended rates differ for weight loss and gain and should reflect context/training status.

Source Evidence: Nutrition pp.54–63

Relationships:
- relates_to: other concepts in this category where source context explicitly connects them
- depends_on: MISSING unless stated in Definition/Source Evidence
- affects: MISSING unless stated in Definition/Source Evidence
- part_of: Energy Balance and Bodyweight Direction

Conditions: Context-specific where the source distinguishes population, phase, modality or training status.

Exceptions / Boundaries: Do not generalize beyond the source coverage listed above.

Evidence: FACT_SOURCE

Confidence: HIGH

### C05 — Energy availability

Definition: Adequate energy is required not just for exercise but also normal physiological function.

Source Evidence: Nutrition pp.68–73

Relationships:
- relates_to: other concepts in this category where source context explicitly connects them
- depends_on: MISSING unless stated in Definition/Source Evidence
- affects: MISSING unless stated in Definition/Source Evidence
- part_of: Energy Balance and Bodyweight Direction

Conditions: Context-specific where the source distinguishes population, phase, modality or training status.

Exceptions / Boundaries: Do not generalize beyond the source coverage listed above.

Evidence: FACT_SOURCE

Confidence: HIGH

### C06 — Positive energy balance for maximal hypertrophy

Definition: Hypertrophy source states that a surplus supports maximizing the hypertrophic response, with smaller surplus needs in well-trained people.

Source Evidence: Hypertrophy pp.220–221 and take-home p.239

Relationships:
- relates_to: other concepts in this category where source context explicitly connects them
- depends_on: MISSING unless stated in Definition/Source Evidence
- affects: MISSING unless stated in Definition/Source Evidence
- part_of: Energy Balance and Bodyweight Direction

Conditions: Context-specific where the source distinguishes population, phase, modality or training status.

Exceptions / Boundaries: Do not generalize beyond the source coverage listed above.

Evidence: FACT_SOURCE

Confidence: HIGH

## Concept Relationship Map

```text
Energy balance
   ├── Maintenance intake
   ├── Gain-versus-cut decision
   ├── Rate of weight change
   ├── Energy availability
   └── Positive energy balance for maximal hypertrophy
```

## Conceptual Gaps

- Causal strength and universality are not inferred beyond explicit source wording.
- Relationships not directly supported by the category corpus remain `MISSING` rather than being invented.

---

# 3. Stakeholder Decomposition

## Stakeholder S01 — Strength/physique athlete

Role: Chooses maintenance, gaining or fat-loss direction and monitors rate of change.

Needs / Interests: Only those implied by the stated role and category goal; otherwise `MISSING`.

Responsibilities: `MISSING` unless the source assigns an action in the function section below.

Inputs Provided: `MISSING` unless directly described by source measurement/tracking context.

Outputs Received: Category-relevant adaptation, measurement, decision support or plan output where source supports it.

Interactions: Cross-stakeholder interaction is not assumed unless source context supports it.

Relevant Concepts: See cross-lens table.

Source Evidence: Nutrition pp.42–73

Evidence: FACT_SOURCE

Confidence: HIGH

## Stakeholder S02 — Novice trainee

Role: May respond differently to surplus/deficit decisions due to training status and body composition.

Needs / Interests: Only those implied by the stated role and category goal; otherwise `MISSING`.

Responsibilities: `MISSING` unless the source assigns an action in the function section below.

Inputs Provided: `MISSING` unless directly described by source measurement/tracking context.

Outputs Received: Category-relevant adaptation, measurement, decision support or plan output where source supports it.

Interactions: Cross-stakeholder interaction is not assumed unless source context supports it.

Relevant Concepts: See cross-lens table.

Source Evidence: Nutrition pp.50–54; Hypertrophy p.239

Evidence: FACT_SOURCE

Confidence: HIGH

## Stakeholder S03 — Well-trained trainee

Role: Requires more conservative energy-surplus management to limit unwanted fat gain.

Needs / Interests: Only those implied by the stated role and category goal; otherwise `MISSING`.

Responsibilities: `MISSING` unless the source assigns an action in the function section below.

Inputs Provided: `MISSING` unless directly described by source measurement/tracking context.

Outputs Received: Category-relevant adaptation, measurement, decision support or plan output where source supports it.

Interactions: Cross-stakeholder interaction is not assumed unless source context supports it.

Relevant Concepts: See cross-lens table.

Source Evidence: Hypertrophy p.239

Evidence: FACT_SOURCE

Confidence: HIGH

## Stakeholder Interaction Map

```text
Strength/physique athlete
      │
      ▼
Novice trainee
      │
      ▼
Well-trained trainee
```

## Stakeholder Gaps

- Needs, responsibilities and interaction direction are kept `MISSING` where the source does not explicitly define them.
- No stakeholder has been added solely to make the decomposition symmetrical.

---

# 4. Function Decomposition

## F01 — Estimate maintenance calories

Purpose: Use tracked intake/weight or calculation to estimate maintenance.

Trigger: Source-described training, nutrition, measurement or competition context; otherwise `MISSING`.

Input: Source-defined stimulus/data/intake where applicable; otherwise `MISSING`.

Activity / Transformation: Use tracked intake/weight or calculation to estimate maintenance.

Output: Source-described adaptation, measurement, decision or plan result; otherwise `MISSING`.

Actor / Stakeholder: See cross-lens traceability; do not assume a unique actor.

Related Concepts: See cross-lens traceability.

Dependencies: `MISSING` unless stated in the purpose/source evidence.

Conditions: Context-dependent where source distinguishes phase, population, modality or training status.

Source Evidence: Nutrition pp.44–49

Evidence: FACT_SOURCE

Confidence: HIGH

## F02 — Choose gain or cut phase

Purpose: Select body-weight direction based on current context and goals.

Trigger: Source-described training, nutrition, measurement or competition context; otherwise `MISSING`.

Input: Source-defined stimulus/data/intake where applicable; otherwise `MISSING`.

Activity / Transformation: Select body-weight direction based on current context and goals.

Output: Source-described adaptation, measurement, decision or plan result; otherwise `MISSING`.

Actor / Stakeholder: See cross-lens traceability; do not assume a unique actor.

Related Concepts: See cross-lens traceability.

Dependencies: `MISSING` unless stated in the purpose/source evidence.

Conditions: Context-dependent where source distinguishes phase, population, modality or training status.

Source Evidence: Nutrition pp.49–54

Evidence: FACT_SOURCE

Confidence: HIGH

## F03 — Set rate of weight change

Purpose: Set a target rate for losing or gaining weight.

Trigger: Source-described training, nutrition, measurement or competition context; otherwise `MISSING`.

Input: Source-defined stimulus/data/intake where applicable; otherwise `MISSING`.

Activity / Transformation: Set a target rate for losing or gaining weight.

Output: Source-described adaptation, measurement, decision or plan result; otherwise `MISSING`.

Actor / Stakeholder: See cross-lens traceability; do not assume a unique actor.

Related Concepts: See cross-lens traceability.

Dependencies: `MISSING` unless stated in the purpose/source evidence.

Conditions: Context-dependent where source distinguishes phase, population, modality or training status.

Source Evidence: Nutrition pp.54–63

Evidence: FACT_SOURCE

Confidence: HIGH

## F04 — Monitor energy availability

Purpose: Evaluate whether intake supports exercise and normal physiological function.

Trigger: Source-described training, nutrition, measurement or competition context; otherwise `MISSING`.

Input: Source-defined stimulus/data/intake where applicable; otherwise `MISSING`.

Activity / Transformation: Evaluate whether intake supports exercise and normal physiological function.

Output: Source-described adaptation, measurement, decision or plan result; otherwise `MISSING`.

Actor / Stakeholder: See cross-lens traceability; do not assume a unique actor.

Related Concepts: See cross-lens traceability.

Dependencies: `MISSING` unless stated in the purpose/source evidence.

Conditions: Context-dependent where source distinguishes phase, population, modality or training status.

Source Evidence: Nutrition pp.68–73

Evidence: FACT_SOURCE

Confidence: HIGH

## F05 — Set hypertrophy surplus

Purpose: Use a positive energy balance when maximizing hypertrophy, scaled to training status.

Trigger: Source-described training, nutrition, measurement or competition context; otherwise `MISSING`.

Input: Source-defined stimulus/data/intake where applicable; otherwise `MISSING`.

Activity / Transformation: Use a positive energy balance when maximizing hypertrophy, scaled to training status.

Output: Source-described adaptation, measurement, decision or plan result; otherwise `MISSING`.

Actor / Stakeholder: See cross-lens traceability; do not assume a unique actor.

Related Concepts: See cross-lens traceability.

Dependencies: `MISSING` unless stated in the purpose/source evidence.

Conditions: Context-dependent where source distinguishes phase, population, modality or training status.

Source Evidence: Hypertrophy p.239

Evidence: FACT_SOURCE

Confidence: HIGH

## Function Hierarchy

```text
Energy Balance and Bodyweight Direction
├── Estimate maintenance calories
├── Choose gain or cut phase
├── Set rate of weight change
├── Monitor energy availability
└── Set hypertrophy surplus
```

## Function Gaps

- Input/output and dependency fields remain `MISSING` when not explicitly supported.
- Concept statements have not been converted into functions unless an action/capability is present.

---

# 5. Cross-Lens Traceability

| Concept | Stakeholder | Function | Source | Confidence |
|---|---|---|---|---|
| Energy balance | Strength/physique athlete | Estimate maintenance calories | Hypertrophy p.220; Nutrition pp.42–73 | HIGH |
| Maintenance intake | Novice trainee | Choose gain or cut phase | Nutrition pp.44–49 | HIGH |
| Gain-versus-cut decision | Well-trained trainee | Set rate of weight change | Nutrition pp.49–54 | HIGH |
| Rate of weight change | MISSING | Monitor energy availability | Nutrition pp.54–63 | HIGH |
| Energy availability | MISSING | Set hypertrophy surplus | Nutrition pp.68–73 | HIGH |
| Positive energy balance for maximal hypertrophy | MISSING | MISSING | Hypertrophy pp.220–221 and take-home p.239 | HIGH |

---

# 6. Conflicts

No unresolved direct source conflict was identified at category-consolidation level. Where the source itself reports contradictory or mixed study findings, the category preserves uncertainty rather than resolving it as a single fact.

---

# 7. Missing / Unresolved Knowledge

- Any unreported stakeholder need/responsibility, function dependency, or causal relationship is `MISSING`.
- Generalization beyond the listed populations/contexts is not asserted.
- Source-reported mixed evidence remains a caveat where relevant.

---

# 8. Source Register

- science-development-muscle-hypertrophy.full.knowledge.md: pp.220–221
- muscle-strength-training-pyramid-nutrition.full.knowledge.md: pp.42–73

---

# 9. Checkpoint

```yaml
checkpoint_id: CP7
task_id: P7
artifact_id: energy-balance-and-bodyweight-direction.md
status: PASS
findings: Three lenses are present and cross-referenced; unsupported fields remain MISSING.
assumptions: []
missing_data: Source does not specify every stakeholder interaction or function dependency.
conflicts: Source-reported mixed findings retained as caveats where applicable.
caveats: Do not generalize beyond source scope.
confidence: HIGH
next_action: Include in P8 global release validation.
```
