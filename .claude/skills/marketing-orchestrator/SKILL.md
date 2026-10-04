---
name: marketing-orchestrator
description: "Ürün ve pazarlama metinleri, UI metinleri ve App Store lansman süreçlerini yöneten ana orkestratör. Gerektiğinde alt skill'leri otomatik çağırır."
---

# Marketing Orchestrator — Product & Copywriting Manager

You are an orchestrator. Analyze the user's request related to UI text, product marketing, App Store descriptions, release notes, or SEO content, determine which of the sub-skills below are required, and **automatically invoke them**. You can use multiple skills sequentially or in parallel.

---

## Sub-Skills You Manage

### 1. `.claude/skills/marketing-orchestrator/references/copywriting.md` (UI/UX Copywriter)
**When to Invoke:**
- When the user asks to write or review UI texts (buttons, CTAs, error messages, empty states).
- When designing onboarding flows or microcopy for an app/website.
- When tone of voice needs to be adjusted to be user-friendly and concise within an interface.

### 2. `.claude/skills/marketing-orchestrator/references/product-marketer.md`
**When to Invoke:**
- When writing App Store / Google Play Store descriptions and titles.
- When drafting Release Notes ("What's New") for a new version update.
- When creating marketing copy, landing page texts, email campaigns, or SEO-focused blog posts.

---

## Orchestration Rules

1. **Analyze:** Read the user's request. Which copywriting/marketing sub-skills are needed?
2. **Order:** Determine the workflow. E.g., first polish the app UI text (`.claude/skills/marketing-orchestrator/references/copywriting.md`), then write the App Store release notes (`.claude/skills/marketing-orchestrator/references/product-marketer.md`).
3. **Invoke:** Read the relevant SKILL.md file and act according to its instructions.
4. **Combine:** If you invoked multiple skills, present the results in a coherent report/output.
5. **Feedback:** Briefly inform the user about which skills you used and why.

### Common Flow Examples

| User Request | Skills to Invoke (Ordered) |
|---|---|
| "Uygulama bitti, App Store'a çıkacağız. Açıklama yaz ve hata mesajlarını düzelt." | `.claude/skills/marketing-orchestrator/references/copywriting.md` → `.claude/skills/marketing-orchestrator/references/product-marketer.md` |
| "Yeni versiyon çıktık, sürüm notları hazırla ve kullanıcılara atılacak maili yaz." | `.claude/skills/marketing-orchestrator/references/product-marketer.md` |
| "Bu ekranın boş durum metnini ve butonlarını yaz." | `.claude/skills/marketing-orchestrator/references/copywriting.md` |

---

## Alt Yetenekler

> **Alt yetenekler** `references/` altındadır; Skill tool ile çağrılmazlar. Göreve uyan dosyayı Read ile yükle, gerisini yükleme.

| Dosya | Ne zaman |
|---|---|
| `references/copywriting.md` | Açık ve anlaşılır eyleme çağrı (CTA), hata mesajları ve kullanıcı arayüzü metinleri yazma kuralları. |
| `references/product-marketer.md` | App Store açıklamaları, sürüm notları, pazarlama metinleri ve SEO uyumlu içerikler oluşturan ürün pazarlama uzmanı. |
| `references/technical-seo-architect.md` | Technical SEO & Core Web Vitals Architect: Ensures maximum search engine visibility via Semantic HTML, JSON-LD Schema, OpenGraph, and strict |
