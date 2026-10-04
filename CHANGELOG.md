# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- Always-loaded context cut ~64% (est. 11.9k -> 4.3k tokens/session): 14 model-invocable skills, 99 on-demand orchestrator references, 16 manual (slash-only) skills
- 18 quality-gate skills moved to path-scoped `.claude/rules/` (`dotnet-backend.md`, `frontend.md`)
- Agent descriptions shortened to one line
- Changelog rule aligned with `update-changelog-workflow`: release-time only

### Added
- `scripts/token-audit.py` (fixed-context budget check)
- SessionStart hook enabling caveman full mode by default

### Removed
- Duplicate `graphify-tool` skill; non-functional `alwaysApply` frontmatter
- Agents `security-ai-code-auditor` (merged into `security-specialist`) and `testing-qa-engineer` (merged into `test-engineer`)

## [1.0.0] - 2026-09-18

### Added
- 139 skills (orchestrators, specialists, quality gates, workflows, capabilities, pentest)
- 38 subagents covering backend, frontend, mobile, security, design, product, strategy
- Hook-based quality gates (pre-write, post-write, notification)
- MCP integration (PostgreSQL, Filesystem, Brave Search, Playwright, MS Learn)
- Interactive setup.sh with model selection
- Comprehensive documentation (architecture, agents, skills, hooks, mcp)
