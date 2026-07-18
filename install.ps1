<#
.SYNOPSIS
  Graph Understand for Claude Code — helper installer (Windows / PowerShell).

.DESCRIPTION
  Claude Code cài plugin trực tiếp qua marketplace, KHÔNG cần script này:

    /plugin marketplace add huycoder2103/Graph-Understanf-for-claudeCodeCLI
    /plugin install understand-anything

  Script này chỉ dành cho ai muốn clone repo về máy để phát triển / tự build.

.EXAMPLE
  ./install.ps1            # Clone repo và cài deps
  ./install.ps1 -Update    # Cập nhật bản clone
  ./install.ps1 -Help
#>

param(
    [switch]$Update,
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

$RepoUrl = if ($env:UA_REPO_URL) { $env:UA_REPO_URL } else { 'https://github.com/huycoder2103/Graph-Understanf-for-claudeCodeCLI.git' }
$RepoDir = if ($env:UA_DIR) { $env:UA_DIR } else { Join-Path $HOME '.understand-anything\repo' }

function Show-Help {
    @"
Graph Understand for Claude Code — helper installer

Claude Code cài plugin trực tiếp qua marketplace, KHÔNG cần script này:

  /plugin marketplace add huycoder2103/Graph-Understanf-for-claudeCodeCLI
  /plugin install understand-anything

Script này chỉ dành cho ai muốn clone repo về máy để phát triển / tự build.

  ./install.ps1            Clone repo và cài deps
  ./install.ps1 -Update    Cập nhật bản clone
  ./install.ps1 -Help      Hiện trợ giúp
"@ | Write-Host
}

function Update-Repo {
    if (-not (Test-Path (Join-Path $RepoDir '.git'))) {
        Write-Error "Chưa có bản clone tại $RepoDir. Chạy ./install.ps1 trước."
        return
    }
    Write-Host "Đang cập nhật $RepoDir ..."
    git -C $RepoDir pull --ff-only
    Write-Host "Xong."
}

function Install-Repo {
    if (Test-Path (Join-Path $RepoDir '.git')) {
        Write-Host "Đã có bản clone tại $RepoDir — dùng ./install.ps1 -Update để cập nhật."
    } else {
        Write-Host "Đang clone vào $RepoDir ..."
        New-Item -ItemType Directory -Force -Path (Split-Path $RepoDir) | Out-Null
        git clone $RepoUrl $RepoDir
    }

    if (Get-Command pnpm -ErrorAction SilentlyContinue) {
        Write-Host "Đang cài dependencies và build core ..."
        Push-Location $RepoDir
        pnpm install
        pnpm --filter '@understand-anything/core' build
        Pop-Location
    } else {
        Write-Host "Chưa có pnpm — bỏ qua bước build. Cài pnpm (>=10) rồi chạy: pnpm install"
    }

    @"

Hoàn tất. Tiếp theo, trong Claude Code:

  /plugin marketplace add huycoder2103/Graph-Understanf-for-claudeCodeCLI
  /plugin install understand-anything
  /understand
"@ | Write-Host
}

if ($Help) { Show-Help }
elseif ($Update) { Update-Repo }
else { Install-Repo }
