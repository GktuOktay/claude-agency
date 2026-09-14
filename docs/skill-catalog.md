# Skill Kataloğu

127 skill, 4 kategoride. `alwaysApply: true` olanlar her oturumda aktiftir.

---

## 🔴 Gates — Her Zaman Aktif (20 skill)

Kalite kapıları — kod yazılmadan önce otomatik devreye girer, itiraz edilemez.

| Skill | Görev |
|---|---|
| `audit-trail-guardian-gate` | DB tablolarında `CreatedBy`, `ModifiedAt` zorunlu |
| `chaos-adversarial-gate` | Network timeout, 503, null input senaryoları zorunlu |
| `critical-critique-gate` | Her çözümde alternatif + risk analizi zorunlu |
| `ddd-ubiquitous-language-gate` | Domain dili tutarlılığı — her entity tek isimde |
| `escalation-workflow` | Kritik karar noktalarında kullanıcıya eskalasyon |
| `fail-fast-config-gate` | Uygulama başlangıcında tüm config doğrulama |
| `finite-state-machine-gate` | Kritik durum geçişleri FSM ile — `if/else` yasak |
| `graceful-degradation-gate` | Bağımlı servis düştüğünde fallback zorunlu |
| `llm-hallucination-firewall-gate` | LLM çıktısını doğrulamadan parse etme yasak |
| `main-thread-and-performance-gate` | UI thread blocking operasyonlar yasak |
| `master-orchestrator` | Tüm alt orkestratörlerin ana koordinatörü |
| `outbox-pattern-enforcer` | Event yayınlama — outbox pattern zorunlu |
| `pre-flight-security-gate` | Kod öncesi güvenlik blueprint denetimi |
| `privacy-pii-masking-gate` | Şifre, TCKN, kredi kartı loglama yasak |
| `problem-details-gate` | RFC 7807 Problem Details formatı zorunlu |
| `stateless-architecture-gate` | Server-side session yasak — JWT zorunlu |
| `tenant-isolation-gate` | SaaS'da explicit `TenantId` filtresi zorunlu |
| `timezone-enforcer-gate` | `DateTimeOffset.UtcNow` zorunlu — `DateTime.Now` yasak |
| `update-changelog-workflow` | Her değişiklikte CHANGELOG güncelleme |
| `validation-and-integrity-gate` | 3-tier validation: DB → FluentValidation → Client |

---

## 🎼 Orchestrators (10 skill)

Görevleri alır, alt skill'lere ve subagent'lara delege eder. Kendisi kod yazmaz.

| Skill | Görev |
|---|---|
| `ba-orchestrator` | İş analizi → EARS gereksinim → teknik şema |
| `code-orchestrator` | Kod geliştirme koordinasyonu |
| `deployment-orchestrator` | Release ve deploy yönetimi |
| `design-orchestrator` | UI/UX tasarım koordinasyonu |
| `docs-orchestrator` | Dokümantasyon üretim koordinasyonu |
| `git-orchestrator` | Branch, PR, merge stratejisi |
| `marketing-orchestrator` | Pazarlama içerik koordinasyonu |
| `project-bootstrap-orchestrator` | Yeni proje kurulumu |
| `security-orchestrator` | Güvenlik analizi koordinasyonu |
| `test-orchestrator` | Test stratejisi ve koordinasyonu |

---

## 🔧 Specialists (96 skill)

Talep üzerine tetiklenir. Domain uzmanlığı gerektiren görevler.

### Backend & Data
| Skill | Görev |
|---|---|
| `dotnet-enterprise-architect` | .NET 10 Clean Architecture, CQRS, MediatR |
| `db-architect-security` | DB tasarımı, RLS, güvenli şema |
| `schema` | DB şema tasarımı ve migration |
| `cache-invalidation-architect` | Cache stratejisi ve invalidation |
| `distributed-saga-manager` | Distributed transaction ve saga pattern |
| `outbox-pattern-enforcer` | Event-driven outbox implementasyonu |
| `edge-and-gateway-architect` | API Gateway, rate limiting, reverse proxy |
| `circuit-breaker-specialist` | Resilience pattern, Polly |
| `legacy-code-migrator-specialist` | Eski kod modernizasyonu |
| `concurrency-and-memory-profiler` | Thread safety, memory leak analizi |
| `correlation-id-specialist` | Distributed tracing, request correlation |
| `document-and-asset-manager` | Dosya yönetimi, storage stratejisi |

### Security & Pentest
| Skill | Görev |
|---|---|
| `master-pentester` | Tam kapsamlı güvenlik testi koordinatörü |
| `api-pentest` | API endpoint güvenlik testi |
| `api-security-with-owasp-top-10-pentester` | OWASP API Top 10 sistematik testi |
| `api-authentication-weaknesses-pentester` | Auth mekanizması zayıflık testi |
| `api-for-broken-object-level-authorization-pentester` | BOLA/IDOR testi |
| `api-for-mass-assignment-vulnerability-pentester` | Mass assignment zafiyeti |
| `cors-misconfiguration-pentester` | CORS yanlış konfigürasyonu testi |
| `csrf-attack-simulation-specialist` | CSRF saldırı simülasyonu |
| `for-broken-access-control-pentester` | Kırık erişim kontrolü testi |
| `for-json-web-token-vulnerabilities-pentester` | JWT zafiyet testi |
| `for-xss-vulnerabilities-pentester` | XSS zafiyet testi |
| `graphql-security-assessment-specialist` | GraphQL güvenlik değerlendirmesi |
| `jwt-token-security-pentester` | JWT implementasyon güvenliği |
| `mobile-api-authentication-pentester` | Mobil API auth testi |
| `oauth2-implementation-flaws-pentester` | OAuth2 implementasyon hataları |
| `client-security` | Frontend güvenlik kontrolleri |
| `recon-specialist` | Keşif ve saldırı yüzeyi analizi |
| `secret-scanner` | Kod içi sır/anahtar taraması |
| `secret-scanning-with-gitleaks-specialist` | Gitleaks ile git geçmişi tarama |
| `secrets-scanning-in-ci-cd-specialist` | CI/CD pipeline sır taraması |
| `sca-dependency-scanning-with-snyk-specialist` | Bağımlılık güvenlik taraması |

### DevOps & Cloud
| Skill | Görev |
|---|---|
| `ci-cd-engineer` | GitHub Actions, pipeline tasarımı |
| `cloud-deployer` | AWS/Azure/GCP deployment |
| `container-master` | Docker, container optimizasyonu |
| `scanning-containers-with-trivy-in-cicd` | Container image güvenlik taraması |
| `iac-architect` | Terraform, Bicep, IaC tasarımı |
| `gitops-manager` | GitOps workflow ve ArgoCD |
| `zero-downtime-deployment-strategist` | Blue-green, rolling deployment |
| `finops-architect` | Cloud maliyet optimizasyonu |
| `observability-setup` | Logging, tracing, metrics kurulumu |

### Frontend & Design
| Skill | Görev |
|---|---|
| `design-orchestrator` | UI/UX koordinasyonu |
| `high-end-visual-design` | Premium görsel tasarım |
| `apple-design` | iOS/macOS HIG uyumlu tasarım |
| `ui-animation` | Animasyon ve geçiş tasarımı |
| `image-to-code-tool` | Görsel → kod dönüşümü |
| `pick-ui-library` | UI kütüphane seçimi ve karşılaştırması |
| `a11y-and-i18n-engineer` | Erişilebilirlik (WCAG) ve i18n |
| `mobile-flutter-swift-architect` | Flutter/Swift mimari |
| `swift-architecture-auditor` | Swift kod mimari denetimi |
| `main-thread-and-performance-gate` | UI thread performans kontrolü |
| `prototype` | Hızlı prototip üretimi |

### API & Documentation
| Skill | Görev |
|---|---|
| `api-documentation-architect` | Swagger/OpenAPI dokümantasyon |
| `api-versioning-architect` | Breaking change koruması |
| `api-handoff-workflow` | Backend → Frontend teslim süreci |
| `swagger-and-xml-doc-gate` | XML dokümantasyon zorunluluğu |
| `docs-orchestrator` | Dokümantasyon üretim koordinasyonu |

### Testing
| Skill | Görev |
|---|---|
| `e2e-tester` | E2E test yazımı (Playwright) |
| `unit-test-architect` | Unit test mimarisi |
| `test-driven-development-gate` | TDD zorunluluğu |
| `performance-tester` | Yük ve performans testi (k6) |

### Workflows & Tools
| Skill | Görev |
|---|---|
| `git-conventional-commits-workflow` | Conventional Commits zorunluluğu |
| `git-pr-reviewer` | PR review otomasyonu |
| `git-issue-manager` | Issue yönetimi |
| `git-repo-setup-workflow` | Yeni repo kurulum akışı |
| `generate-standup-workflow` | Günlük standup raporu |
| `update-changelog-workflow` | CHANGELOG otomasyonu |
| `escalation-workflow` | Kritik karar eskalasyonu |
| `caveman-optimizer` | Token sıkıştırma, Conventional Commits |
| `make-plan` | Görev planlaması |
| `plan-mode` | Büyük görevlerde plan → onay → uygula |
| `codebase-explorer-tool` | Kod tabanı keşfi |
| `graphify-tool` | Mermaid diyagram üretimi |
| `forensic-detective` | Hata kök neden analizi |
| `blast-radius-specialist` | Değişiklik etki alanı hesaplama |
| `tech-debt-collector` | Teknik borç tespiti ve önceliklendirme |

### Business & Strategy
| Skill | Göre |
|---|---|
| `ba-architect` | İş gereksinimleri → teknik şema |
| `ba-elicitor` | EARS gereksinim analizi |
| `tech-business-analyst` | Teknik iş analizi |
| `feature-ideator` | Özellik fikir üretimi |
| `product-designer` | Ürün tasarım stratejisi |
| `product-marketer` | Ürün pazarlama |
| `copywriting` | İçerik yazımı |
| `brandkit` | Marka kimliği yönetimi |
| `marketing-orchestrator` | Pazarlama koordinasyonu |
| `technical-seo-architect` | Teknik SEO mimarisi |

---

## 🧠 Meta (1 skill)

| Skill | Görev |
|---|---|
| `plan-mode` | 3+ dosya/mimari değişiklikte otomatik plan → onay → uygula döngüsü |
