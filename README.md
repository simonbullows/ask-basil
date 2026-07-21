# Ask Basil

**Your Basileus headquarters.** Talk to **Basil**. Grow the **Control Room** (jobs, review, multi-agent dispatch) one change at a time.

This repository is a clean fork of **[NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent)** (Hermes Agent by Nous Research). We keep Hermes’ stable runtime and desktop shell, rebrand the product we live in as **Ask Basil**, and add Control Room features incrementally.

| | |
|--|--|
| **Product** | Ask Basil |
| **Agent** | Basil |
| **Work system** | Control Room (in progress) |
| **Upstream** | [NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent) |
| **Fork** | [simonbullows/ask-basil](https://github.com/simonbullows/ask-basil) |
| **Canon** | [`ASK_BASIL.md`](./ASK_BASIL.md) · Basileus `BASILEUS_CONTROL_ROOM.md` |

## Quick start (this fork)

```powershell
cd C:\Users\simon\Dev\ask-basil
# Follow upstream Hermes install / desktop docs for deps, then:
# hermes desktop   — or npm run dev from apps/desktop once workspace is installed
```

See upstream docs for full install, providers, and gateway:

- [Hermes docs](https://hermes-agent.nousresearch.com/docs/)
- [Desktop](https://hermes-agent.nousresearch.com/docs/user-guide/desktop)

## What we’re building

1. **Ask Basil** — one app to open (this fork).
2. **Control Room** — jobs desk, visual review, Approve / Cancel / Feedback / Re-roll.
3. **Workers** — Basil-core, stock Hermes, Claude, Codex, and others via adapters.

Official **Hermes** remains a separate fleet agent when useful. This product is not named Hermes.

## Attribution

Hermes Agent is built by [Nous Research](https://nousresearch.com), MIT licensed. Ask Basil starts from their work with gratitude; bugs in *our* Control Room layers are ours.

---

# Upstream: Hermes Agent

The remainder of the historical Hermes README content lives in upstream. For agent features, skills, gateway, and learning loop, treat [NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent) and [hermes-agent.nousresearch.com](https://hermes-agent.nousresearch.com/) as the technical reference until we rewrite operator docs for Ask Basil.
