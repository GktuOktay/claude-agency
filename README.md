# Claude Agency

Claude Code için enterprise-grade multi-agent sistemi.
127 uzman skill, 5 subagent, hook-based quality gates ve MCP entegrasyonu.

## Hızlı Başlangıç

```bash
git clone https://github.com/GktuOktay/claude-agency.git
cd claude-agency
./setup.sh   # model seçimi + MCP konfigürasyonu
claude       # Claude Code'u başlat
```

`setup.sh` ne yapar:
1. **Model seçimi** — Sonnet 4.6 / Opus 5 / Karma
2. **MCP seçimi** — PostgreSQL, Filesystem, Brave Search aktifleştirme
3. **.env oluşturma** — API key ve bağlantı bilgileri

---

## Yapı

```
claude-agency/
├── CLAUDE.md                    # Global davranış + agent delegasyon haritası
├── setup.sh                     # Kurulum ve model seçim scripti
├── .claude/
│   ├── agents/                  # 5 subagent tanımı
│   ├── skills/                  # 127 skill (Claude Code native)
│   └── settings.json            # Hooks + MCP konfigürasyonu
└── docs/
    ├── architecture.md          # Sistem diyagramları (Mermaid)
    ├── skill-catalog.md         # 127 skill tam kataloğu
    ├── agents.md                # Subagent referansı
    ├── hooks.md                 # Hook sistemi referansı
    └── mcp.md                   # MCP server referansı
```

---

## Subagentlar

| Agent | Görev | Model |
|---|---|---|
| `backend-specialist` | .NET 10, EF Core, CQRS | Sonnet 4.6 |
| `security-specialist` | OWASP, pentest, JWT | Sonnet 4.6 |
| `test-engineer` | Unit/Integration/E2E, TDD | Sonnet 4.6 |
| `devops-engineer` | CI/CD, Docker, K8s, IaC | Sonnet 4.6 |
| `code-reviewer` | Read-only kalite denetimi | Sonnet 4.6 |

Model değiştirmek için: `./setup.sh`

---

## Quality Gates (Her Zaman Aktif)

20 gate `alwaysApply: true` ile her oturumda devrede:

- `audit-trail-guardian-gate` — DB'de `CreatedBy`, `ModifiedAt` zorunlu
- `timezone-enforcer-gate` — `DateTimeOffset.UtcNow` zorunlu
- `privacy-pii-masking-gate` — Şifre, TCKN loglama yasak
- `tenant-isolation-gate` — SaaS'da `TenantId` filtresi zorunlu
- `pre-flight-security-gate` — Kod öncesi güvenlik blueprint
- ve 15 daha fazlası → [docs/skill-catalog.md](docs/skill-catalog.md)

---

## Hooks

Tool-call seviyesinde garantili kalite kontrol:

| Hook | Tetiklenir | Sonuç |
|---|---|---|
| `PreToolUse[Bash]` | `DateTime.Now`, `rm -rf`, `DROP TABLE` | **BLOK** |
| `PreToolUse[Write/Edit]` | Hardcoded password | Uyarı |
| `PostToolUse[Write/Edit]` | `.cs` dosyası yazıldı | Build hatırlatması |

→ [docs/hooks.md](docs/hooks.md)

---

## MCP Server'lar

| Server | Amaç | Şart |
|---|---|---|
| `microsoft-learn` | .NET 10, EF Core resmi docs | Yok |
| `postgres` | DB schema, query, migration | `POSTGRES_CONNECTION_STRING` |
| `filesystem` | Proje dışı dizin erişimi | `PROJECT_ROOT` |
| `brave-search` | CVE araştırma, web arama | `BRAVE_API_KEY` |

→ [docs/mcp.md](docs/mcp.md)

---

## Dokümantasyon

| Döküman | İçerik |
|---|---|
| [Architecture](docs/architecture.md) | Sistem diyagramları — genel bakış, hook akışı, agent delegasyonu |
| [Skill Catalog](docs/skill-catalog.md) | 127 skill tam listesi ve açıklamaları |
| [Agents](docs/agents.md) | 5 subagent detaylı referansı |
| [Hooks](docs/hooks.md) | Hook sistemi kullanım kılavuzu |
| [MCP](docs/mcp.md) | MCP server kurulum ve referans |

---

## autonomous-agency ile Fark

| | `autonomous-agency` | `claude-agency` |
|---|---|---|
| **Hedef** | Cursor, Windsurf, Claude Code, Cline | Yalnızca Claude Code |
| **Build** | `setup.py` compile pipeline | Direkt, compile yok |
| **Subagent** | Yok | 5 native agent |
| **Hooks** | Yok | 4 hook |
| **MCP** | Yok | 4 server |

Multi-IDE ihtiyacın varsa: [autonomous-agency](https://github.com/GktuOktay/autonomous-agency)
