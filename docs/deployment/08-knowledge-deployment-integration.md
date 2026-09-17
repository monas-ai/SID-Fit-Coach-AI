# 08 — Knowledge Deployment Integration

**Target:** Custom GPT — Instructions + Knowledge uploads; no Actions/database  
**Authority:** Conversation Design V3 + P1–P7  
**Status:** New deployment adapter; no upstream source replacement

## 1. Goal

```text
User signal → safety/state/phase
→ BK/KN route → category decomposition
→ K01–K16 → Hxx/Nxx provenance
→ exact source range when material
→ KBC/DP → OA/D → response/writeback
```

## 2. Authority Stack

1. P2 safety/scope.
2. Conversation Design V3 runtime behavior.
3. Fresh confirmed user facts/current plan.
4. P1–P7 architecture interfaces.
5. Two full books as primary evidence corpus.
6. Sixteen category files as semantic retrieval/index surfaces.
7. `A0–A3`, README and checkpoints as provenance/governance.
8. Bounded interpretation.

Legacy setup, profiles, targets and instructions are reference-only.

## 3. Knowledge Roles

| Layer | Files | Runtime role |
|---|---|---|
| Control | Production instruction, P5/P6 | Enforce gates and behavior |
| Behavioral router | P3 + crosswalk | Select minimum useful knowledge |
| Category retrieval | 16 category files | Primary semantic surface |
| Governance | README, `A0–A3`, checkpoints | Classification/provenance/caveats |
| Deep evidence | Two full books | Verify material/deep claims |
| QA | P7 + integration tests | Builder validation only |

## 4. Retrieval Protocol

1. Frame requested decision and time horizon.
2. Apply `GI/SC/SAFE/TRG` before retrieval.
3. Reuse fresh facts; identify one material unknown.
4. Select one primary `BK-*` and minimum `KN-*` set.
5. Resolve each node through the crosswalk to one category.
6. Read category claim, context, evidence and caveat.
7. For material/deep/contested claims, verify exact `Hxx/Nxx` book range.
8. Run `KBC-01..08` and applicable `DP-*`.
9. Emit only knowledge needed for current OA/decision.
10. Preserve provenance internally; express uncertainty naturally.

## 5. Conflict Rules

- Safety always overrides source-derived coaching advice.
- Book meaning overrides a divergent decomposition synopsis.
- Decomposition is index/representation, not independent primary science.
- Different populations/contexts remain conditional branches; do not blend.
- Mixed evidence retains caveat; do not vote between sources.
- Missing source support triggers clarify/generalize/caveat/redirect.
- Category duplicates are consolidated semantically while provenance remains intact.

## 6. Deployment Behavior

- Do not retrieve all files before every response.
- Do not expose filenames/IDs unless the user requests sources/audit.
- Do not treat Knowledge uploads as live memory.
- Do not assume deterministic retrieval or claim a page was read unless retrieved.
- Do not use source content to bypass `SC/DP/KBC`.
- Do not use fixed legacy profile/targets.
- Use Vietnamese natural language; one question or 1–3 actions.

## 7. End-to-End Interface

```yaml
knowledge_runtime_request:
  current_state: CS-xx
  phase: PS-xx
  requested_decision: null
  safety_class: SC-x
  fresh_context: []
  behavioral_class: BK-xx
  candidate_nodes: [KN-xx]
  category_files: []
  consolidated_ids: []
  source_blocks: []
  source_ranges: []
  evidence_status: direct | mixed | derived | missing
  caveats: []
  checkpoint: PASS | REVISE
  reasoning_mode: RM-xx
  decision_gate: DP-xx | null
  output_contract: OA-xx
  fallback: null
```

## 8. Known Limits

Custom GPT retrieval is platform-managed, not a deterministic database query. Exact upload/file limits must be checked at deployment. Visual, PDF/QR, long-term memory and Actions remain unavailable unless explicitly enabled and verified.

## 9. Readiness Gate

- [x] Control, routing, category, provenance and evidence roles separated.
- [x] Two books remain primary evidence.
- [x] Sixteen decompositions remain primary semantic retrieval surfaces.
- [x] Conflict and fallback behavior defined.
- [x] No legacy profile/instruction authority.
- [x] P1–P7 control path preserved.
- [x] Runtime execution still requires builder upload/testing.

# READY_FOR_GPT_DEPLOYMENT_TEST
