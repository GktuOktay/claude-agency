# Skill Kataloğu

> Sabit token yükünü düşük tutmak için skill'ler üç katmana ayrıldı. `python3 scripts/token-audit.py` güncel yükü ölçer.

| Katman | Adet | Yüklenme |
|---|---|---|
| Otomatik skill (model çağırabilir) | 14 | Sadece `name + description` her oturumda; gövde çağrılınca |
| Manuel skill (`disable-model-invocation`) | 16 | Hiç listelenmez; sadece `/<ad>` ile çalışır |
| Orkestratör referansı (`references/`) | 91 | Orkestratör ilgili dosyayı `Read` ile okuduğunda |
| Kurallar (`.claude/rules/`) | 2 | İlgili dosya tipi açıldığında (`*.cs`, `*.ts/tsx/js/dart`...) |

## Otomatik Skill'ler

| Skill | Açıklama |
|---|---|
| `ba-orchestrator` | İş analizi ve teknik sistem tasarımı ana yönlendiricisi. Karmaşık iş isteklerini EARS gereksinimlerine, Mermaid diyagramlarına ve teknik şemalara dönü |
| `caveman-commit` | Ultra-compressed commit message generator. Cuts noise from commit messages while preserving intent and reasoning. Conventional Commits format. Subject |
| `caveman-review` | Ultra-compressed code review comments. Cuts noise from PR feedback while preserving the actionable signal. Each comment is one line: location, problem |
| `caveman` | Ultra-compressed communication mode. Cuts output tokens 65% (measured) by speaking like caveman while keeping full technical accuracy. Supports intens |
| `code-orchestrator` | Kod yazma, güvenlik, eleştirel denetim, test ve mimari süreçlerini yöneten ana orkestratör. |
| `deployment-orchestrator` | Deployment, CI/CD, altyapı yönetimi (IaC) ve bulut süreçlerini yöneten ana orkestratör. Gerektiğinde alt skill'leri otomatik çağırır. |
| `design-orchestrator` | UI/UX tasarım, animasyon, görsel üretim ve frontend estetik süreçlerini yöneten orkestratör. |
| `docs-orchestrator` | Doküman ve dosya üretim süreçlerini yöneten orkestratör. PDF, Word, Excel, PowerPoint ve teknik analiz dokümanları üretir. |
| `git-orchestrator` | Git süreçlerini, commit standartlarını, issue ve PR yönetimini, repo kurallarını yöneten ana orkestratör. |
| `graphify` | Use for any question about a codebase, its architecture, file relationships, or project content — especially when graphify-out/ exists, where the ques |
| `marketing-orchestrator` | Ürün ve pazarlama metinleri, UI metinleri ve App Store lansman süreçlerini yöneten ana orkestratör. Gerektiğinde alt skill'leri otomatik çağırır. |
| `master-orchestrator` | Tüm alt orkestratörleri (Code, Design, Security, Test, Git, Docs) ve eleştirel denetim kapılarını tek noktadan yöneten ana sistem mimarı. |
| `security-orchestrator` | Siber güvenlik, sızma testleri, API güvenliği ve kod zafiyet taramalarını yöneten ana orkestratör. |
| `test-orchestrator` | Kapsamlı test stratejileri, birim testleri (unit), uçtan uca testler (E2E), performans ve yük testlerini yöneten ana orkestratör. |

## Manuel Skill'ler (slash ile)

| Skill | Açıklama |
|---|---|
| `/cavecrew` | Decision guide for delegating to caveman-style subagents. Tells the main thread WHEN to spawn `cavecrew-investigator` (locate code), `cavecrew-builder |
| `/caveman-optimizer` | Caveman özelliklerini tek noktada toplayan optimizasyon aracı (manuel). |
| `/caveman-compress` | Compress natural language memory files (CLAUDE.md, todos, preferences) into caveman format to save input tokens. Preserves all technical substance, co |
| `/caveman-help` | Quick-reference card for all caveman modes, skills, and commands. One-shot display, not a persistent mode. Trigger: /caveman-help, "caveman help", "wh |
| `/caveman-stats` | Show real token usage and estimated savings for the current session. Reads directly from the Claude Code session log — no AI estimation. Triggers on / |
| `/codebase-explorer-tool` | Büyük ve karmaşık kod tabanlarında akıllı gezinme, giriş noktalarını bulma ve yapıyı anlama taktikleri. |
| `/focus-budget-tool` | LLM bağlamı şiştiğinde, alakasız dosyaları bellekten temizleme kapasitesi. |
| `/humanizer-tool` | Rewrite AI-sounding text so it reads naturally without changing what it says. Use when editing or reviewing prose for inflated claims, sales language, |
| `/learn-codebase-tool` | Bilinmeyen veya büyük kod tabanlarını hızlıca anlama, analiz etme ve gezinme yeteneği. |
| `/make-plan` | Yazılım geliştirme projeleri için detaylı planlama ve görev dağılımı (breakdown) yeteneği. |
| `/mcp-builder-tool` | MCP (Model Context Protocol) sunucuları geliştirmek ve bağlamak için yetenek. |
| `/mentor-mode-tool` | teach-me tetikleyicisi geldiğinde alınan mimari kararın açıklamasını yapan eğitim aracı. |
| `/plan-mode` | 3+ dosya veya mimari değişiklik içeren görevlerde önce plan üretir, onay alır, sonra kod yazar. Büyük görevlerde otomatik tetiklenir. |
| `/project-bootstrap-orchestrator` | Yeni projelere başlarken CLI araçlarını kullanarak klasör mimarisini, Docker ve temel ayarları otomatik kuran orkestratör. |
| `/skill-creator-tool` | Yeni yetenekler (Skill) ve entegrasyonlar geliştirmek için yetenek. |
| `/smart-explore-tool` | Büyük ve karmaşık kod tabanlarında akıllı gezinme, giriş noktalarını bulma ve kod yapısını anlama taktikleri. |

## Orkestratör Referansları

Skill tool ile çağrılmaz; orkestratör `SKILL.md` içindeki tablodan ilgili dosyayı okur.

### `ba-orchestrator` (4)

| Referans | Açıklama |
|---|---|
| `references/ba-architect.md` | Netleşmiş iş gereksinimlerinden Mermaid akış diyagramları, Gherkin kabul kriterleri ve DB/API teknik şemaları üreten mimari dönüşüm yeteneği. |
| `references/ba-elicitor.md` | Muğlak iş fikirlerini ve taleplerini yapılandırılmış EARS (Easy Approach to Requirements Syntax) formatına çeviren gereksinim analiz yeteneği. |
| `references/feature-ideator.md` | Yeni ürün özellikleri, fikir geliştirme ve feature backlog oluşturmak için yetenek. |
| `references/tech-business-analyst.md` | Teknik iş analizi ve gereksinim dokümanı yazmak için kullanılan yetenek. |

### `code-orchestrator` (23)

| Referans | Açıklama |
|---|---|
| `references/a11y-and-i18n-engineer.md` | Ürünlerin en baştan çoklu dil (i18n) destekli ve ekran okuyuculara (WCAG) uygun erişilebilir olmasını sağlayan uzman. |
| `references/api-versioning-architect.md` | Eski istemcileri (client) bozacak Breaking Change değişikliklerini yasaklayan ajan. |
| `references/blast-radius-specialist.md` | Core dosyalara dokunulmadan önce projede nerelerin patlayacağını hesaplayacak ajan. |
| `references/cache-invalidation-architect.md` | Önbellek güncellendiğinde mutlaka tahliye (Invalidation) yapılmasını zorunlu kılan ajan. |
| `references/circuit-breaker-specialist.md` | Dış API çağrılarına zorla Polly ve Fallback mekanizması ekleten ajan. |
| `references/clean-code-reviewer.md` | SOLID, DRY, YAGNI ve Addy Osmani üretim seviyesi mühendislik ilkeleri ile kod kalitesini denetleyen yetenek. |
| `references/concurrency-and-memory-profiler.md` | Asenkron kilitlenmeleri (Deadlock), bellek kaçaklarını (Memory Leak) ve thread yarışlarını (Race Condition) denetleyen performans uzmanı. |
| `references/corporate-memory-specialist.md` | Proje mimari kararlarını docs/ADR altına yazacak kalıcı hafıza uzmanı. |
| `references/correlation-id-specialist.md` | İsteklere X-Correlation-ID ekletip tüm loglarda izlenebilirliği sağlayan uzman. |
| `references/db-architect-security.md` | Veritabanı mimarisi, güvenlik standartları, ORM yapılandırmaları ve veritabanı tasarımı için yetenek. |
| `references/distributed-saga-manager.md` | Distributed işlemlerde klasik transaction yerine Saga/Kompansasyon dayatan ajan. |
| `references/dotnet-enterprise-architect.md` | Kurumsal düzeyde .NET Core, C# mimarisi ve Entity Framework optimizasyonları için teknik rehber. |
| `references/edge-and-gateway-architect.md` | API Gateway, Load Balancing, Rate Limiting ve dış dünyaya açılan kapıların (Edge) güvenliğini tasarlayan mimar. |
| `references/finops-architect.md` | LLM'in pahalı bulut çözümlerini engelleyip, en ucuz mimariyi dayatan ajan. |
| `references/forensic-detective.md` | Hata logu geldiğinde 3 hipotez üreterek kök neden analizi yapacak uzman. |
| `references/legacy-code-migrator-specialist.md` | Farklı programlama dilleri (Örn: Django'dan .NET'e) arası kod dönüşümü, mimari eşleştirme ve refactoring uzmanı. |
| `references/mcp-integration-guidelines.md` | Veritabanı, GitHub, Jira gibi MCP bağlantılarını otonom sisteme dahil eden kural seti. |
| `references/mobile-flutter-swift-architect.md` | iOS (Swift/SwiftUI) ve Flutter uygulamaları için performans, state management ve native köprü mimarisi uzmanı. |
| `references/recon-specialist.md` | Kod yazılmadan önce grep ile projeyi tarayıp DRY prensibini uygulayacak ajan. |
| `references/schema.md` | İlişkisel veri tabanları, NoSQL ve API'ler için ölçeklenebilir ve güvenli şema tasarım kalıpları. |
| `references/swagger-and-xml-doc-gate.md` | Backend kodunda (özellikle .NET) yazılan her endpoint için XML Doc, Summary ve profesyonel Swagger yapılandırmasını zorunlu kılan kapı. |
| `references/swift-architecture-auditor.md` | Swift & iOS/macOS mimari inceleme, SwiftUI/UIKit katman analizi, MVVM/VIPER/TCA kontrolü, Concurrency ve Memory Leak denetim skilli |
| `references/tech-debt-collector.md` | Kullanılmayan kodları (dead code) silmekle görevli uzman. |

### `deployment-orchestrator` (7)

| Referans | Açıklama |
|---|---|
| `references/ci-cd-engineer.md` | Sürekli entegrasyon ve dağıtım (CI/CD) pipeline'ları kurma uzmanı. GitHub Actions, GitLab CI ve Jenkins için yapılandırmalar oluşturur. |
| `references/cloud-deployer.md` | Vercel, Netlify, Cloudflare, Serverless Framework gibi platformlara hızlı ve zero-config dağıtım süreçlerini yönetir. |
| `references/container-master.md` | Konteynerleştirme ve orkestrasyon uzmanı. Dockerfile yazımı, optimizasyonu ve Kubernetes (K8s) / Helm yapılandırmaları. |
| `references/gitops-manager.md` | ArgoCD ve Flux ile Kubernetes üzerinde GitOps tabanlı sürekli dağıtım (CD) süreçlerini yönetir. |
| `references/iac-architect.md` | Altyapının kod olarak yönetimi (IaC). Terraform, Pulumi ve Ansible kullanarak bulut ve sunucu altyapısını tasarlar. |
| `references/observability-setup.md` | Sistem izleme, loglama ve metrik toplama (Prometheus, Grafana, ELK, Datadog) altyapılarını kurar. |
| `references/zero-downtime-deployment-strategist.md` | Güncellemelerde Expand & Contract desenini dayatan kesintisiz deployment uzmanı. |

### `design-orchestrator` (11)

| Referans | Açıklama |
|---|---|
| `references/apple-design.md` | iOS, macOS ve visionOS için Apple Human Interface Guidelines (İnsan Arayüzü Yönergeleri) tabanlı uygulama tasarımı ve geliştirme becerisi. |
| `references/brandkit.md` | Marka tutarlılığını sağlamak için marka kimliği, logo kullanımı, tipografi, renk paletleri ve görsel kuralların yönetimi. |
| `references/design-taste-frontend-gate.md` | Frontend tasarım zevki rehberi: modern web ve mobil arayüzler için tipografi, renk, boşluk, düzen kalıpları ve görsel kalite standartları. |
| `references/high-end-visual-design.md` | Üst düzey, lüks ve premium kullanıcı arayüzü (UI) tasarımı prensipleri. Glassmorphism, optik hizalama, premium renk paletleri ve mikro etkileşimler gi |
| `references/image-to-code-tool.md` | Ekran görüntüleri, mockup'lar veya tasarım dosyalarını (Figma vb.) analiz ederek piksel mükemmelliğinde, duyarlı (responsive) ve temiz koda dönüştürme |
| `references/imagegen-frontend-tool.md` | Frontend projeleri için yapay zeka görsel oluşturma rehberi: web hero görselleri, mobil varlıklar, ikonlar ve pazarlama görselleri. |
| `references/onboarding.md` | Web ve mobil uygulamalar için ilk kullanım deneyimi (FTUE), aşamalı bilgilendirme ve kullanıcı karşılama süreçlerinin tasarımı. |
| `references/pick-ui-library.md` | Projeler için doğru UI bileşen kütüphanesini seçme rehberi; performans, erişilebilirlik ve bakım kriterlerini içerir. |
| `references/product-designer.md` | Ürün tasarımı, UX deneyimi ve wireframe planlaması için kullanılan yetenek. |
| `references/prototype.md` | Hızlı prototipleme, MVP geliştirme ve farklı tasarım aslına uygunluk seviyelerinde doğru aracı seçme stratejileri. |
| `references/ui-animation.md` | Uçtan uca kullanıcı arayüzü (UI) animasyon yeteneği: web ve mobil animasyonlar için terminoloji, optimizasyon ve kod incelemesi. |

### `docs-orchestrator` (3)

| Referans | Açıklama |
|---|---|
| `references/api-documentation-architect.md` | API Documentation & Tech Writer: Builds Stripe/Vercel-quality public-facing developer documentation sites (Docusaurus/Mintlify) from raw backend code. |
| `references/document-and-asset-manager.md` | Document & Asset Manager: Optimizes, compresses, and manages document pipelines (PDFs, images, CSVs, file size limits). |
| `references/office-documents-tool.md` | Word, Excel, PowerPoint ve PDF dosyalarını okuma, yazma ve dönüştürme işlemlerini tek noktadan yöneten araç. |

### `git-orchestrator` (7)

| Referans | Açıklama |
|---|---|
| `references/api-handoff-workflow.md` | Backend'de bir değişiklik yapıldığında otomatik Changelog çıkaran ve Frontend takımı için eski/yeni API karşılaştırma (Devir-Teslim) dokümanı üreten i |
| `references/generate-standup-workflow.md` | Günlük standup (geliştirme) raporlarını kısa, öz ve yapılandırılmış bir şekilde oluşturma kuralları. |
| `references/git-conventional-commits-workflow.md` | Git commit mesajları ve branch isimlendirme standartlarını belirler. Conventional Commits kurallarını uygular. |
| `references/git-issue-manager.md` | GitHub/GitLab issue yönetimi için en iyi uygulamalar. Etkili hata raporları, özellik istekleri yazma ve etiketleme. |
| `references/git-pr-reviewer.md` | Pull Request (PR) oluşturma ve kod inceleme (code review) süreçleri için standartlar ve yapıcı geri bildirim. |
| `references/git-repo-setup-workflow.md` | GitHub repo kurulumu ve topluluk standartları için en iyi uygulamalar (README, CONTRIBUTING, kurallar). |
| `references/update-changelog-workflow.md` | Release & Changelog Manager: Manages version bumps (x.x.x SemVer) and CHANGELOG.md generation ONLY during the Release/Deployment phase, never during a |

### `marketing-orchestrator` (3)

| Referans | Açıklama |
|---|---|
| `references/copywriting.md` | Açık ve anlaşılır eyleme çağrı (CTA), hata mesajları ve kullanıcı arayüzü metinleri yazma kuralları. |
| `references/product-marketer.md` | App Store açıklamaları, sürüm notları, pazarlama metinleri ve SEO uyumlu içerikler oluşturan ürün pazarlama uzmanı. |
| `references/technical-seo-architect.md` | Technical SEO & Core Web Vitals Architect: Ensures maximum search engine visibility via Semantic HTML, JSON-LD Schema, OpenGraph, and strict Web Vital |

### `master-orchestrator` (6)

| Referans | Açıklama |
|---|---|
| `references/adversarial-code-reviewer.md` | Yazılan kodu teslim etmeden önce 'Şeytanın Avukatı' gözüyle gizli bug, showstopper, bellek kaçağı ve mimari açıkları arayan denetçi. |
| `references/critical-critique-gate.md` | Yapay zekanın kullanıcı fikirlerini ve hatalı kod yönlendirmelerini körü körüne onaylamasını engeller. Yapıcı itiraz eder, riskleri gösterir ve doğru  |
| `references/no-truncation-gate.md` | Yapay zeka asistanının kod üretimi ve açıklamalarında hiçbir zaman kısaltma, atlama veya eksik bilgi vermemesini sağlayan meta-yetenek. "Geri kalanı a |
| `references/pre-mortem-stress-test-gate.md` | Mimari ve sistem kararlarında 'Bu sistem canlıda patlarsa nereden patlar?' analizi yapan stres testi skill'i. |
| `references/socratic-clarification-gate.md` | Eksik veya varsayımlı taleplerde doğrudan kod yazmak yerine Sokratik sorularla gereksinimleri netleştiren güvenlik kapısı. |
| `references/turkish-language-enforcer-gate.md` | Yapay zekanın İngilizce talimat alsa bile kullanıcıya her zaman Türkçe yanıt vermesini zorunlu kılan güvenlik kapısı. |

### `security-orchestrator` (22)

| Referans | Açıklama |
|---|---|
| `references/api-authentication-weaknesses-pentester.md` | API kimlik doğrulama mekanizmalarını; kırık kimlik doğrulama, güvensiz token yönetimi ve brute-force gibi zafiyetlere karşı test eder. |
| `references/api-for-broken-object-level-authorization-pentester.md` | REST ve GraphQL API'lerde Kırık Nesne Seviyesi Yetkilendirme (BOLA/IDOR, OWASP API1:2023) zafiyetlerini test eder. Nesne kimliklerini (ID'ler) analiz  |
| `references/api-for-mass-assignment-vulnerability-pentester.md` | API'lerde toplu atama (mass assignment) zafiyetlerini test eder. (OWASP API3:2023). Kayıt, profil veya nesne oluşturma uç noktalarında belgelenmemiş a |
| `references/api-pentest.md` | Endpoint güvenliği, rate limiting, SQL/NoSQL injection koruması, JWT ve yetkilendirme (authorization) zafiyet testleri. |
| `references/api-security-with-owasp-top-10-pentester.md` | REST, GraphQL ve gRPC API uç noktalarını OWASP API Security Top 10 (2023) standartlarına göre sistemli olarak değerlendirir. Burp Suite ve Postman kul |
| `references/client-security.md` | Frontend güvenliği; XSS, CSRF, Content Security Policy (CSP) header'ları ve DOM tabanlı zafiyetlerin engellenmesi. |
| `references/cors-misconfiguration-pentester.md` | Güvenlik testleri sırasında, yetkisiz alanlar arası (cross-domain) veri erişimine ve kimlik bilgisi hırsızlığına olanak tanıyan Cross-Origin Resource  |
| `references/csrf-attack-simulation-specialist.md` | Yetkili güvenlik değerlendirmeleri sırasında onaylanmış kullanıcı oturumlarını istismar eden sahte istekler oluşturarak, web uygulamalarını Cross-Site |
| `references/dependency-audit-gate.md` | Proje bağımlılıklarındaki (npm, pip vb.) CVE zafiyetlerinin taranması, supply chain güvenliği ve versiyon güncellemeleri. |
| `references/for-broken-access-control-pentester.md` | Web uygulamaları ve API'leri Kırık Erişim Kontrolü (OWASP A01:2021) açısından test eder. Yetki yükseltme, eksik fonksiyon seviyesi kontrolleri, IDOR v |
| `references/for-json-web-token-vulnerabilities-pentester.md` | JWT uygulamalarında algoritma karmaşası, 'none' algoritması atlatması, kid/jku parametre enjeksiyonu ve zayıf gizli anahtar (secret) zafiyetlerini tes |
| `references/for-xss-vulnerabilities-pentester.md` | Web uygulamalarında Reflected, Stored ve DOM tabanlı XSS (Cross-Site Scripting) zafiyetlerini test eder. Burp Suite ve tarayıcı araçlarıyla JavaScript |
| `references/graphql-security-assessment-specialist.md` | GraphQL API uç noktalarını introspection (içe bakış) sızıntıları, enjeksiyon saldırıları, yetkilendirme hataları ve servis dışı bırakma (DoS) zafiyetl |
| `references/jwt-token-security-pentester.md` | JSON Web Token (JWT) uygulamalarını kriptografik zayıflıklar, algoritma karmaşası ve yetkilendirme atlama zafiyetlerine karşı güvenlik testleri sırası |
| `references/master-pentester.md` | Test stratejileri, birim testleri (unit test) ve e2e testler yazmak için yetenek. |
| `references/mobile-api-authentication-pentester.md` | Mobil uygulama API'lerindeki kimlik doğrulama ve yetkilendirme mekanizmalarını test ederek kırık kimlik doğrulama, güvensiz token yönetimi, oturum sab |
| `references/oauth2-implementation-flaws-pentester.md` | OAuth 2.0 ve OpenID Connect uygulamalarını yetkilendirme kodu yakalama, yönlendirme (redirect URI) manipülasyonu, CSRF, token sızıntısı ve PKCE atlatm |
| `references/sca-dependency-scanning-with-snyk-specialist.md` | CI/CD süreçlerinde zafiyetli açık kaynaklı bağımlılıkları tespit etmek için Snyk ile Yazılım Bileşimi Analizi (SCA) uygulanmasını sağlar. Otomatik PR  |
| `references/scanning-containers-with-trivy-in-cicd.md` | CI/CD süreçlerine Aqua Security Trivy tarayıcısını entegre ederek işletim sistemi paketlerindeki, bağımlılıklardaki CVE'leri, Dockerfile hatalarını ve |
| `references/secret-scanner.md` | Kod tabanında unutulmuş API key, şifre, sertifika gibi hassas verilerin taranması ve .env yönetimi. |
| `references/secret-scanning-with-gitleaks-specialist.md` | Git repolarında hardcode edilmiş (gömülü) hassas verileri ve şifreleri bulup engellemek için Gitleaks'i entegre eder. Pre-commit hook yapılandırması,  |
| `references/secrets-scanning-in-ci-cd-specialist.md` | Dağıtım öncesinde sızdırılmış şifreleri, anahtarları ve hassas verileri tespit etmek için gitleaks ve trufflehog araçlarını CI/CD süreçlerine entegre  |

### `test-orchestrator` (5)

| Referans | Açıklama |
|---|---|
| `references/e2e-tester.md` | Cypress, Playwright veya Appium ile uçtan uca (E2E) kullanıcı senaryoları ve entegrasyon testleri yazma yeteneği. |
| `references/performance-tester.md` | Yük (load) testi, memory leak (bellek kaçağı) tespiti, benchmark analizleri ve performans optimizasyonu. |
| `references/smoke-monkey-tester.md` | Sistemin temel fonksiyonlarını kontrol eden smoke testler ve rastgele girdilerle sistemi çökertmeyi hedefleyen monkey/chaos testleri. |
| `references/test-driven-development-gate.md` | Kod üretildikten sonra AI'ın ilgili birim testlerini (Unit Test) yazıp terminalde çalıştırmasını zorunlu kılan kapı. |
| `references/unit-test-architect.md` | Kapsamlı birim (unit) testleri, mock/stub kullanımları ve edge-case (uç durum) senaryoları yazma becerisi. |

## Ek Kaynaklar

17 pentest referansının betik/şablon dosyaları (`scripts/`, `references/`, `assets/`) `security-orchestrator/references/_resources/<skill>/` altında durur. Orkestratör yalnızca ilgili test için okur; token maliyeti yoktur.

`skill-creator-tool` (`agents/`, `assets/`, `eval-viewer/`, `references/`, `scripts/`) ve `mcp-builder-tool` (`reference/`, `scripts/`) kendi yardımcı dosyalarını kendi klasörlerinde taşır; `SKILL.md` içindeki göreli yollar bu sayede çalışır.

## Kalite Kapıları → Kurallar

Eski 20 gate skill'i artık `.claude/rules/` altında, ilgili dosya açılınca yüklenen kurallardır:

| Dosya | Kapsam (`paths`) | İçerik |
|---|---|---|
| `dotnet-backend.md` | `**/*.cs`, `**/*.csproj` | Audit, tenant, UTC, FSM, ubiquitous language, outbox, 3 katman doğrulama, IOptions, ProblemDetails, stateless, loglama/PII, dayanıklılık, LLM çıktı doğrulama |
| `frontend.md` | `**/*.{ts,tsx,js,jsx,vue,svelte,dart}` | Client doğrulama, graceful degradation, 60fps/main thread, bundle, LLM çıktı doğrulama |

Her zaman geçerli kurallar (pre-flight, kritik itiraz, eskalasyon, changelog) `CLAUDE.md` içindedir.
