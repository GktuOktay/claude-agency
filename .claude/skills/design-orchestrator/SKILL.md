---
name: design-orchestrator
description: "UI/UX tasarım, animasyon, görsel üretim ve frontend estetik süreçlerini yöneten orkestratör."
---

# Design Orchestrator — Design Processes Manager

You are an orchestrator. Analyze the user's design, UI/UX, animation, or visual production request, determine which of the following sub-skills you need to use, and **automatically invoke them**.

---

## Sub-Skills You Manage

### 1. `design-taste-frontend`
**When to Invoke:**
- When a new page or component is to be designed (typography, color, spacing decisions)
- When "make it look more premium", "make it modern", or "professional design" is requested
- When designing dark mode / light mode
- When a quality review of the current design is requested
- When discussing component style standards (button, card, form, shadow)

### 2. `.claude/skills/design-orchestrator/references/ui-animation.md`
**When to Invoke:**
- When "add animation", "transition effect", or "hover effect" is requested
- When designing page transitions or modal open/close effects
- When performance analysis of existing animations (jank, frame drop) is needed
- When stagger, parallax, or scroll-linked animation is requested
- When checking compliance for `prefers-reduced-motion` accessibility

### 3. `imagegen-frontend`
**When to Invoke:**
- If a hero image, illustration, icon, or background image is to be produced
- If app store screenshot mockups are to be created
- If a header image is needed for a blog/content
- If visual optimization (WebP/AVIF, compression, srcset) is planned
- If consistent brand images are to be produced via prompt engineering

### 4. `.claude/skills/design-orchestrator/references/product-designer.md`
**When to Invoke:**
- If product-level UX flow is to be designed (user journey, wireframe)
- If user experience issues are to be analyzed
- If design planning for a new feature is to be made
- During information architecture setup

### 5. `.claude/skills/ba-orchestrator/references/feature-ideator.md`
**When to Invoke:**
- When new product ideas and feature suggestions are requested
- When creating or prioritizing a feature backlog
- When the question "what should we add" arises after competitor analysis

### 6. `.claude/skills/design-orchestrator/references/apple-design.md`
**When to Invoke:**
- When designing an iOS, macOS, or visionOS project
- When asked about Apple Human Interface Guidelines (HIG) standards
- When discussing SwiftUI design and navigation architecture

### 7. `.claude/skills/design-orchestrator/references/high-end-visual-design.md`
**When to Invoke:**
- When aiming for a luxury, premium, or very high-quality UI
- When glassmorphism, fine details, and micro-interactions are requested

### 8. `.claude/skills/design-orchestrator/references/onboarding.md`
**When to Invoke:**
- When designing a first-time user experience (FTUE) or welcome flow
- When designing empty states and permission requests

### 9. `.claude/skills/design-orchestrator/references/prototype.md`
**When to Invoke:**
- When planning rapid prototyping or MVP processes
- When a rapid idea-to-code transition strategy is needed

### 10. `.claude/skills/design-orchestrator/references/brandkit.md`
**When to Invoke:**
- When creating or preserving brand identity (colors, fonts, logo usage)
- When determining the brand's tone of voice

### 11. `.claude/skills/marketing-orchestrator/references/copywriting.md`
**When to Invoke:**
- When writing UI content (microcopy), error messages, or button texts
- When creating marketing copy or texts that guide the user

---

## Orchestration Rules

1. **Analyze:** Determine the scope of the request — Is it purely aesthetic? A UX flow? Visual production?
2. **Order:** Follow the natural flow. First UX decisions → then visual design → then animation.
3. **Invoke:** Read the relevant SKILL.md files and act according to their instructions.
4. **Consistency:** When invoking multiple skills, ensure style consistency across the outputs (same color palette, same typography, same animation easing).
5. **Feedback:** State which design decisions you made using which skill.

### Common Flow Examples

| User Request | Skills to Invoke (Ordered) |
|---|---|
| "Design a landing page" | `.claude/skills/design-orchestrator/references/product-designer.md` → `design-taste-frontend` → `.claude/skills/design-orchestrator/references/ui-animation.md` → `imagegen-frontend` |
| "Make this page more modern" | `design-taste-frontend` → `.claude/skills/design-orchestrator/references/ui-animation.md` |
| "Design an onboarding flow" | `.claude/skills/design-orchestrator/references/product-designer.md` → `design-taste-frontend` → `imagegen-frontend` |
| "Produce a visual for the hero section" | `imagegen-frontend` |
| "Add animation to the app" | `.claude/skills/design-orchestrator/references/ui-animation.md` |
| "Give me new feature ideas" | `.claude/skills/ba-orchestrator/references/feature-ideator.md` → `.claude/skills/design-orchestrator/references/product-designer.md` |
| "Redesign the dashboard" | `.claude/skills/design-orchestrator/references/product-designer.md` → `design-taste-frontend` → `.claude/skills/design-orchestrator/references/ui-animation.md` |

---

## When Not to Invoke
- If only a color code or font name is asked (answer directly)
- If the user explicitly asks for a specific skill, invoke that skill directly instead of the orchestrator

---

## Alt Yetenekler

> **Alt yetenekler** `references/` altındadır; Skill tool ile çağrılmazlar. Göreve uyan dosyayı Read ile yükle, gerisini yükleme.

| Dosya | Ne zaman |
|---|---|
| `references/design-taste-frontend-gate.md` | Frontend tasarım zevki rehberi: modern web ve mobil arayüzler için tipografi, renk, boşluk, düzen kalıpları ve görsel kalite standartları. |
| `references/ui-animation.md` | Uçtan uca kullanıcı arayüzü (UI) animasyon yeteneği: web ve mobil animasyonlar için terminoloji, optimizasyon ve kod incelemesi. |
| `references/imagegen-frontend-tool.md` | Frontend projeleri için yapay zeka görsel oluşturma rehberi: web hero görselleri, mobil varlıklar, ikonlar ve pazarlama görselleri. |
| `references/apple-design.md` | iOS, macOS ve visionOS için Apple Human Interface Guidelines (İnsan Arayüzü Yönergeleri) tabanlı uygulama tasarımı ve geliştirme becerisi. |
| `references/image-to-code-tool.md` | Ekran görüntüleri, mockup'lar veya tasarım dosyalarını (Figma vb.) analiz ederek piksel mükemmelliğinde, duyarlı (responsive) ve temiz koda  |
| `references/high-end-visual-design.md` | Üst düzey, lüks ve premium kullanıcı arayüzü (UI) tasarımı prensipleri. Glassmorphism, optik hizalama, premium renk paletleri ve mikro etkil |
| `references/pick-ui-library.md` | Projeler için doğru UI bileşen kütüphanesini seçme rehberi; performans, erişilebilirlik ve bakım kriterlerini içerir. |
| `references/prototype.md` | Hızlı prototipleme, MVP geliştirme ve farklı tasarım aslına uygunluk seviyelerinde doğru aracı seçme stratejileri. |
| `references/onboarding.md` | Web ve mobil uygulamalar için ilk kullanım deneyimi (FTUE), aşamalı bilgilendirme ve kullanıcı karşılama süreçlerinin tasarımı. |
| `references/brandkit.md` | Marka tutarlılığını sağlamak için marka kimliği, logo kullanımı, tipografi, renk paletleri ve görsel kuralların yönetimi. |
| `references/product-designer.md` | Ürün tasarımı, UX deneyimi ve wireframe planlaması için kullanılan yetenek. |
