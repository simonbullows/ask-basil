# Launch Ask Basil with its own home (never stock Hermes).
# Usage: .\Start-AskBasil.ps1
#        .\Start-AskBasil.ps1 -Desktop

param(
    [switch]$Desktop
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$AskBasilHome = Join-Path $env:LOCALAPPDATA "ask-basil"

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

Set-Location $RepoRoot

if ($Desktop) {
    if (Get-Command hermes -ErrorAction SilentlyContinue) {
        hermes desktop --hermes-root $RepoRoot
    } else {
        Write-Host "hermes CLI not on PATH. From repo: install deps then apps/desktop npm run dev"
        Write-Host "Or: pip/uv install this checkout and re-run."
    }
} else {
    Write-Host @"

Ask Basil environment is set. Next:
  hermes              # CLI chat as Basil
  hermes desktop      # desktop (if installed)
  .\Start-AskBasil.ps1 -Desktop

Persona: Basil only. Chronicle: `$env:HERMES_HOME\BASIL_CHRONICLE.md
"@
}
