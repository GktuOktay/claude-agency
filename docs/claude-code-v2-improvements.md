# Autonomous Agency v2 → Claude Code Modernizasyon Notları

## Uygulanan Değişiklikler

### 1. `.clauderules` → `CLAUDE.md` ✅
Claude Code artık `CLAUDE.md` okuyor. Hiyerarşi:
- `~/.claude/CLAUDE.md` — global kurallar (tüm projeler)
- `<proje>/CLAUDE.md` — proje-özel kurallar (bu dosya)
- `<alt-dizin>/CLAUDE.md` — alt-dizin kuralları (isteğe bağlı)

### 2. Hooks (`.claude/settings.json`) ✅
Kalite kapıları artık prompt-bazlı değil, tool-call seviyesinde enforce ediliyor:
- `PreToolUse[Bash]`: `DateTime.Now`, `rm -rf`, `DROP TABLE` → otomatik blok
- `PreToolUse[Write|Edit]`: hardcoded password tespiti → uyarı
- `PostToolUse[Write|Edit]`: `.cs` dosyası yazıldığında build önerisi
- `Stop`: oturum tamamlandığında bildirim

### 3. Subagent Definitions (`.claude/agents/`) ✅
Her uzman agent kendi model ve tool kısıtlarıyla:
- `backend-specialist` → Opus 5 (ağır .NET işleri)
- `security-specialist` → Opus 5 (OWASP analizi)
- `test-engineer` → Sonnet 5 (test yazımı)
- `devops-engineer` → Sonnet 5 (CI/CD, K8s)
- `code-reviewer` → Sonnet 5 (read-only review)

### 4. `setup.py` Modernizasyonu ✅
- `--claude-only` flag eklendi: sadece Claude Code artifact'ları yeniler
- `--skills-only` flag: sadece skill sync
- Build summary tablosu
- `CLAUDE.md` otomatik güncelleme adımı

---

## Repo İçin Ek Öneriler

### A. GitHub Actions CI Entegrasyonu
`.github/workflows/validate-skills.yml` ekle:
```yaml
on: [push, pull_request]
jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: python setup.py --skills-only
      - run: python -c "
          import glob, sys
          errors = []
          for f in glob.glob('.claude/skills/*/SKILL.md'):
              with open(f) as fh:
                  c = fh.read()
              if not c.startswith('---'):
                  errors.append(f'Missing frontmatter: {f}')
          if errors:
              print('\n'.join(errors)); sys.exit(1)
          print(f'All skills valid.')
        "
```

### B. Skill Şablonu Standardizasyonu
Her yeni skill için `src/skills/_TEMPLATE/SKILL.md`:
```markdown
---
name: skill-name
description: "Bir cümle açıklama — skill tetikleme için kullanılır."
alwaysApply: false
---
<role>Role Name</role>
<trigger>WHEN ...</trigger>
<rules>
- RULE 1
- RULE 2
</rules>
```

### C. `src/skills/` → Kategori README'leri
Her kategori için `README.md` ekle:
- `01_orchestrators/README.md` — hangi orchestrator ne zaman
- `02_specialists/README.md` — domain bazlı referans
- `03_gates/README.md` — gate tetikleme koşulları

### D. MCP Server Entegrasyonu
Projeye özel MCP server'lar `.claude/settings.json`'a eklenebilir:
```json
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres", "postgresql://localhost/mydb"]
    },
    "filesystem": {
      "command": "npx", 
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/project"]
    }
  }
}
```

### E. Plan Mode Entegrasyonu (Skill Önerisi)
`src/skills/04_meta/plan-mode/SKILL.md` ekle:
```markdown
---
name: plan-mode
description: "Kompleks görevlerde Claude Code'un plan modunu aktive eder."
alwaysApply: false
---
<role>Plan Mode Activator</role>
<trigger>WHEN task involves >3 files or architectural change</trigger>
<rules>
- ENTER plan mode before implementation
- LIST affected files and change summary
- GET user approval before writing code
- EXIT plan mode only after approval
</rules>
```

### F. Versiyon Etiketleme
`src/skills/` değişikliklerini semantic versioning ile etiketle:
- Gate değişikliği → minor bump
- Yeni orchestrator → minor bump  
- Breaking change (davranış değişikliği) → major bump
