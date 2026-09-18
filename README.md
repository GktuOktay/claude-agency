# 🏗️ Claude Agency

🌐 **English** · [Türkçe](README.tr.md)

> Enterprise-grade multi-agent orchestration for Claude Code.  
> **139 expert skills**, 38 subagents, hook-based quality gates, and MCP integration.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Skills](https://img.shields.io/badge/Skills-139-green.svg)](docs/skill-catalog.md)
[![Agents](https://img.shields.io/badge/Agents-38-orange.svg)](docs/agents.md)

## What Is This?

Claude Agency transforms Claude Code from a general-purpose assistant into a **team of 38 specialized subagents** orchestrated by a hierarchical skill system. Instead of one AI doing everything, the right expert handles each task.

## ⚡ Quick Start

```bash
git clone https://github.com/GktuOktay/claude-agency.git
cd claude-agency
./setup.sh   # Interactive: model selection + MCP configuration
claude       # Launch Claude Code
```

`setup.sh` handles:
1. **Model selection** — Sonnet 4.6 / Opus 5 / Hybrid (Security+Backend → Opus)
2. **MCP activation** — PostgreSQL, Filesystem, Brave Search, Playwright
3. **Environment setup** — API keys and connection strings

## 🏛️ Architecture

```mermaid
flowchart TD
    User([User Request]) --> CLAUDE_MD[CLAUDE.md Delegation Rules]
    
    CLAUDE_MD -->|Evaluate Task| Decision{Delegation Threshold Met?}
    Decision -->|No| Claude[Claude General]
    Decision -->|Yes| OrchestratorLayer
    
    subgraph OrchestratorLayer [Orchestrator Layer (11 Orchestrators)]
        master[Master Orchestrator]
        code[Code Orchestrator]
        security[Security Orchestrator]
        test[Test Orchestrator]
        design[Design Orchestrator]
        deployment[Deployment Orchestrator]
        git[Git Orchestrator]
        docs[Docs Orchestrator]
        ba[BA Orchestrator]
        marketing[Marketing Orchestrator]
        project[Project Bootstrap Orchestrator]
    end
    
    OrchestratorLayer --> SpecialistLayer
    
    subgraph SpecialistLayer [Specialist Layer (38 Specialists)]
        Backend[Backend Specialists]
        Frontend[Frontend Specialists]
        Mobile[Mobile Specialists]
        SecuritySpec[Security Specialists]
        DevOps[DevOps Specialists]
        DesignSpec[Design Specialists]
        Product[Product Specialists]
        Strategy[Strategy & Support]
    end
    
    SpecialistLayer --> QualityGates
    
    subgraph QualityGates [Quality Gates (28 Gates)]
        TDD[TDD Gate]
        AntiSycophancy[Anti-Sycophancy]
        PII[PII Masking]
        Hallucination[Hallucination Firewall]
        Logging[Structured Logging]
        SecurityScan[Security Audits]
    end
    
    QualityGates --> Output([Final Output Delivered])
```

## 📦 What's Inside?

### Skills (139)

| Category | Count | Examples |
|---|---|---|
| 🎼 Orchestrators | 11 | master, code, security, test, design, deployment, git, docs, ba, marketing, project-bootstrap |
| 🔧 Specialists | ~55 | dotnet-enterprise, swift-architecture, clean-code, db-architect, graphify, caveman, humanizer |
| 🚦 Quality Gates | 28 | TDD gate, PII masking, anti-sycophancy, hallucination firewall, structured logging |
| 🛡️ Security & Pentest | ~21 | OWASP top 10, JWT vulns, XSS, CORS, CSRF, OAuth2 flaws, mass assignment |
| ⚙️ Workflows & Tools | ~24 | API handoff, standup generator, changelog, caveman compress, skill creator |

→ [Full catalog: docs/skill-catalog.md](docs/skill-catalog.md)

### Subagents (38)

| Domain | Agents |
|---|---|
| Technical | backend-specialist, frontend-developer, mobile-ios-swift, database-optimizer, devops-engineer, gis-web-developer, integrations-webhook-specialist |
| Quality & Security | code-reviewer, test-engineer, testing-qa-engineer, testing-test-strategist, security-specialist, security-secrets-engineer, security-compliance-auditor, security-ai-code-auditor, incident-response |
| Product & Design | product-manager, product-sprint-prioritizer, product-feedback-synthesizer, design-ui-designer, design-ux-architect, design-ux-researcher, design-ui-finish-gate-reviewer, design-brand-guardian, design-persona-walkthrough |
| Strategy & Support | project-manager-senior, meeting-notes-specialist, strategy-business-strategist, strategy-okr-coach, research-synthesizer, marketing-content-strategist, marketing-seo-specialist, marketing-copywriter, support-technical-support, support-customer-support, technical-writer, specialized-focus-manager, specialized-reality-checker |

→ [Full reference: docs/agents.md](docs/agents.md)

## 🔄 How It Works

1. **Request arrives** → `CLAUDE.md` delegation rules evaluate the task
2. **Delegation threshold** — If 3+ files, new module, domain expertise, or 10+ min task → delegate
3. **Orchestrator activates** → Routes to the right specialist
4. **Specialist executes** → Only specialists write code (orchestrators never do)
5. **Quality gates audit** → TDD, security, logging, anti-sycophancy checks
6. **Output delivered** → Honest, no-fluff response (anti-sycophancy enforced)

## 🔧 Configuration

### MCP Servers (Optional)
- **PostgreSQL** — Read live DB schema to prevent hallucination
- **Filesystem** — File system access
- **Brave Search** — Web search capability
- **Playwright** — E2E testing and web scraping
- **MS Learn** — Microsoft documentation (always active)

### Hook System
- Pre-write quality checks
- Post-write linting
- Notification system

→ [Details: docs/hooks.md](docs/hooks.md) · [MCP: docs/mcp.md](docs/mcp.md)

## 🌍 Core Principles

- **Anti-sycophancy** — No praise-spam, no apologies, no filler. Challenges bad decisions.
- **Zero-assumption** — Ambiguous task? Halt and ask max 2-3 Socratic questions.
- **Security paranoia** — All external input is malicious until proven otherwise.
- **DRY enforcement** — Scan codebase for existing abstractions before writing new code.
- **Scientific debugging** — Analyze logs → hypothesis → targeted fix. No trial-and-error.

## 📚 Documentation

| Document | Content |
|---|---|
| [Documentation Center](docs/README.md) | Central table of contents & overview |
| [architecture.md](docs/architecture.md) | System diagrams & anti-pattern standards |
| [agents.md](docs/agents.md) | 38 subagent reference & specifications |
| [skill-catalog.md](docs/skill-catalog.md) | 139 skill full catalog |
| [hooks.md](docs/hooks.md) | Hook quality gate system reference |
| [mcp.md](docs/mcp.md) | MCP server configuration |
| [flow-diagram.md](docs/flow-diagram.md) | Lifecycle and task flow diagrams |
| [memory-guide.md](docs/memory-guide.md) | Persistent project memory guide |

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## 📄 License

MIT — see [LICENSE](LICENSE) for details.
