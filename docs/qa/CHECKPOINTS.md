# Universal Checkpoint Records

```yaml
checkpoint_id: CP0
task_id: P0
artifact_id: A0-clean-source-corpus.md
status: PASS
findings: TOC/navigation/index/reference/resource-only material excluded; substantive chapter content retained by source ranges with provenance.
assumptions: []
missing_data: []
conflicts: []
caveats: Front-matter scope statements retained as context-only, not domain knowledge.
confidence: HIGH
next_action: P1
```

```yaml
checkpoint_id: CP1
task_id: P1
artifact_id: A1-classification-map.md
status: PASS
findings: Every retained substantive block has a classified or context-only disposition; no orphan block.
assumptions: []
missing_data: []
conflicts: []
caveats: Classification uses semantic content with headings only as context.
confidence: HIGH
next_action: P2
```

```yaml
checkpoint_id: CP2
task_id: P2
artifact_id: A2-unclassified-decomposition-map.md
status: PASS
findings: No substantive unclassified cluster remained.
assumptions: []
missing_data: []
conflicts: []
caveats: None.
confidence: HIGH
next_action: P3
```

```yaml
checkpoint_id: CP3
task_id: P3
artifact_id: A3-consolidated-category-corpus.md
status: PASS_WITH_CAVEATS
findings: Cross-source nutrition and progress-measurement overlaps merged semantically with provenance retained.
assumptions: []
missing_data: []
conflicts: []
caveats: Source-specific emphases remain distinct inside merged categories.
confidence: HIGH
next_action: P4-P7 for each category
```

```yaml
checkpoint_id: CP8
task_id: P8
artifact_id: README.md
status: PASS_WITH_CAVEATS
findings: 16 categories released; every category contains Conceptual, Stakeholder and Function decomposition plus cross-lens traceability.
assumptions: []
missing_data: Source does not define every actor relationship, dependency or universal causal path.
conflicts: Mixed/contradictory study findings remain source-level caveats and are not silently reconciled.
caveats: This KB is source-bounded and should not be treated as a substitute for medical advice or as an external literature update.
confidence: HIGH
next_action: RELEASE
```
