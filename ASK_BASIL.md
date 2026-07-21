# Ask Basil

**Product you open.** Clean fork of [NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent).  
**Owner:** Simon Bullows · **Part of:** Basileus

## What this is

| Name | Role |
|------|------|
| **Ask Basil** | This app — HQ face, chat, tools, desktop |
| **Basil** | The **only** agent persona — chief of staff (see `SOUL.md` / `hermes_cli/default_soul.py`) |
| **Control Room** | Jobs · runs · artifacts · decisions growing *inside* this fork |
| **Hermes (stock)** | Official Nous Hermes — a **fleet worker**, not this product’s brand |

Basil boots as Basil from first run. He is not Hermes with a nickname.  
He stays current via **`BASIL_CHRONICLE.md`** (chronological product truth) and this file.

Upstream Hermes remains installable and useful as a separate worker. This fork is **your** point of contact.

### Home directory (separate from stock Hermes)

| Platform | Ask Basil home |
|----------|----------------|
| Windows | `%LOCALAPPDATA%\\ask-basil` |
| POSIX | `~/.ask-basil` |

Override with `HERMES_HOME` only if you mean to. Stock Hermes keeps `%LOCALAPPDATA%\\hermes` / `~/.hermes`.

## North star

> Open Ask Basil. Ask Basil. Work becomes Jobs. Workers take Runs. You judge the picture. Nothing freelances.

Full Control Room contract (canon in basileus-masterplan):

`../basileus-masterplan/BASILEUS_CONTROL_ROOM.md`

## Build path (incremental)

| Phase | Deliverable |
|-------|-------------|
| **0** | Fork + brand + **Basil persona** + chronicle ← **you are here** |
| **1** | Job spine (jobs / runs / artifacts / decisions) |
| **2** | Desk + Review tray (Approve / Cancel / Feedback / Re-roll) |
| **3** | Basil intake creates structured Jobs |
| **4** | Orchestrator + one worker adapter |
| **5** | Second worker + re-roll |
| Later | Domain panels, multi-device, full Basileus surfaces |

## Remotes

```text
origin    https://github.com/simonbullows/ask-basil.git
upstream  https://github.com/NousResearch/hermes-agent.git
```

Pull upstream carefully; keep Control Room modules thin and ours.

## Rules

1. If it’s not a Job on the board, it didn’t happen (once spine exists).
2. Pretty **spine**, pragmatic **shell** (Hermes-shaped host is OK).
3. Small PRs / commits. No boiling the ocean.
4. Stock Hermes can stay in the fleet as a worker.

## Local path

`C:\Users\simon\Dev\ask-basil`
