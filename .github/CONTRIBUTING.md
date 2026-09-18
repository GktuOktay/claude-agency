# 🤝 Contributing Guidelines

🌐 **English** · [Türkçe](CONTRIBUTING.tr.md)

Thank you for your interest in contributing to **Claude Agency**! To maintain high engineering standards and seamless multi-agent orchestration, please follow the guidelines below.

---

## 🚀 How to Contribute

1. **Fork** the repository on GitHub.
2. Create a feature branch from `main`:
   ```bash
   git checkout -b feature/my-new-skill
   ```
3. Commit your changes following [Conventional Commits](https://www.conventionalcommits.org/):
   ```bash
   git commit -m "feat(skill): add new cloud security audit skill"
   ```
4. Push to your fork:
   ```bash
   git push origin feature/my-new-skill
   ```
5. Open a **Pull Request (PR)** against `main`.

---

## 🛠️ Adding a New Skill

All skills reside in `.claude/skills/<skill-name>/SKILL.md`. Each skill MUST start with YAML frontmatter on line 1:

```markdown
---
name: my-skill-name
description: "Brief one-sentence description explaining triggers and capabilities."
alwaysApply: false
---

# Skill Title

Skill instructions, guidelines, and execution steps...
```

### Skill Standards:
- **Zero Truncation**: Never use placeholders like `...` or `// rest remains the same`.
- **Anti-Sycophancy**: Maintain objective, direct engineering critique.
- **Frontmatter**: Must strictly begin with `---` on line 1.

---

## 🤖 Adding or Modifying Subagents

Subagents reside in `.claude/agents/<agent-name>.md`. Each agent definition must include:
1. **Frontmatter**: `name`, `description`, `model`, and allowed `tools`.
2. **Persona & Scope**: Specific domain boundaries (e.g., backend, security, testing).
3. **Mandatory Rules & Workflows**: Explicit operational constraints and checklists.

---

## 📝 Commit Standards

We enforce [Conventional Commits](https://www.conventionalcommits.org/):

| Type | Description |
|---|---|
| `feat:` | A new skill, agent, or feature |
| `fix:` | Bug fix in prompts, scripts, or hooks |
| `docs:` | Documentation changes only |
| `refactor:` | Refactoring existing skills without behavior changes |
| `chore:` | Tooling, CI, or dependency updates |

---

## 🚦 Pull Request Checklist

Before submitting your PR, verify:
- [ ] All `SKILL.md` files begin with `---` YAML frontmatter.
- [ ] No agent definition file is empty.
- [ ] Documentation catalogs (`docs/skill-catalog.md`, `docs/agents.md`) are updated if counts changed.
- [ ] CI validation passes on your fork.

---

## 📜 Code of Conduct

All contributors are expected to adhere to our [Code of Conduct](CODE_OF_CONDUCT.md).
