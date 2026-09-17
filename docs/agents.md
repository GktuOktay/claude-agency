# Subagent Referansı

Claude Code'un native subagent sistemi ile ağır görevler izole, doğru modelle çalışır.

## Ne Zaman Subagent Kullanılır?

- 3'ten fazla dosya değiştirecek görevler
- Domain uzmanlığı gerektiren işler
- Ana context window'u kirletmemek istediğinde
- Paralel yürütme gereken bağımsız görevler

---

## Teknik Agentlar

### `backend-specialist`
**Tools:** Read, Edit, Write, Bash

.NET 10, EF Core 9+, Clean Architecture, CQRS, MediatR uzmanı.

**Delegasyon tetikleyicileri:** Yeni entity/domain model, EF Core migration, repository/service katmanı, CQRS handler

**Kaynak önceliği:** microsoft-learn MCP → dotnet/dotnet GitHub

---

### `frontend-developer`
**Tools:** Read, Edit, Write, Bash

React 19+, TypeScript strict, Tailwind CSS, Core Web Vitals uzmanı.

**Delegasyon tetikleyicileri:** UI komponent geliştirme, state yönetimi, performans optimizasyonu, erişilebilirlik

---

### `mobile-ios-swift`
**Tools:** Read, Edit, Write, Bash

Swift 6.1, SwiftUI 6, watchOS 11+, Swift Testing, Swift Data, WCSession uzmanı.

**Delegasyon tetikleyicileri:** iOS/watchOS özellik geliştirme, WCSession senkronizasyonu, HealthKit/EventKit entegrasyonu, Xcode build sorunları

---

### `database-optimizer`
**Tools:** Read, Edit, Write, Bash

PostgreSQL 17, EF Core 9, query optimizasyonu, zero-downtime migration uzmanı.

**Delegasyon tetikleyicileri:** Yavaş query analizi, index stratejisi, EF Core N+1 tespiti, migration yazımı

---

### `devops-engineer`
**Tools:** Read, Edit, Write, Bash

GitHub Actions, Docker, Kubernetes, Terraform, Azure/AWS uzmanı.

**Delegasyon tetikleyicileri:** CI/CD pipeline, container image, IaC, zero-downtime deployment

---

### `gis-web-developer`
**Tools:** Read, Edit, Write, Bash

MapLibre GL JS, Leaflet, WebSocket tabanlı gerçek zamanlı konum takibi, güzergah planlama uzmanı.

**Delegasyon tetikleyicileri:** Harita entegrasyonu, canlı araç/servis takibi, güzergah hesaplama, coğrafi veri görselleştirme

---

### `integrations-webhook-specialist`
**Tools:** Read, Edit, Write, Bash

Webhook tasarımı, HMAC imzalama, idempotency, event-driven entegrasyon uzmanı.

**Delegasyon tetikleyicileri:** Webhook endpoint tasarımı, üçüncü parti servis entegrasyonu, event-driven mimari

---

## Kalite & Güvenlik Agentları

### `code-reviewer`
**Tools:** Read, Bash *(Read-only — kod yazmaz)*

Kod kalite denetimi. Her bulgu satır numarasıyla raporlanır.

**Çıktı formatı:** `L{n}: [🔴CRITICAL|🟡WARN|🔵INFO] kategori: sorun → Fix: çözüm`

---

### `test-engineer`
**Tools:** Read, Edit, Write, Bash

xUnit, NUnit, TestContainers, Playwright, k6 uzmanı.

**Kural:** Mock DB yasak — TestContainers zorunlu.

---

### `testing-qa-engineer`
**Tools:** Read, Write, Edit, Bash

Test senaryosu tasarımı, edge case tespiti, acceptance criteria uzmanı.

**Delegasyon tetikleyicileri:** Test planı yazımı, regresyon test listesi, "bu özelliği nasıl test ederiz?"

---

### `testing-test-strategist`
**Tools:** Read, Write

Test piramidi tasarımı, araç seçimi, CI/CD test entegrasyonu uzmanı.

**Delegasyon tetikleyicileri:** Yeni proje test altyapısı kurulumu, "hangi testleri ne kadar yazalım?" kararları

---

### `security-specialist`
**Tools:** Read, Bash, WebSearch, WebFetch

OWASP Top 10, STRIDE tehdit modelleme, JWT/OAuth2, API güvenliği, AI üretimi kod denetimi uzmanı.  
Üç bölüm: **Kod Güvenliği** · **Güvenlik Mimarisi** · **AI Kod Denetimi**

**Delegasyon tetikleyicileri:** Pentest, güvenlik review, auth implementasyonu, mimari tehdit modelleme

**Çıktı formatı:** `[KRİTİK|YÜKSEK|ORTA|DÜŞÜK] bulgu → PoC → Fix`

---

### `security-secrets-engineer`
**Tools:** Read, Bash

Credential yönetimi, hardcoded secret tespiti, key rotation, .env güvenliği uzmanı.

**Delegasyon tetikleyicileri:** Secret sızıntısı şüphesi, credential yönetimi yapılandırması, CI/CD secret kurulumu

---

### `security-compliance-auditor`
**Tools:** Read, Write

GDPR, Apple App Store PrivacyInfo.xcprivacy, veri saklama politikası uzmanı.

**Delegasyon tetikleyicileri:** App Store privacy review, GDPR uyumluluk denetimi, veri envanteri

---

### `security-ai-code-auditor`
**Tools:** Read, Bash

AI araçlarının (Claude, Copilot, Cursor) ürettiği kodda özel güvenlik riski tespiti uzmanı.

**Delegasyon tetikleyicileri:** AI ile yazılan PR'ın güvenlik review'u, hallüsinasyon kaynaklı paket doğrulama

---

### `incident-response`
**Tools:** Read, Bash

SEV sınıflandırması, 5 Whys kök neden analizi, blameless postmortem uzmanı.

**Delegasyon tetikleyicileri:** Prodüksiyon olayı yönetimi, postmortem yazımı, runbook oluşturma

---

## Ürün & Tasarım Agentları

### `product-manager`
**Tools:** Read, Write, Edit

PRD yazımı, RICE önceliklendirme, roadmap planlaması uzmanı.

---

### `product-sprint-prioritizer`
**Tools:** Read, Write

Sprint kapasitesi ve backlog sıralama uzmanı. (Genel proje planlaması için `project-manager-senior`)

---

### `product-feedback-synthesizer`
**Tools:** Read, Write

App Store yorumları, destek ticketları ve anket verilerinden içgörü sentezi uzmanı.

---

### `design-ui-designer`
**Tools:** Read, Write, Edit

Platform tasarım dili (Apple HIG), görsel hiyerarşi, erişilebilirlik uzmanı.

---

### `design-ux-architect`
**Tools:** Read, Write

Kullanıcı akışı, bilgi mimarisi, navigasyon yapısı uzmanı.

---

### `design-ux-researcher`
**Tools:** Read, Write

Kullanıcı araştırması, görüşme soruları, bulgular raporu uzmanı.

---

### `design-ui-finish-gate-reviewer`
**Tools:** Read

Ekranın yayına çıkmadan önce son kalite kontrolü — spacing, durum kapsamı, erişilebilirlik, platform uyumu.

---

### `design-brand-guardian`
**Tools:** Read

Görsel kimlik ve ses tonu tutarlılığı denetimi uzmanı.

---

### `design-persona-walkthrough`
**Tools:** Read

Persona bazlı UX senaryo değerlendirmesi uzmanı.

---

## Proje & Strateji Agentları

### `project-manager-senior`
**Tools:** Read, Write

Sprint planı, risk yönetimi, milestone takibi, haftalık durum raporu uzmanı.

---

### `meeting-notes-specialist`
**Tools:** Read, Write

Toplantı notlarını yapılandırma, karar ve aksiyon maddesi çıkarma uzmanı.

---

### `strategy-business-strategist`
**Tools:** Read, Write

Büyüme stratejisi, monetizasyon modeli, SWOT/RICE/Ansoff analizi uzmanı.

---

### `strategy-okr-coach`
**Tools:** Read, Write

OKR yazımı, quarter planlaması, çok proje kapasite dengesi uzmanı.

---

### `research-synthesizer`
**Tools:** Read, Write

Çoklu kaynak sentezi, rakip analizi, araştırma bulguları raporlaması uzmanı.

---

## Pazarlama & Destek Agentları

### `marketing-content-strategist`
**Tools:** Read, Write

App Store metni, release notes, teknik blog, developer içeriği uzmanı.

---

### `marketing-seo-specialist`
**Tools:** Read, Write

ASO (App Store Optimization), web SEO, anahtar kelime araştırması uzmanı.

---

### `marketing-copywriter`
**Tools:** Read, Write

Pazarlama kopyası, onboarding ekran metinleri, push notification, CTA uzmanı.

---

### `support-technical-support`
**Tools:** Read, Write

Kullanıcı teknik sorun çözme adımları, FAQ ve destek dokümanı yazımı uzmanı.

---

### `support-customer-support`
**Tools:** Write

App Store yorum yanıtı, empati odaklı kullanıcı iletişimi, şikayet yönetimi uzmanı.

---

### `technical-writer`
**Tools:** Read, Write, Edit

API dokümantasyonu, README, mimari belgeleri, developer guide uzmanı.

---

## Karar Destek Agentları

### `specialized-reality-checker`
**Tools:** Read

Plan ve fikirlerin varsayım testı, kör nokta tespiti, gerçekçilik değerlendirmesi uzmanı.

---

### `specialized-focus-manager`
**Tools:** Read, Write

Çok proje önceliklendirme, haftalık odak planı, bağlam geçiş yönetimi uzmanı.

---

## Model Değiştirme

```bash
# Tek agent için
sed -i 's/model: claude-sonnet-4-6/model: claude-opus-5/' .claude/agents/backend-specialist.md

# Tüm agentlar için
./setup.sh
```
