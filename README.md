# Claude Agency

Claude Code için özelleştirilmiş enterprise-grade multi-agent sistemi.

127 uzman skill ve 5 subagent tanımıyla deterministic, mimari güdümlü AI iş birliği sağlar.

## Yapı

```
claude-agency/
├── CLAUDE.md                    # Global davranış kuralları + agent delegasyon haritası
├── .claude/
│   ├── agents/                  # Subagent tanımları (model + tool kısıtları)
│   │   ├── backend-specialist.md
│   │   ├── security-specialist.md
│   │   ├── test-engineer.md
│   │   ├── devops-engineer.md
│   │   └── code-reviewer.md
│   ├── skills/                  # 127 uzman skill (Claude Code native format)
│   └── settings.json            # Hooks (quality gates) + MCP server tanımları
└── docs/
    ├── claude-code-memory-setup.md
    └── claude-code-v2-improvements.md
```

## Kurulum

```bash
git clone https://github.com/GktuOktay/claude-agency.git
cd claude-agency
```

Claude Code bu dizini açtığında `CLAUDE.md` ve `.claude/` otomatik yüklenir — ek kurulum gerekmez.

## MCP Server'lar

`.claude/settings.json` içindeki MCP server'ları aktifleştirmek için:

```bash
export POSTGRES_CONNECTION_STRING="postgresql://user:pass@localhost/dbname"
export PROJECT_ROOT="/path/to/your/project"
export BRAVE_API_KEY="your-key"  # brave.com/search/api
```

## Subagent'lar

| Agent | Görev | Model |
|---|---|---|
| `backend-specialist` | .NET 10, EF Core, CQRS | Sonnet 4.6 |
| `security-specialist` | OWASP, pentest, JWT | Sonnet 4.6 |
| `test-engineer` | Unit/Integration/E2E, TDD | Sonnet 4.6 |
| `devops-engineer` | CI/CD, Docker, K8s, IaC | Sonnet 4.6 |
| `code-reviewer` | Read-only kalite denetimi | Sonnet 4.6 |

## Hooks

`PreToolUse` seviyesinde otomatik kalite kontrolleri:
- `DateTime.Now` kullanımı → blok
- `rm -rf` ve `DROP TABLE` → blok
- Hardcoded password → uyarı
- `.cs` dosyası yazıldığında → build hatırlatması

## autonomous-agency ile Fark

Bu repo Claude Code'a özeldir. Cursor, Windsurf veya diğer IDE'leri hedefliyorsan [autonomous-agency](https://github.com/GktuOktay/autonomous-agency) reposunu kullan.
