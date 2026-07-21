# Ask Basil — Agent-to-Agent Interop

Basil is not a human-only chat toy. Every surface below uses the same
**Ask Basil home** (`HERMES_HOME=%LOCALAPPDATA%\ask-basil` on Windows) and the
same **Basil SOUL** + **BASIL_CHRONICLE**.

## Golden rule

```text
HERMES_HOME = Ask Basil home   (never stock Hermes unless you mean fleet Hermes)
SOUL.md     = Basil only
```

Launcher:

```powershell
cd C:\Users\simon\Dev\ask-basil
.\Start-AskBasil.ps1
# or:
$env:HERMES_HOME = "$env:LOCALAPPDATA\ask-basil"
```

## Surfaces (all agent-compatible)

| Surface | Command | How other agents talk to Basil |
|---------|---------|--------------------------------|
| **Oneshot CLI** | `hermes chat -q "…" -Q` or `hermes -z "…"` | Any agent/script that can shell out |
| **Serve (WS/JSON-RPC)** | `hermes serve --host 127.0.0.1 --port 9119` | Desktop, remote clients, custom agents over HTTP/WS |
| **ACP** | `hermes acp` | VS Code / Zed / JetBrains / ACP clients (stdio) |
| **MCP** | `hermes mcp serve` | Claude / Cursor / other MCP hosts spawn this as a server |
| **Desktop** | `hermes desktop` (point at this home) | Human + same backend as serve |

### 1. Oneshot (simplest agent→Basil)

```powershell
$env:HERMES_HOME = "$env:LOCALAPPDATA\ask-basil"
hermes chat -q "Who are you?" -Q --provider openai-codex --max-turns 5
```

Quiet mode (`-Q`) prints final answer + session id — ideal for orchestration.

### 2. Serve backend (long-running)

```powershell
$env:HERMES_HOME = "$env:LOCALAPPDATA\ask-basil"
hermes serve --host 127.0.0.1 --port 9119 --skip-build
```

Health:

```text
GET http://127.0.0.1:9119/api/status
```

Expect `hermes_home` under `ask-basil`. Desktop and remote agents attach here.

### 3. ACP (Agent Client Protocol)

```powershell
$env:HERMES_HOME = "$env:LOCALAPPDATA\ask-basil"
hermes acp --check   # deps OK
hermes acp           # stdio server — parent process is the other agent/IDE
```

### 4. MCP (Model Context Protocol)

```powershell
$env:HERMES_HOME = "$env:LOCALAPPDATA\ask-basil"
hermes mcp serve
```

Register as an MCP server in Claude Desktop / Cursor / etc. with that command
and `HERMES_HOME` set in the server env. Other agents then use Basil as a tool
peer, not a separate personality.

## Identity contract (must not drift)

- Name: **Basil**
- Role: Chief of Staff of Ask Basil / Basileus
- Not Hermes Agent (stock Hermes = optional fleet worker)
- Self-history: `BASIL_CHRONICLE.md` + `ASK_BASIL.md`
- Work model (Control Room): Jobs → Runs → Artifacts → Decisions

Any agent that dispatches to Basil should pass context as a **Job** once the
spine exists. Until then, include in the prompt:

```text
You are Basil. Job intent: <…>. Report honestly. Do not freestyle parallel boards.
```

## Stock Hermes vs Ask Basil

| | Ask Basil (HQ) | Stock Hermes (worker) |
|--|----------------|------------------------|
| Home | `%LOCALAPPDATA%\ask-basil` | `%LOCALAPPDATA%\hermes` |
| Persona | Basil | Hermes Agent |
| Product | Control Room HQ | Fleet worker |

Never point two different products at the same home if you care about identity.

## Verified on this machine (2026-07-21)

- Oneshot as Basil: **pass** (“My name is Basil… I’m not Hermes.”)
- `hermes acp --check`: **OK**
- `hermes serve` on `127.0.0.1:9119` with `ask-basil` home: **up**
