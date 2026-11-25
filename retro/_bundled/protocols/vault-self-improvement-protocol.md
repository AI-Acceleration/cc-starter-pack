# Vault CLAUDE.md Self-Improvement Protocol

> Load when: running the CLAUDE.md retrospective step of any review cadence.

This file is a living document. AI must treat it as improvable infrastructure, not sacred text. At each review cadence, AI conducts a retrospective on its own operating instructions and proposes concrete updates.

## Trigger: Every Review Cadence

As the **final step** of every Weekly, Monthly, Quarterly, and Annual review, AI must run the CLAUDE.md Retrospective below. This is non-optional.

## CLAUDE.md Retrospective Process

**Step 1 — Collect evidence.** Review the conversation history and session logs since the last review. Identify:
- Instructions the user had to repeat or correct (→ the rule was missing or unclear)
- Moments where AI acted against user intent despite following CLAUDE.md (→ the rule was wrong)
- Workflows that worked well but aren't codified (→ a new rule is needed)
- Rules that were never triggered or are now obsolete (→ candidates for removal)
- User-stated preferences, conventions, or corrections given during sessions

**Step 2 — Draft proposed changes.** For each finding, draft a specific CLAUDE.md edit:
- **Add:** New rule or instruction with rationale
- **Amend:** Modified wording of existing rule with before/after and rationale
- **Remove:** Rule to delete with rationale for why it's obsolete or counterproductive

**Step 3 — Present to user for approval.** Output a structured report:

```
## CLAUDE.md Retrospective — [Review Type] [Date]

### Proposed Additions
- [Rule text] — *Rationale: [why]*

### Proposed Amendments
- **Section X, current:** "[old text]"
- **Proposed:** "[new text]"
- *Rationale: [why]*

### Proposed Removals
- **Section X:** "[rule text]" — *Rationale: [why]*

### No Change Needed
- [Brief confirmation that remaining rules performed well]
```

**Step 4 — Apply approved changes.** After user confirms which changes to accept, update CLAUDE.md directly (this is the one exception where AI modifies CLAUDE.md without copying to workspace first — the file is its own operating manual).

**Step 5 — Cross-pollination check.** Review the sibling Programming CLAUDE.md (your Programming Projects `CLAUDE.md`) for any recently added general rules or patterns worth porting. Propose portable additions to the user — do not auto-apply.

**Step 5b — Skill/Plugin/Command Enrichment Check.** Review the session's work and ask: "Did this session produce a workflow, technique, or capability that an existing skill, plugin, or command should absorb?" Specifically:
- **Existing skills:** Scan skills whose domain overlaps with the work done (e.g., if vault cleaning was done, check `/clean-projects`, `/clean-areas`, `/clean-reference`; if reviews were done, check `/weekly-review`, `/monthly-review`). If the session discovered new steps, edge cases, patterns, or sub-workflows that the skill doesn't cover — propose specific additions to that SKILL.md.
- **Existing plugins/commands:** If the session used a plugin command and found it lacking — propose the enhancement.
- **New skill candidates:** If the session performed a multi-step workflow that isn't covered by any existing skill and is likely to recur — propose creating a new skill via `/skill-create`.
- **Convention updates:** If the session established or validated a practice that should be captured as a shared, cross-project convention — propose adding or amending the relevant convention doc (wherever your setup keeps those).
- Present all proposals to the user. Do not auto-apply. The user decides which enrichments to execute.
- If executing enrichments, read the target skill fully before editing — skills are complex and edits must be surgical.

**Step 5c — Structural editing heuristics.** When applying proposed changes to CLAUDE.md files, prefer these 3 structural patterns:

- **Sibling-rule consolidation:** 3+ bullets describing the same concept → merge into one parent rule with sub-items.
- **Reference-table extraction:** Dense reference tables >30 lines → extract to `Resources/` or `SHARED/` with an inline one-paragraph pointer + key diagnostic commands.
- **Hard-Won Rules extraction:** Multi-paragraph evidence-based rules accumulating in a DO list → extract into a `### Hard-Won Rules (from incidents)` subsection at the same heading level.

These are heuristics, not hard rules. Apply when they improve scannability without losing content. Evidence: 2026-04-15 CLAUDE.md chain audit converged on all three independently from an earlier-same-day retro (commit 454813e).

**Step 6 — Decision trace migration.** Run `/migrate-lessons` to check for unmigrated lessons in `lessons.md` that should be promoted to the decision traces knowledge graph. This ensures mature patterns get indexed for future recall.

## Scope by Review Cadence

| Review | Retrospective Scope |
|--------|---------------------|
| **Weekly** | Tactical fixes — repeated corrections, missing micro-rules, wording clarifications. Lightweight, fast. |
| **Monthly** | Workflow-level — are review processes efficient? Are DO/DON'T lists accurate? Any new patterns worth codifying? |
| **Quarterly** | Structural — is the section organization still right? Are there contradictions between sections? Should sections be added, merged, or split? |
| **Annual** | Strategic — does the vault philosophy still hold? Are the core principles (output-first, evergreen notes, dual hierarchy) still serving the user's evolving goals? Full audit. |

## Guardrails

- **No bloat.** Every proposed addition must pass: "Will this prevent a concrete, recurring problem?" If speculative, discard.
- **No redundancy.** Before adding a rule, check if an existing rule already covers it. Amend instead of adding.
- **Brevity wins.** New rules should be as short as the shortest existing rules. If it takes a paragraph to explain, it's too complex.
- **Reversible.** Every change is logged in the retrospective report. If a rule proves counterproductive, it can be traced and reverted.
- **Changelog.** Maintain a running changelog at the bottom of the Vault Management CLAUDE.md, recording date, review type, and summary of changes made.
- **Changelog row compaction.** Keep each changelog row scannable: one or two-sentence summary + a link to a detail file in your reports folder when the retro spans >300 chars of prose. The protocol file is loaded during every retro — multi-paragraph rows make the file hard to load in full (token limits) and degrade scannability for humans. Same heuristic as Step 5c "Reference-table extraction." Evidence: this protocol file once hit a 25K-token read limit at 188 lines because a single changelog row had ballooned to ~1.2K chars of prose.

## Lessons Learned Log

Maintain a running log (e.g. a `lessons.md` file in your Claude Code resources folder) to capture friction, insights, and what worked between review cadences.

- Entries are raw experience data, not rules.
- Log as issues arise — don't wait for the next review.
- The retrospective process above uses this log as input for proposing CLAUDE.md changes.

---

## CLAUDE.md Changelog

Keep your own running changelog here, or at the bottom of your Vault Management `CLAUDE.md` (see Guardrails above). One row per retrospective; newest first.

| Date | Review Type | Changes |
|------|-------------|---------|
| YYYY-MM-DD | Initial | Added Self-Improvement Protocol and Changelog |
