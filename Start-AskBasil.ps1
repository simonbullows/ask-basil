# Launch Ask Basil with its own home (never stock Hermes).
# Usage:
#   .\Start-AskBasil.ps1                 # set env + print help
#   .\Start-AskBasil.ps1 -Desktop
#   .\Start-AskBasil.ps1 -Serve          # agent backend :9119
#   .\Start-AskBasil.ps1 -Oneshot "Who are you?"
#   .\Start-AskBasil.ps1 -Acp            # ACP stdio (agent clients)
#   .\Start-AskBasil.ps1 -Mcp            # MCP stdio (agent hosts)

param(
    [switch]$Desktop,
    [switch]$Serve,
    [switch]$Acp,
    [switch]$Mcp,
    [string]$Oneshot = "",
    [string]$Provider = "openai-codex",
    [int]$Port = 9119
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$AskBasilHome = Join-Path $env:LOCALAPPDATA "ask-basil"
$StockHome = Join-Path $env:LOCALAPPDATA "hermes"

$env:HERMES_HOME = $AskBasilHome
Write-Host "HERMES_HOME=$env:HERMES_HOME"
Write-Host "Repo=$RepoRoot"

if (-not (Test-Path (Join-Path $AskBasilHome "SOUL.md"))) {
    Write-Host "Seeding SOUL.md + chronicle into Ask Basil home..."
    python -c @"
from pathlib import Path
from hermes_cli.default_soul import DEFAULT_SOUL_MD
home = Path(r'$AskBasilHome')
home.mkdir(parents=True, exist_ok=True)
(home / 'SOUL.md').write_text(DEFAULT_SOUL_MD, encoding='utf-8')
src = Path(r'$RepoRoot') / 'BASIL_CHRONICLE.md'
if src.is_file():
    (home / 'BASIL_CHRONICLE.md').write_text(src.read_text(encoding='utf-8'), encoding='utf-8')
print('seeded', home)
"@
}

# Bootstrap secrets from stock Hermes home if Ask Basil is empty (never print values)
foreach ($name in @(".env", "auth.json", "config.yaml")) {
    $dst = Join-Path $AskBasilHome $name
    $src = Join-Path $StockHome $name
    if ((Test-Path $src) -and -not (Test-Path $dst)) {
        Copy-Item $src $dst -Force
        Write-Host "bootstrapped $name from stock Hermes home"
    }
}

Set-Location $RepoRoot

if ($Oneshot) {
    hermes chat -q $Oneshot -Q --provider $Provider --max-turns 8
    exit $LASTEXITCODE
}

if ($Serve) {
    Write-Host "Starting Ask Basil serve on 127.0.0.1:$Port (agent backend)..."
    hermes serve --host 127.0.0.1 --port $Port --skip-build
    exit $LASTEXITCODE
}

if ($Acp) {
    Write-Host "Starting Ask Basil ACP (stdio) — parent process is the client agent/IDE"
    hermes acp
    exit $LASTEXITCODE
}

if ($Mcp) {
    Write-Host "Starting Ask Basil MCP server (stdio) — parent process is the MCP host"
    hermes mcp serve
    exit $LASTEXITCODE
}

if ($Desktop) {
    if (Get-Command hermes -ErrorAction SilentlyContinue) {
        hermes desktop --hermes-root $RepoRoot
    } else {
        Write-Host "hermes CLI not on PATH. From repo: install deps then apps/desktop npm run dev"
    }
    exit $LASTEXITCODE
}

Write-Host @"

Ask Basil environment is set (Basil persona + Control Room HQ).

Agent-compatible launches:
  .\Start-AskBasil.ps1 -Oneshot "Who are you?"
  .\Start-AskBasil.ps1 -Serve
  .\Start-AskBasil.ps1 -Acp
  .\Start-AskBasil.ps1 -Mcp
  .\Start-AskBasil.ps1 -Desktop

See AGENT_INTEROP.md
Persona: Basil only
Chronicle: $env:HERMES_HOME\BASIL_CHRONICLE.md
"@

