<h1 align="center">Graph Understand for Claude Code</h1>

<p align="center">
  <strong>Turn any codebase, knowledge base, or docs into an interactive knowledge graph you can explore, search, and ask questions about.</strong>
  <br />
  <em>Built specifically for <a href="https://code.claude.com/docs/en/plugins-reference#plugins-reference">Claude Code</a>.</em>
</p>

<p align="center">
  <strong>Stop reading code blind. Start seeing the big picture.</strong>
</p>

<p align="center">
  <a href="../README.md">🇻🇳 Tiếng Việt</a> | 🇬🇧 English
</p>

<p align="center">
  <a href="https://github.com/huycoder2103/Graph-Understanf-for-claudeCodeCLI/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-yellow" alt="License: MIT" /></a>
  <a href="https://docs.anthropic.com/en/docs/claude-code"><img src="https://img.shields.io/badge/Claude_Code-8A2BE2" alt="Claude Code" /></a>
</p>

<p align="center">
  <strong>Developed and customized by <a href="https://github.com/huycoder2103">huycoder2103</a></strong>
  <br />
  <em>Based on the open-source <a href="https://github.com/Egonex-AI/Understand-Anything">Understand Anything</a> project by <a href="https://github.com/Egonex-AI">Egonex</a>, originally created by <a href="https://github.com/Lum1104">Lum1104</a>. This fork is trimmed down to focus entirely on Claude Code.</em>
</p>

---

**You just joined a new team. The codebase is 200,000 lines of code. Where do you even start?**

This is a [Claude Code Plugin](https://code.claude.com/docs/en/plugins-reference#plugins-reference) that analyzes your project with a multi-agent pipeline, builds a knowledge graph of every file, function, class, and dependency, then gives you an interactive dashboard to explore it all visually.

> **The goal isn't a graph that wows you with how complex your codebase is — it's a graph that quietly teaches you how every piece fits together.**

---

## ✨ Features

- **Explore the structural graph** — every file, function, and class is a clickable, searchable node with plain-English summaries and relationships.
- **Understand business logic** — a domain view mapping code to real business processes (domains, flows, steps).
- **Analyze knowledge bases** — point `/understand-knowledge` at a [Karpathy-pattern LLM wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) for a force-directed graph with community clustering.
- **Guided tours**, **fuzzy & semantic search**, **diff impact analysis**, **persona-adaptive UI**, **layer visualization**, and **language-concept callouts**.

---

## 🚀 Quick Start

### 1. Install the plugin

```bash
/plugin marketplace add huycoder2103/Graph-Understanf-for-claudeCodeCLI
/plugin install understand-anything
```

### 2. Analyze your codebase

```bash
/understand
```

A multi-agent pipeline scans your project and builds a knowledge graph saved to `.ua/knowledge-graph.json` (projects with a legacy `.understand-anything/` directory keep using it). Subsequent runs are incremental by default — only changed files are re-analyzed.

### 3. Explore the dashboard

```bash
/understand-dashboard
```

### 4. Keep learning

```bash
/understand-chat How does the payment flow work?
/understand-diff
/understand-explain src/auth/login.ts
/understand-onboard
/understand-domain
/understand-knowledge ~/path/to/wiki
/understand --auto-update
/understand src/frontend
```

---

## 📦 Share the Graph with Your Team

The graph is just JSON — commit it once, and teammates skip the pipeline. Commit everything in `.ua/` *except* `intermediate/` and `diff-overlay.json`:

```gitignore
.ua/intermediate/
.ua/diff-overlay.json
```

### View the dashboard without Claude Code

Once a graph is committed, anyone can open it with one command — no Claude Code, no LLM, no API key. Only Node.js (>= 18) is required:

```bash
npx https://github.com/huycoder2103/Graph-Understanf-for-claudeCodeCLI/releases/latest/download/understand-anything-viewer.tgz /path/to/analyzed/project
```

---

## 🔧 Under the Hood

Static analysis and LLMs do what each does best: **Tree-sitter** parses source into a concrete syntax tree and extracts deterministic structural facts (imports, exports, definitions, call sites, inheritance), while the **LLM** reads that structure alongside the source to produce plain-English summaries, layer assignments, domain mapping, and guided tours.

The `/understand` command orchestrates specialized agents: `project-scanner`, `file-analyzer`, `architecture-analyzer`, `tour-builder`, `graph-reviewer`, plus `domain-analyzer` (`/understand-domain`) and `article-analyzer` (`/understand-knowledge`). File analyzers run in parallel and support incremental updates.

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/my-feature`)
3. Run the tests (`pnpm --filter @understand-anything/core test`)
4. Commit your changes and open a pull request

---

<p align="center">
  <strong>Stop reading code blind. Start understanding everything.</strong>
</p>

<p align="center">
  MIT License &copy; Yuxiang Lin and Infinite Universe, Inc. — customized by <a href="https://github.com/huycoder2103">huycoder2103</a>.
</p>
