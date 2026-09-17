# Claude Agency

Claude Code için enterprise-grade multi-agent sistemi.  
**38 uzman agent**, 127 skill, hook-based quality gates ve MCP entegrasyonu.

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
│   ├── agents/                  # 38 subagent tanımı
│   ├── skills/                  # 127 skill (Claude Code native)
│   └── settings.json            # Hooks + MCP konfigürasyonu
└── docs/
    ├── architecture.md          # Sistem diyagramları (Mermaid)
    ├── skill-catalog.md         # 127 skill tam kataloğu
    ├── agents.md                # 38 subagent referansı
    ├── hooks.md                 # Hook sistemi referansı
    └── mcp.md                   # MCP server referansı
```

---

## Agentlar (38)

### Teknik

| Agent | Görev | Model |
|---|---|---|
| `backend-specialist` | .NET 10, EF Core, CQRS | Sonnet 4.6 |
| `frontend-developer` | React 19+, TypeScript, Core Web Vitals | Sonnet 4.6 |
| `mobile-ios-swift` | Swift 6, SwiftUI, watchOS | Sonnet 4.6 |
| `database-optimizer` | PostgreSQL 17, EF Core migration, query optimizasyonu | Sonnet 4.6 |
| `devops-engineer` | CI/CD, Docker, K8s, IaC | Sonnet 4.6 |
| `gis-web-developer` | Harita, güzergah planlama, gerçek zamanlı konum takibi | Sonnet 4.6 |
| `integrations-webhook-specialist` | Webhook, event-driven entegrasyon | Sonnet 4.6 |

### Kalite & Güvenlik

| Agent | Görev | Model |
|---|---|---|
| `code-reviewer` | PR review, kod kalite denetimi | Sonnet 4.6 |
| `test-engineer` | Unit/Integration/E2E, TDD | Sonnet 4.6 |
| `testing-qa-engineer` | Test senaryosu, edge case tasarımı | Sonnet 4.6 |
| `testing-test-strategist` | Test stratejisi, piramit, araç seçimi | Sonnet 4.6 |
| `security-specialist` | OWASP, pentest, JWT, STRIDE, AI kod denetimi | Sonnet 4.6 |
| `security-secrets-engineer` | Secret yönetimi, credential sızıntı önleme | Sonnet 4.6 |
| `security-compliance-auditor` | GDPR, App Store gizlilik uyumu | Sonnet 4.6 |
| `security-ai-code-auditor` | AI üretimi kod güvenlik denetimi | Sonnet 4.6 |
| `incident-response` | Prodüksiyon olayı, SEV sınıflandırması, postmortem | Sonnet 4.6 |

### Ürün & Tasarım

| Agent | Görev | Model |
|---|---|---|
| `product-manager` | PRD, roadmap, özellik kararı | Sonnet 4.6 |
| `product-sprint-prioritizer` | Sprint planı, backlog önceliklendirme | Sonnet 4.6 |
| `product-feedback-synthesizer` | Kullanıcı geri bildirimi analizi | Sonnet 4.6 |
| `design-ui-designer` | UI tasarımı, komponent hiyerarşisi | Sonnet 4.6 |
| `design-ux-architect` | Kullanıcı akışı, bilgi mimarisi | Sonnet 4.6 |
| `design-ux-researcher` | Kullanıcı araştırması, test senaryoları | Sonnet 4.6 |
| `design-ui-finish-gate-reviewer` | Ekran yayın kalite kontrolü | Sonnet 4.6 |
| `design-brand-guardian` | Marka tutarlılığı denetimi | Sonnet 4.6 |
| `design-persona-walkthrough` | Persona bazlı UX walkthrough | Sonnet 4.6 |

### Proje & Strateji

| Agent | Görev | Model |
|---|---|---|
| `project-manager-senior` | Sprint planı, risk yönetimi, timeline | Sonnet 4.6 |
| `meeting-notes-specialist` | Toplantı notları, aksiyon maddeleri | Sonnet 4.6 |
| `strategy-business-strategist` | Büyüme stratejisi, monetizasyon, rekabet | Sonnet 4.6 |
| `strategy-okr-coach` | OKR yazımı, quarter planlaması | Sonnet 4.6 |
| `research-synthesizer` | Araştırma sentezi, kaynak analizi | Sonnet 4.6 |

### Pazarlama & Destek

| Agent | Görev | Model |
|---|---|---|
| `marketing-content-strategist` | İçerik stratejisi, App Store metni, release notes | Sonnet 4.6 |
| `marketing-seo-specialist` | ASO, web SEO, anahtar kelime analizi | Sonnet 4.6 |
| `marketing-copywriter` | Pazarlama kopyası, onboarding metni, CTA | Sonnet 4.6 |
| `support-technical-support` | Kullanıcı teknik sorun çözme, FAQ | Sonnet 4.6 |
| `support-customer-support` | App Store yorum yanıtı, şikayet yönetimi | Sonnet 4.6 |
| `technical-writer` | API dokümantasyonu, README, developer guide | Sonnet 4.6 |

### Karar Destek

| Agent | Görev | Model |
|---|---|---|
| `specialized-reality-checker` | Plan/fikir gerçeklik kontrolü, varsayım sorgulama | Sonnet 4.6 |
| `specialized-focus-manager` | Çok proje önceliklendirme, odak koruma | Sonnet 4.6 |

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
| [Agents](docs/agents.md) | 38 subagent detaylı referansı |
| [Hooks](docs/hooks.md) | Hook sistemi kullanım kılavuzu |
| [MCP](docs/mcp.md) | MCP server kurulum ve referans |

---

## agency-agents ile Fark

| | `agency-agents` | `claude-agency` |
|---|---|---|
| **Hedef** | Cursor, Windsurf, Claude Code, Cline, Gemini... | Yalnızca Claude Code |
| **Agent tipi** | Persona prompt (araç erişimi yok) | Native subagent (gerçek araç erişimi) |
| **Hooks** | Yok | 4 hook — tool-call seviyesinde blok/uyarı |
| **Quality gates** | Yok | 20 gate — her oturumda aktif |
| **MCP** | Yok | 4 server |
| **Kaynak** | agency-agents koleksiyonundan ilham alındı | claude-agency native formatına dönüştürüldü |
