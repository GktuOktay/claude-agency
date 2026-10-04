---
name: git-orchestrator
description: "Git süreçlerini, commit standartlarını, issue ve PR yönetimini, repo kurallarını yöneten ana orkestratör."
---

# Git Orchestrator — Git Processes and Repo Manager

You are an orchestrator. Analyze the user's request related to Git, GitHub/GitLab, branch management, committing, PR creation, or repository rules (community standards), and automatically invoke the sub-skills below.

---

## Sub-Skills You Manage

### 1. `git-conventional-commits`
**When to Invoke:**
- When writing a commit message
- When opening a new branch (if a naming convention is required)
- When editing past commits (rebase/squash) to comply with standards

### 2. `.claude/skills/git-orchestrator/references/git-issue-manager.md`
**When to Invoke:**
- When opening a new Issue (Bug, Feature Request) on GitHub/GitLab
- When adding a label or milestone to issues
- When creating an issue template
- When performing issue triage/management in an "oh-my-issues" fashion

### 3. `.claude/skills/git-orchestrator/references/git-pr-reviewer.md`
**When to Invoke:**
- When opening a Pull Request (PR) (writing the description text)
- When reviewing an incoming PR (code review)
- When deciding on a merge strategy

### 4. `git-repo-setup`
**When to Invoke:**
- When setting up GitHub community standards while starting a new project
- When creating files like `README.md`, `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`
- When configuring repository settings (branch protection)

### 5. `version-bump`
**When to Invoke:**
- When releasing a new version (SemVer rules)
- When creating a changelog
- When tagging a release

### 6. `change-tracker`
**When to Invoke:**
- When the `CHANGELOG.md` file needs to be updated according to the "Keep a Changelog" format as code is written
- When continuous logging of work done during development into a markdown document (live changelog) is requested

---

## Orchestration Rules

1. **Analyze:** Determine the scope of the request — Just a commit, or the entire PR process?
2. **Invoke:** Read the relevant SKILL.md files and act according to their instructions.
3. **Consistency:** Ensure that generated PR descriptions align with the commit messages (Conventional Commits).

### Common Flow Examples

| User Request | Skills to Invoke (Ordered) |
|---|---|
| "Commit my changes and open a PR" | `git-conventional-commits` → `.claude/skills/git-orchestrator/references/git-pr-reviewer.md` |
| "Prepare this repo for open-source" | `git-repo-setup` → `.claude/skills/git-orchestrator/references/git-issue-manager.md` |
| "We are releasing a new version, prepare the notes" | `version-bump` |
| "Let's open an issue for this bug" | `.claude/skills/git-orchestrator/references/git-issue-manager.md` |

---

## When Not to Invoke
- For very simple/quick commit operations (if `caveman-commit` is being used)

---

## Alt Yetenekler

> **Alt yetenekler** `references/` altındadır; Skill tool ile çağrılmazlar. Göreve uyan dosyayı Read ile yükle, gerisini yükleme.

| Dosya | Ne zaman |
|---|---|
| `references/git-conventional-commits-workflow.md` | Git commit mesajları ve branch isimlendirme standartlarını belirler. Conventional Commits kurallarını uygular. |
| `references/git-issue-manager.md` | GitHub/GitLab issue yönetimi için en iyi uygulamalar. Etkili hata raporları, özellik istekleri yazma ve etiketleme. |
| `references/git-pr-reviewer.md` | Pull Request (PR) oluşturma ve kod inceleme (code review) süreçleri için standartlar ve yapıcı geri bildirim. |
| `references/git-repo-setup-workflow.md` | GitHub repo kurulumu ve topluluk standartları için en iyi uygulamalar (README, CONTRIBUTING, kurallar). |
| `references/generate-standup-workflow.md` | Günlük standup (geliştirme) raporlarını kısa, öz ve yapılandırılmış bir şekilde oluşturma kuralları. |
| `references/update-changelog-workflow.md` | Release & Changelog Manager: Manages version bumps (x.x.x SemVer) and CHANGELOG.md generation ONLY during the Release/Deployment phase, neve |
| `references/api-handoff-workflow.md` | Backend'de bir değişiklik yapıldığında otomatik Changelog çıkaran ve Frontend takımı için eski/yeni API karşılaştırma (Devir-Teslim) doküman |
