# 🏗️ Claude Agency

🌐 [English](README.md) · **Türkçe**

> Claude Code için kurumsal düzeyde çoklu ajan (multi-agent) orkestrasyonu.  
> **139 uzman becerisi**, 38 alt ajan, kancalara (hook) dayalı kalite geçitleri ve MCP entegrasyonu.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Skills](https://img.shields.io/badge/Skills-139-green.svg)](docs/skill-catalog.md)
[![Agents](https://img.shields.io/badge/Agents-38-orange.svg)](docs/agents.md)

## Bu Nedir?

Claude Agency, Claude Code'u genel amaçlı bir asistandan, hiyerarşik bir beceri sistemi tarafından yönetilen **38 uzman alt ajandan** oluşan bir ekibe dönüştürür. Her şeyi tek bir yapay zekanın yapması yerine, her görevi en uygun uzman ele alır.

## ⚡ Hızlı Başlangıç

```bash
git clone https://github.com/GktuOktay/claude-agency.git
cd claude-agency
./setup.sh   # İnteraktif: model seçimi + MCP yapılandırması
claude       # Claude Code'u başlat
```

`setup.sh` şunları yönetir:
1. **Model seçimi** — Sonnet 4.6 / Opus 5 / Hibrit (Güvenlik+Backend → Opus)
2. **MCP aktivasyonu** — PostgreSQL, Filesystem, Brave Search, Playwright
3. **Ortam kurulumu** — API anahtarları ve bağlantı dizeleri

## 🏛️ Mimari

```mermaid
flowchart TD
    User([Kullanıcı İsteği]) --> CLAUDE_MD[CLAUDE.md Delegasyon Kuralları]
    
    CLAUDE_MD -->|Görevi Değerlendir| Decision{Delegasyon Eşiği Aşıldı mı?}
    Decision -->|Hayır| Claude[Claude Genel]
    Decision -->|Evet| OrchestratorLayer
    
    subgraph OrchestratorLayer [Orkestratör Katmanı (11 Orkestratör)]
        master[Master Orkestratör]
        code[Code Orkestratör]
        security[Security Orkestratör]
        test[Test Orkestratör]
        design[Design Orkestratör]
        deployment[Deployment Orkestratör]
        git[Git Orkestratör]
        docs[Docs Orkestratör]
        ba[BA Orkestratör]
        marketing[Marketing Orkestratör]
        project[Project Bootstrap Orkestratör]
    end
    
    OrchestratorLayer --> SpecialistLayer
    
    subgraph SpecialistLayer [Uzman Katmanı (38 Uzman)]
        Backend[Backend Uzmanları]
        Frontend[Frontend Uzmanları]
        Mobile[Mobil Uzmanlar]
        SecuritySpec[Güvenlik Uzmanları]
        DevOps[DevOps Uzmanları]
        DesignSpec[Tasarım Uzmanları]
        Product[Ürün Uzmanları]
        Strategy[Strateji ve Destek]
    end
    
    SpecialistLayer --> QualityGates
    
    subgraph QualityGates [Kalite Geçitleri (28 Geçit)]
        TDD[TDD Geçidi]
        AntiSycophancy[Dalkavukluk Önleyici]
        PII[PII Maskeleme]
        Hallucination[Halüsinasyon Güvenlik Duvarı]
        Logging[Yapılandırılmış Günlükleme]
        SecurityScan[Güvenlik Denetimleri]
    end
    
    QualityGates --> Output([Nihai Çıktı Teslimi])
```

## 📦 İçinde Neler Var?

### Beceriler (139)

| Kategori | Sayı | Örnekler |
|---|---|---|
| 🎼 Orkestratörler | 11 | master, code, security, test, design, deployment, git, docs, ba, marketing, project-bootstrap |
| 🔧 Uzmanlar | ~55 | dotnet-enterprise, swift-architecture, clean-code, db-architect, graphify, caveman, humanizer |
| 🚦 Kalite Geçitleri | 28 | TDD gate, PII masking, anti-sycophancy, hallucination firewall, structured logging |
| 🛡️ Güvenlik ve Pentest | ~21 | OWASP top 10, JWT vulns, XSS, CORS, CSRF, OAuth2 flaws, mass assignment |
| ⚙️ İş Akışları ve Araçlar | ~24 | API handoff, standup generator, changelog, caveman compress, skill creator |

→ [Tam katalog: docs/skill-catalog.md](docs/skill-catalog.md)

### Alt Ajanlar (38)

| Alan | Ajanlar |
|---|---|
| Teknik | backend-specialist, frontend-developer, mobile-ios-swift, database-optimizer, devops-engineer, gis-web-developer, integrations-webhook-specialist |
| Kalite & Güvenlik | code-reviewer, test-engineer, testing-qa-engineer, testing-test-strategist, security-specialist, security-secrets-engineer, security-compliance-auditor, security-ai-code-auditor, incident-response |
| Ürün & Tasarım | product-manager, product-sprint-prioritizer, product-feedback-synthesizer, design-ui-designer, design-ux-architect, design-ux-researcher, design-ui-finish-gate-reviewer, design-brand-guardian, design-persona-walkthrough |
| Strateji & Destek | project-manager-senior, meeting-notes-specialist, strategy-business-strategist, strategy-okr-coach, research-synthesizer, marketing-content-strategist, marketing-seo-specialist, marketing-copywriter, support-technical-support, support-customer-support, technical-writer, specialized-focus-manager, specialized-reality-checker |

→ [Tam referans: docs/agents.md](docs/agents.md)

## 🔄 Nasıl Çalışır?

1. **İstek gelir** → `CLAUDE.md` delegasyon kuralları görevi değerlendirir
2. **Delegasyon eşiği** — Eğer 3+ dosya, yeni modül, alan uzmanlığı veya 10+ dakikalık bir görevse → delege et
3. **Orkestratör aktifleşir** → Görevi doğru uzmana yönlendirir
4. **Uzman çalıştırır** → Yalnızca uzmanlar kod yazar (orkestratörler asla kod yazmaz)
5. **Kalite geçitleri denetler** → TDD, güvenlik, günlükleme, dalkavukluk önleyici kontroller
6. **Çıktı teslim edilir** → Dürüst, laf kalabalığı olmayan yanıt (dalkavukluk önleyici zorunludur)

## 🔧 Yapılandırma

### MCP Sunucuları (İsteğe Bağlı)
- **PostgreSQL** — Halüsinasyonu önlemek için canlı veritabanı şemasını okur
- **Filesystem** — Dosya sistemi erişimi
- **Brave Search** — Web arama yeteneği
- **Playwright** — Uçtan uca (E2E) test ve web kazıma (scraping)
- **MS Learn** — Microsoft belgeleri (her zaman aktif)

### Kanca (Hook) Sistemi
- Yazma öncesi kalite kontrolleri
- Yazma sonrası linting (kod denetimi)
- Bildirim sistemi

→ [Detaylar: docs/hooks.md](docs/hooks.md) · [MCP: docs/mcp.md](docs/mcp.md)

## 🌍 Temel Prensipler

- **Dalkavukluk önleyici** — Övgü spam'i yok, özür dilemek yok, dolgu maddesi yok. Kötü kararlara meydan okur.
- **Sıfır varsayım** — Belirsiz görev? Dur ve en fazla 2-3 Sokratik soru sor.
- **Güvenlik paranoyası** — Tüm dış girdiler aksi kanıtlanana kadar zararlıdır.
- **DRY (Kendini Tekrar Etme) zorunluluğu** — Yeni kod yazmadan önce mevcut soyutlamalar için kod tabanını tara.
- **Bilimsel hata ayıklama** — Logları analiz et → hipotez kur → hedeflenmiş düzeltme yap. Deneme yanılma yok.

## 📚 Dokümantasyon

| Belge | İçerik |
|---|---|
| [architecture.md](docs/architecture.md) | Sistem diyagramları (Mermaid) |
| [agents.md](docs/agents.md) | 38 alt ajan referansı |
| [skill-catalog.md](docs/skill-catalog.md) | 139 becerinin tam kataloğu |
| [hooks.md](docs/hooks.md) | Kanca (Hook) sistemi referansı |
| [mcp.md](docs/mcp.md) | MCP sunucu yapılandırması |
| [flow-diagram.md](docs/flow-diagram.md) | Detaylı akış diyagramları |

## 🤝 Katkıda Bulunma

Kurallar için [CONTRIBUTING.md](CONTRIBUTING.md) dosyasına bakın.

## 📄 Lisans

MIT — detaylar için [LICENSE](LICENSE) dosyasına bakın.
