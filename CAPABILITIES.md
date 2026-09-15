# Claude Agency — Yetenekler ve Akışlar

> Son güncelleme: 2026-09-15

## İçindekiler

- [Sistem Mimarisi](#sistem-mimarisi)
- [Subagentlar](#subagentlar)
- [Delegation Akışı](#delegation-akışı)
- [Hook'lar](#hooklar)
- [Quality Gates](#quality-gates)
- [MCP Serverlar](#mcp-serverlar)
- [Skill Kataloğu](#skill-kataloğu)
- [Graphify](#graphify)
- [Kurulum](#kurulum)
- [Reddedilen Yaklaşımlar](#reddedilen-yaklaşımlar)

---

## Sistem Mimarisi

```
Kullanıcı İsteği
      │
      ▼
┌─────────────────────────────────────────┐
│  Claude Code Runtime                    │
│  CLAUDE.md (persona + delegasyon kuralı)│
│  .claude/settings.json (hooks + MCP)    │
└────────────┬────────────────────────────┘
             │
      ┌──────▼──────┐
      │  PreToolUse  │  ← DateTime.Now / rm -rf / .Result → BLOK
      │     Hook     │  ← hardcoded secret → UYARI
      └──────┬──────┘
             │
      ┌──────▼──────────────────┐
      │  Quality Gates (20x)    │  ← alwaysApply: true, her oturumda aktif
      └──────┬──────────────────┘
             │
      ┌──────▼──────────────────┐
      │  Subagent Delegasyon    │  ← eşik aşıldıysa
      │  backend / security /   │
      │  test / devops / review │
      └──────┬──────────────────┘
             │
      ┌──────▼──────┐
      │PostToolUse  │  ← .cs yazıldı → dotnet build hatırlatması
      │   Hook      │
      └─────────────┘
```

---

## Subagentlar

Tüm subagentlar `claude-sonnet-4-6` kullanır. `.claude/agents/` altında tanımlı.

### backend-specialist

**Uzmanlık:** .NET 10, EF Core, CQRS, MediatR, Clean Architecture, domain modeli, migration, repository pattern  
**Araçlar:** `Read`, `Edit`, `Write`, `Bash`, `Glob`, `Grep`  
**Ne zaman çağrılır:** Yeni entity / servis / modül ekleme, EF migration, CQRS handler yazma

### security-specialist

**Uzmanlık:** OWASP Top 10, JWT yapılandırma, API pentest, CVE araştırma  
**Araçlar:** `Read`, `Bash`, `WebSearch`, `WebFetch`  
**Fix sırası:** KRİTİK → YÜKSEK → ORTA → DÜŞÜK  
**Ne zaman çağrılır:** Güvenlik açığı analizi, JWT/auth config review, bağımlılık güvenlik taraması

**JWT zorunlu kuralları:**
- `ValidateIssuer`, `ValidateAudience`, `ValidateLifetime`, `ValidateIssuerSigningKey` → hepsi `true`
- Key `< 32 karakter` → startup'ta `throw`
- Key secrets/env'den okunmalı, hardcoded yasak

### test-engineer

**Uzmanlık:** xUnit, FluentValidation, TestContainers, TDD, Unit/Integration/E2E  
**Araçlar:** `Read`, `Edit`, `Write`, `Bash`, `Agent`  
**Ne zaman çağrılır:** Test coverage artırma, test stratejisi, CI test pipeline

**xUnit versiyon kuralı:** `xunit` ve `xunit.runner.visualstudio` aynı major.minor olmalı. Karışık versiyon (ör. xunit 2.x + runner 3.x) → `xunit.abstractions` yükleme hatası.

```xml
<PackageReference Include="xunit" Version="2.9.3" />
<PackageReference Include="xunit.runner.visualstudio" Version="2.9.3" />
<PackageReference Include="Microsoft.NET.Test.Sdk" Version="17.12.0" />
```

### devops-engineer

**Uzmanlık:** Dockerfile (alpine, non-root), GitHub Actions, Trivy security scan, docker-compose sertleştirme  
**Araçlar:** `Read`, `Edit`, `Write`, `Bash`  
**Ne zaman çağrılır:** CI/CD kurulumu, container image optimizasyonu, deployment pipeline

**Dockerfile standartları:**
```dockerfile
FROM mcr.microsoft.com/dotnet/aspnet:9.0-alpine AS final
RUN addgroup -S appgroup && adduser -S appuser -G appgroup -u 1001
USER appuser
```

**Zorunlu `.dockerignore`:** `appsettings.Development.json`, `**/.git`, `**/bin`, `**/obj`, `.env*`

### code-reviewer

**Uzmanlık:** Read-only kod kalite denetimi — doğruluk, güvenlik, performans, mimari, sürdürülebilirlik  
**Araçlar:** `Read`, `Bash`  
**Ne zaman çağrılır:** PR öncesi review, mimari karar noktası

**.NET review checklist:**

| # | Kontrol |
|---|---------|
| 1 | `CreatedAtAction` → GET action referansı (POST değil) |
| 2 | `ModifiedAt` → `DateTimeOffset?` (nullable, 0001-01-01 bug'ı) |
| 3 | JWT key runtime uzunluk kontrolü (< 32 → throw) |
| 4 | CORS boş liste → production'da throw |
| 5 | DataAnnotations sadece MVC model binding; MediatR için `IPipelineBehavior` zorunlu |
| 6 | `IAuditableEntity` init-only setter'lar |
| 7 | Domain entity domain metotları (`Confirm()`, `Cancel()`) |
| 8 | `TimeProvider` enjeksiyonu (`DateTimeOffset.UtcNow` doğrudan kullanım testlerde flaky) |
| 9 | Concurrency testi `Task.WhenAll` ile |

---

## Delegation Akışı

Aşağıdakilerden **biri** varsa doğrudan yanıtlama, subagent'a ilet:

| Koşul | Örnek |
|---|---|
| 3+ dosya değişikliği | Yeni modül ekleme |
| Yeni servis / katman / modül | Domain entity + repository + handler |
| Domain-specific uzmanlık | Güvenlik açığı, test stratejisi, infra |
| Tahminen 10+ dakika | CI pipeline kurulumu |

```
Görev Geldi
    │
    ├─ Eşik aşılmadı → Doğrudan yanıtla
    │
    └─ Eşik aşıldı ──► Hangi agent?
          │
          ├─ .NET backend kodu          → backend-specialist
          ├─ Güvenlik / OWASP / JWT     → security-specialist
          ├─ Test / TDD / coverage      → test-engineer
          ├─ Docker / CI / K8s          → devops-engineer
          └─ Kod review / PR            → code-reviewer
```

---

## Hook'lar

Hook'lar `.claude/settings.json` içinde tanımlı. 2026-09-14'te 8/8 senaryoda doğrulandı.

### PreToolUse[Bash] — BLOK (exit 1)

Komut aşağıdaki pattern'lardan birini içeriyorsa çalıştırılmaz:

| Pattern | Neden |
|---|---|
| `DateTime.Now[^O]` | Timezone-unsafe; `DateTimeOffset.UtcNow` kullan |
| `rm -rf` | Geri alınamaz silme |
| `DROP TABLE` | Veri kaybı riski |
| `Thread\.Sleep` | Blocking; `await Task.Delay` kullan |
| `\.(Result\|Wait)\b` | Sync-over-async deadlock riski |

### PreToolUse[Write\|Edit] — UYARI (stderr)

Dosya içeriği aşağıdaki pattern'ları içeriyorsa uyarı verilir:

| Pattern | Neden |
|---|---|
| `DateTime.Now` | Timezone-unsafe |
| `(password\|secret\|apikey\|api_key\|token)\s*=\s*"[^"]+"` | Hardcoded credential |
| `Password=[^;>"]+` | Connection string'de hardcoded şifre |
| `Thread\.Sleep` | Blocking |
| `\.(Result\|Wait)\b` | Sync-over-async |

### PreToolUse[Bash\|Grep] — Graphify guard

Arama öncesi knowledge graph kontrol edilir (graphify kuruluysa).

### PostToolUse[Write\|Edit]

`.cs` dosyası yazıldığında `dotnet build` hatırlatması.

### Stop

Oturum kapandığında stderr bildirimi.

---

## Quality Gates

`.claude/skills/gates/` altında, `alwaysApply: true` — her oturumda otomatik aktif.

| Gate | Kural |
|---|---|
| `audit-trail-guardian` | DB tabloları → `CreatedBy`, `ModifiedAt` zorunlu |
| `timezone-enforcer` | `DateTimeOffset.UtcNow` zorunlu; `DateTime.Now` yasak |
| `privacy-pii-masking` | Şifre, TCKN, kredi kartı loglama yasak |
| `tenant-isolation` | SaaS → explicit `TenantId` filtresi zorunlu |
| `pre-flight-security` | Kod öncesi güvenlik blueprint denetimi |
| `fail-fast-config` | Startup'ta tüm config doğrulama |
| `validation-and-integrity` | DB constraints → FluentValidation → Client (3 katman) |
| `stateless-architecture` | Server-side session yasak; JWT zorunlu |
| `problem-details` | RFC 7807 hata formatı zorunlu |
| `finite-state-machine` | Kritik durum geçişleri FSM; loose if/else yasak |
| `outbox-pattern-enforcer` | Event yayınlama → outbox pattern zorunlu |
| `ddd-ubiquitous-language` | Domain dili tutarlılığı; her entity tek isim |
| `structured-logging-audit` | Async exception log; immutable audit trail |
| `chaos-adversarial` | Network timeout, 503, null input senaryoları zorunlu |
| `graceful-degradation` | Bağımlı servis düşerse fallback zorunlu |
| `llm-hallucination-firewall` | LLM çıktısını doğrulamadan parse etme yasak |
| `main-thread-and-performance` | UI thread blocking yasak |
| `critical-critique` | Her çözümde alternatif + risk analizi |
| `update-changelog` | Her değişiklikte CHANGELOG güncelleme |
| `escalation-workflow` | Kritik karar noktasında kullanıcıya eskalasyon |

---

## MCP Serverlar

`.claude/settings.json` → `mcpServers` altında tanımlı.

| Server | Amaç | Gereksinim |
|---|---|---|
| `microsoft-learn` | .NET 10, EF Core, ASP.NET Core resmi docs | — |
| `playwright` | E2E test, browser otomasyon, web scraping | — |
| `postgres` | DB schema okuma, query, migration kontrolü | `POSTGRES_CONNECTION_STRING` env |
| `filesystem` | Proje dışı dizin erişimi | `PROJECT_ROOT` env |
| `brave-search` | CVE araştırma, web arama | `BRAVE_API_KEY` env |

Env değişkenleri `setup.sh` çalıştırıldığında `.env` dosyasına yazılır.

---

## Skill Kataloğu

`.claude/skills/` altında 139 skill. Claude Code'un native skill sistemi.

### Quality Gates (20 skill)
`alwaysApply: true` — her oturumda prompt bağımsız aktif. Bkz. [Quality Gates](#quality-gates).

### Orchestrators (18 skill)

| Skill | Tetikleyici | Ne yapar |
|---|---|---|
| `plan-mode` | `/plan-mode` | Native `EnterPlanMode`/`ExitPlanMode` tool çağrısı |
| `cavecrew` | `/cavecrew` | Paralel subagent orkestrasyonu |
| `api-handoff` | `/api-handoff` | API boundary geçişlerini yönetir |
| `master-orchestrator` | alwaysApply | Delegasyon kararlarını denetler |

### Domain Specialists (62 skill)

`.NET`, `API`, `güvenlik`, `test`, `DevOps` kategorilerinde. Örnekler:
- `dotnet-clean-architecture` — proje iskelet kurulumu
- `fluentvalidation-pipeline` — MediatR ValidationBehaviour ekleme
- `jwt-auth-setup` — JWT Bearer yapılandırması
- `ef-migration-workflow` — EF Core migration akışı
- `docker-alpine-build` — non-root alpine Dockerfile

### Meta / Caveman (39 skill)

| Skill | Ne yapar |
|---|---|
| `caveman` | Token tasarrufu modu |
| `compress` | Yanıt sıkıştırma |
| `graphify` | Knowledge graph üretimi ve sorgusu |
| `commit` | Conventional commits formatı |
| `stats` | Oturum istatistikleri |

### plan-mode akışı

```
/plan-mode tetiklendi
      │
      ▼
EnterPlanMode tool çağrısı  ← native Claude Code tool
      │
      ▼
Plan taslağı gösterilir
      │
      ▼
Kullanıcı onayı beklenir
      │
      ▼
ExitPlanMode tool çağrısı   ← onay sonrası
      │
      ▼
Uygulama başlar
```

---

## Graphify

`graphify v0.9.54` — AST tabanlı knowledge graph. `.claude/skills/graphify/` altında skill tanımlı.

### Komutlar

| Komut | Açıklama | API Key |
|---|---|---|
| `graphify . --code-only` | AST bazlı graph, sadece kod dosyaları | Gereksiz |
| `graphify .` | Kod + doc + PDF | `ANTHROPIC_API_KEY` gerekli |
| `graphify update .` | Incremental güncelleme | Gereksiz |
| `graphify query "soru"` | Doğal dil codebase sorusu | — |
| `graphify path "A" "B"` | İki sembol arası ilişki zinciri | — |
| `graphify explain "kavram"` | Modül/sınıf odaklı açıklama | — |

### Kullanım kuralları (CLAUDE.md'den)

1. Codebase sorusu geldiğinde önce `graphify query` — raw grep yerine
2. `graphify path` iki sembol arasındaki bağımlılık için
3. Broad analiz için `GRAPH_REPORT.md` değil, `query`/`path`/`explain` — token maliyeti çok daha düşük
4. Kod değişikliği sonrası `graphify update .` (AST-only, API maliyeti yok)

---

## Kurulum

```bash
git clone https://github.com/GktuOktay/claude-agency.git
cd your-project
cp -r claude-agency/.claude ./
cp claude-agency/CLAUDE.md ./
```

### setup.sh

İnteraktif kurulum scripti:

1. **Model seçimi** — Sonnet 4.6 (maliyet odaklı) / Opus 5 / Karma
2. **MCP aktivasyonu** — hangi serverların aktif olacağı
3. **`.env` oluşturma** — `POSTGRES_CONNECTION_STRING`, `BRAVE_API_KEY`, `PROJECT_ROOT`
4. **Playwright kurulumu** — `npx playwright install chromium`

```bash
bash setup.sh
```

### Graphify (opsiyonel)

```bash
npm install -g graphify-labs
graphify . --code-only   # API key gerektirmez
```

---

## Reddedilen Yaklaşımlar

| Yasak | Alternatif | Neden |
|---|---|---|
| `DateTime.Now` | `DateTimeOffset.UtcNow` | Timezone-unsafe |
| `task.Result` / `task.Wait()` | `await task` | Deadlock riski |
| `Thread.Sleep` | `await Task.Delay` | Thread blocking |
| Hardcoded secret/password | `IOptions<T>` + env var | Güvenlik |
| Mock DB test | TestContainers (real DB) | Mock/prod sapması |
| `latest` Docker tag | Semantic versioning | Reproducibility |
| DataAnnotations tek başına | `IPipelineBehavior` + FluentValidation | MediatR handler bypass |
| `CreatedAtAction(nameof(Create))` | `CreatedAtAction(nameof(GetById))` | REST 405 hatası |
| `DateTimeOffset` non-nullable `ModifiedAt` | `DateTimeOffset?` | 0001-01-01 epoch dönme |
| xUnit 2.x + runner 3.x karışık | Aynı major.minor | `xunit.abstractions` yükleme hatası |
| Doğrulanmamış LLM çıktısı parse | Schema validation | Hallucination riski |
| Truncation / placeholder yanıt | Tam çıktı | Kayıp bilgi |
