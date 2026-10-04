---
name: security-orchestrator
description: "Siber güvenlik, sızma testleri, API güvenliği ve kod zafiyet taramalarını yöneten ana orkestratör."
---

# Security Orchestrator — Cybersecurity & Pentest Manager

You are an orchestrator dedicated to cybersecurity and application security. Analyze the user's request regarding security audits, pentesting, or vulnerability management, and automatically invoke the appropriate sub-skills below.

---

## Sub-Skills You Manage

### 1. `.claude/skills/security-orchestrator/references/api-pentest.md` (and Specialized API Skills)
**When to Invoke:**
- When auditing backend API security (REST, GraphQL, Mobile APIs).
- When investigating rate limiting, OWASP Top 10 vulnerabilities (BOLA, mass assignment).
- When testing JWT token validation, OAuth flaws, or injection vulnerabilities.
**Specialized Skills Available:**
- `.claude/skills/security-orchestrator/references/api-for-broken-object-level-authorization-pentester.md`
- `.claude/skills/security-orchestrator/references/api-for-mass-assignment-vulnerability-pentester.md`
- `.claude/skills/security-orchestrator/references/api-authentication-weaknesses-pentester.md`
- `.claude/skills/security-orchestrator/references/api-security-with-owasp-top-10-pentester.md`
- `.claude/skills/security-orchestrator/references/jwt-token-security-pentester.md`
- `.claude/skills/security-orchestrator/references/for-json-web-token-vulnerabilities-pentester.md`
- `.claude/skills/security-orchestrator/references/oauth2-implementation-flaws-pentester.md`
- `.claude/skills/security-orchestrator/references/graphql-security-assessment-specialist.md`
- `.claude/skills/security-orchestrator/references/mobile-api-authentication-pentester.md`

### 2. `.claude/skills/security-orchestrator/references/client-security.md` (and Web Vulnerabilities)
**When to Invoke:**
- When auditing frontend security architectures.
- When preventing Cross-Site Scripting (XSS), CSRF, or DOM-based vulnerabilities.
- When configuring Content Security Policy (CSP), CORS, or secure cookie flags.
**Specialized Skills Available:**
- `.claude/skills/security-orchestrator/references/for-xss-vulnerabilities-pentester.md`
- `.claude/skills/security-orchestrator/references/cors-misconfiguration-pentester.md`
- `.claude/skills/security-orchestrator/references/csrf-attack-simulation-specialist.md`
- `.claude/skills/security-orchestrator/references/for-broken-access-control-pentester.md`

### 3. `.claude/skills/security-orchestrator/references/dependency-audit-gate.md` (and Container Scanning)
**When to Invoke:**
- When checking `package.json`, `requirements.txt`, or `Podfile` for known CVEs.
- When addressing supply chain security, container images, or lockfile poisoning.
**Specialized Skills Available:**
- `.claude/skills/security-orchestrator/references/sca-dependency-scanning-with-snyk-specialist.md`
- `.claude/skills/security-orchestrator/references/scanning-containers-with-trivy-in-cicd.md`

### 4. `.claude/skills/security-orchestrator/references/secret-scanner.md` (and CI/CD Secret Management)
**When to Invoke:**
- When auditing the codebase or git history for hardcoded API keys, passwords, or certificates.
- When configuring `.env` management, secret managers, or pre-commit hooks for secrets.
**Specialized Skills Available:**
- `.claude/skills/security-orchestrator/references/secret-scanning-with-gitleaks-specialist.md`
- `.claude/skills/security-orchestrator/references/secrets-scanning-in-ci-cd-specialist.md`

---

## Orchestration Rules

1. **Analyze:** Understand the attack surface requested by the user (Frontend? Backend API? Git History? Dependencies?).
2. **Invoke:** Call the relevant general SKILL (e.g. `.claude/skills/security-orchestrator/references/api-pentest.md`) OR a specific specialized skill from the Anthropic Cybersecurity library based on the context.
3. **Report:** Provide a detailed security audit report, classifying vulnerabilities by severity (Critical, High, Medium, Low).
4. **Remediate:** Always provide the secure code snippet or configuration to fix the discovered vulnerabilities.

### Common Flow Examples

| User Request | Skills to Invoke (Ordered) |
|---|---|
| "Do a full security audit of this web app" | `.claude/skills/security-orchestrator/references/dependency-audit-gate.md` → `.claude/skills/security-orchestrator/references/secret-scanner.md` → `.claude/skills/security-orchestrator/references/api-security-with-owasp-top-10-pentester.md` → `.claude/skills/security-orchestrator/references/client-security.md` |
| "Check our package.json for vulnerabilities" | `.claude/skills/security-orchestrator/references/dependency-audit-gate.md` and `.claude/skills/security-orchestrator/references/sca-dependency-scanning-with-snyk-specialist.md` |
| "Are we vulnerable to XSS or CSRF?" | `.claude/skills/security-orchestrator/references/for-xss-vulnerabilities-pentester.md` and `.claude/skills/security-orchestrator/references/csrf-attack-simulation-specialist.md` |
| "Review our login endpoint for security flaws" | `.claude/skills/security-orchestrator/references/api-authentication-weaknesses-pentester.md` and `.claude/skills/security-orchestrator/references/jwt-token-security-pentester.md` |

---

## When Not to Invoke
- For basic database schema design, `.claude/skills/code-orchestrator/references/db-architect-security.md` (managed by `code-orchestrator`) can handle standard access control rules.
- If the user asks for generic code cleanups, use `code-orchestrator` with `.claude/skills/code-orchestrator/references/clean-code-reviewer.md`.

---

## Alt Yetenekler

> **Alt yetenekler** `references/` altındadır; Skill tool ile çağrılmazlar. Göreve uyan dosyayı Read ile yükle, gerisini yükleme.

| Dosya | Ne zaman |
|---|---|
| `references/api-pentest.md` | Endpoint güvenliği, rate limiting, SQL/NoSQL injection koruması, JWT ve yetkilendirme (authorization) zafiyet testleri. |
| `references/client-security.md` | Frontend güvenliği; XSS, CSRF, Content Security Policy (CSP) header'ları ve DOM tabanlı zafiyetlerin engellenmesi. |
| `references/dependency-audit-gate.md` | Proje bağımlılıklarındaki (npm, pip vb.) CVE zafiyetlerinin taranması, supply chain güvenliği ve versiyon güncellemeleri. |
| `references/secret-scanner.md` | Kod tabanında unutulmuş API key, şifre, sertifika gibi hassas verilerin taranması ve .env yönetimi. |
| `references/master-pentester.md` | Test stratejileri, birim testleri (unit test) ve e2e testler yazmak için yetenek. |
| `references/api-authentication-weaknesses-pentester.md` | API kimlik doğrulama mekanizmalarını; kırık kimlik doğrulama, güvensiz token yönetimi ve brute-force gibi zafiyetlere karşı test eder. |
| `references/api-for-broken-object-level-authorization-pentester.md` | REST ve GraphQL API'lerde Kırık Nesne Seviyesi Yetkilendirme (BOLA/IDOR, OWASP API1:2023) zafiyetlerini test eder. Nesne kimliklerini (ID'le |
| `references/api-for-mass-assignment-vulnerability-pentester.md` | API'lerde toplu atama (mass assignment) zafiyetlerini test eder. (OWASP API3:2023). Kayıt, profil veya nesne oluşturma uç noktalarında belge |
| `references/api-security-with-owasp-top-10-pentester.md` | REST, GraphQL ve gRPC API uç noktalarını OWASP API Security Top 10 (2023) standartlarına göre sistemli olarak değerlendirir. Burp Suite ve P |
| `references/cors-misconfiguration-pentester.md` | Güvenlik testleri sırasında, yetkisiz alanlar arası (cross-domain) veri erişimine ve kimlik bilgisi hırsızlığına olanak tanıyan Cross-Origin |
| `references/csrf-attack-simulation-specialist.md` | Yetkili güvenlik değerlendirmeleri sırasında onaylanmış kullanıcı oturumlarını istismar eden sahte istekler oluşturarak, web uygulamalarını  |
| `references/for-broken-access-control-pentester.md` | Web uygulamaları ve API'leri Kırık Erişim Kontrolü (OWASP A01:2021) açısından test eder. Yetki yükseltme, eksik fonksiyon seviyesi kontrolle |
| `references/for-json-web-token-vulnerabilities-pentester.md` | JWT uygulamalarında algoritma karmaşası, 'none' algoritması atlatması, kid/jku parametre enjeksiyonu ve zayıf gizli anahtar (secret) zafiyet |
| `references/for-xss-vulnerabilities-pentester.md` | Web uygulamalarında Reflected, Stored ve DOM tabanlı XSS (Cross-Site Scripting) zafiyetlerini test eder. Burp Suite ve tarayıcı araçlarıyla  |
| `references/graphql-security-assessment-specialist.md` | GraphQL API uç noktalarını introspection (içe bakış) sızıntıları, enjeksiyon saldırıları, yetkilendirme hataları ve servis dışı bırakma (DoS |
| `references/jwt-token-security-pentester.md` | JSON Web Token (JWT) uygulamalarını kriptografik zayıflıklar, algoritma karmaşası ve yetkilendirme atlama zafiyetlerine karşı güvenlik testl |
| `references/mobile-api-authentication-pentester.md` | Mobil uygulama API'lerindeki kimlik doğrulama ve yetkilendirme mekanizmalarını test ederek kırık kimlik doğrulama, güvensiz token yönetimi,  |
| `references/oauth2-implementation-flaws-pentester.md` | OAuth 2.0 ve OpenID Connect uygulamalarını yetkilendirme kodu yakalama, yönlendirme (redirect URI) manipülasyonu, CSRF, token sızıntısı ve P |
| `references/sca-dependency-scanning-with-snyk-specialist.md` | CI/CD süreçlerinde zafiyetli açık kaynaklı bağımlılıkları tespit etmek için Snyk ile Yazılım Bileşimi Analizi (SCA) uygulanmasını sağlar. Ot |
| `references/scanning-containers-with-trivy-in-cicd.md` | CI/CD süreçlerine Aqua Security Trivy tarayıcısını entegre ederek işletim sistemi paketlerindeki, bağımlılıklardaki CVE'leri, Dockerfile hat |
| `references/secret-scanning-with-gitleaks-specialist.md` | Git repolarında hardcode edilmiş (gömülü) hassas verileri ve şifreleri bulup engellemek için Gitleaks'i entegre eder. Pre-commit hook yapıla |
| `references/secrets-scanning-in-ci-cd-specialist.md` | Dağıtım öncesinde sızdırılmış şifreleri, anahtarları ve hassas verileri tespit etmek için gitleaks ve trufflehog araçlarını CI/CD süreçlerin |
