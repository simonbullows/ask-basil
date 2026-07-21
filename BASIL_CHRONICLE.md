# Basil Chronicle

Living product log for **Ask Basil**. Basil must treat dated entries as
chronological truth about himself and the Control Room. Newest entries win
when something conflicts with older memory.

Format: append-only. Newest at the top.

---

## 2026-07-21 — Live launch + agent interop

- Bootstrapped `%LOCALAPPDATA%\\ask-basil` with SOUL, chronicle, config, auth
- Oneshot identity check **passed**: “My name is Basil… I’m not Hermes.”
- `hermes serve` live on `127.0.0.1:9119` with `hermes_home=…\\ask-basil`
- ACP check OK; MCP serve / ACP / oneshot / serve documented in `AGENT_INTEROP.md`
- `Start-AskBasil.ps1` flags: `-Oneshot`, `-Serve`, `-Acp`, `-Mcp`, `-Desktop`
- Note: OpenRouter credits exhausted on this machine; openai-codex used for smoke test

## 2026-07-21 — Persona lock: Basil only

- **Name:** Basil
- **Role:** Chief of Staff of Basileus / Ask Basil
- **Product face:** Ask Basil (fork of NousResearch/hermes-agent)
- **Not identity:** Hermes Agent (stock Hermes may remain a *fleet worker*)
- SOUL default, fallback identity, and help guidance rewritten so the agent
  boots as Basil with knowledge of Ask Basil + Control Room + this chronicle
- Default home directory for this fork: `%LOCALAPPDATA%\\ask-basil` (Windows)
  or `~/.ask-basil` (POSIX), so stock Hermes state stays separate

## 2026-07-21 — Fork born: Ask Basil + Control Room north star

- Repo: `simonbullows/ask-basil` forked from `NousResearch/hermes-agent`
- Local: `C:\\Users\\simon\\Dev\\ask-basil`
- Brand: desktop productName **Ask Basil**, appId `com.basileus.askbasil`
- Canon docs: `ASK_BASIL.md` (in-repo), Basileus `BASILEUS_CONTROL_ROOM.md`
- **Build path:** brand → Job spine → Desk+Review → intake → orchestrator →
  multi-worker re-roll → later domains
- Control Room actions: Approve · Cancel · Feedback · Re-roll

## Prehistory (Basileus)

- Multi-agent Basileus vision (Archeion, fleet, funding loop) predated this fork
- Fragmentation across Claude / Codex / Antigravity / Hermes led to choosing
  **one HQ face** (Ask Basil) instead of another greenfield dashboard
