# Subagent Referansı — 38 Agent

> Claude Agency'nin tüm subagent tanımları. Her agent `.claude/agents/<agent-name>.md` yolunda tanımlıdır.

---

## 🔧 Teknik (7)

| Agent | Görev | Uzmanlık |
|---|---|---|
| `backend-specialist` | Backend geliştirme | .NET 10, EF Core, CQRS, MediatR, Vertical Slice |
| `frontend-developer` | Frontend geliştirme | React 19+, TypeScript, Core Web Vitals |
| `mobile-ios-swift` | Mobil geliştirme | Swift 6, SwiftUI, watchOS, iOS |
| `database-optimizer` | Veritabanı optimizasyonu | PostgreSQL 17, EF Core migration, query tuning |
| `devops-engineer` | DevOps süreçleri | CI/CD, Docker, Kubernetes, IaC |
| `gis-web-developer` | Harita ve konum | Harita, güzergah planlama, gerçek zamanlı konum |
| `integrations-webhook-specialist` | Entegrasyon | Webhook, event-driven servis entegrasyonu |

---

## ✅ Kalite & Güvenlik (9)

| Agent | Görev | Uzmanlık |
|---|---|---|
| `code-reviewer` | Kod inceleme | PR review, kod kalite denetimi |
| `test-engineer` | Test geliştirme | Unit/Integration/E2E, TDD |
| `testing-qa-engineer` | QA mühendisliği | Test senaryosu, edge case tasarımı |
| `testing-test-strategist` | Test stratejisi | Test piramidi, araç seçimi, kapsam analizi |
| `security-specialist` | Güvenlik mimarisi | OWASP, pentest, JWT, STRIDE, AI kod denetimi |
| `security-secrets-engineer` | Secret yönetimi | Credential sızıntı önleme, secret rotation |
| `security-compliance-auditor` | Uyumluluk | GDPR, App Store gizlilik, veri koruma |
| `security-ai-code-auditor` | AI kod denetimi | AI üretimi kod özel güvenlik taraması |
| `incident-response` | Olay müdahalesi | Prodüksiyon olayı, SEV sınıflandırma, postmortem |

---

## 🎨 Ürün & Tasarım (9)

| Agent | Görev | Uzmanlık |
|---|---|---|
| `product-manager` | Ürün yönetimi | PRD, roadmap, özellik kararı |
| `product-sprint-prioritizer` | Sprint planlama | Backlog önceliklendirme, velocity analizi |
| `product-feedback-synthesizer` | Geri bildirim | Kullanıcı geri bildirimi sentezi ve tematik analiz |
| `design-ui-designer` | UI tasarım | Tailwind CSS, Radix UI, responsive design |
| `design-ux-architect` | UX mimari | Kullanıcı akışı, bilgi mimarisi, wireframe |
| `design-ux-researcher` | UX araştırma | Kullanıcı araştırması, usability testleri |
| `design-ui-finish-gate-reviewer` | UI kalite kontrol | Piksel mükemmelliği, görsel tutarlılık denetimi |
| `design-brand-guardian` | Marka koruma | Marka tutarlılığı, stil rehberi uyumu |
| `design-persona-walkthrough` | Persona testi | Persona bazlı UX walkthrough ve senaryo testi |

---

## 📊 Proje & Strateji (5)

| Agent | Görev | Uzmanlık |
|---|---|---|
| `project-manager-senior` | Proje yönetimi | Sprint planı, risk yönetimi, timeline |
| `meeting-notes-specialist` | Toplantı notları | Aksiyon maddeleri, karar takibi |
| `strategy-business-strategist` | İş stratejisi | Büyüme stratejisi, monetizasyon, rekabet analizi |
| `strategy-okr-coach` | OKR koçluğu | OKR yazımı, quarter planlaması, odak |
| `research-synthesizer` | Araştırma sentezi | Kaynak analizi, araştırma raporlama |

---

## 📢 Pazarlama & Destek (6)

| Agent | Görev | Uzmanlık |
|---|---|---|
| `marketing-content-strategist` | İçerik stratejisi | App Store metni, release notes, blog |
| `marketing-seo-specialist` | SEO | ASO, web SEO, anahtar kelime analizi |
| `marketing-copywriter` | Metin yazarlığı | Pazarlama kopyası, onboarding metni, CTA |
| `support-technical-support` | Teknik destek | Kullanıcı sorun çözme, FAQ |
| `support-customer-support` | Müşteri desteği | Şikayet yönetimi, memnuniyet takibi |
| `technical-writer` | Teknik yazarlık | API dokümantasyonu, teknik rehberler |

---

## 🎯 Özel Görev (2)

| Agent | Görev | Uzmanlık |
|---|---|---|
| `specialized-focus-manager` | Odak yönetimi | Görev kapsamını daraltma, scope creep engelleme |
| `specialized-reality-checker` | Gerçeklik kontrolü | Fizibilite analizi, varsayım doğrulama |

---

## Delegasyon Kuralları

`CLAUDE.md`'de tanımlanan delegasyon eşiği — aşağıdakilerden herhangi biri varsa ilgili subagent'a delege et:

| Kriter | Eşik |
|---|---|
| Dosya değişikliği | 3+ dosya |
| Yeni modül/servis | Herhangi bir yeni katman |
| Domain uzmanlığı | Özel alan bilgisi gereken görev |
| Tahmini süre | 10+ dakika |

---

## Özet

| Kategori | Agent Sayısı |
|---|---|
| Teknik | 7 |
| Kalite & Güvenlik | 9 |
| Ürün & Tasarım | 9 |
| Proje & Strateji | 5 |
| Pazarlama & Destek | 6 |
| Özel Görev | 2 |
| **TOPLAM** | **38** |
