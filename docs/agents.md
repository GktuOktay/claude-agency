# Subagent Referansı

Claude Code'un native subagent sistemi ile ağır görevler izole, doğru modelle çalışır.

## Ne Zaman Subagent Kullanılır?

- 3'ten fazla dosya değiştirecek görevler
- Domain uzmanlığı gerektiren işler (pentest, .NET mimari, K8s)
- Ana context window'u kirletmemek istediğinde
- Paralel yürütme gereken bağımsız görevler

## Agent Tanımları

### `backend-specialist`
**Model:** `claude-sonnet-4-6`
**Tools:** Read, Edit, Write, Bash

.NET 10, EF Core 9+, Clean Architecture, CQRS, MediatR uzmanı.

**Delegasyon tetikleyicileri:**
- Yeni entity / domain model tasarımı
- EF Core migration yazımı
- Repository / service katmanı implementasyonu
- CQRS command/query handler

**Kaynak önceliği:** microsoft-learn MCP → dotnet/dotnet GitHub → dotnet/aspnetcore GitHub

---

### `security-specialist`
**Model:** `claude-sonnet-4-6`
**Tools:** Read, Bash, WebSearch

OWASP Top 10, JWT, OAuth2, API güvenliği uzmanı. Read-only analiz + raporlama.

**Delegasyon tetikleyicileri:**
- Pentest / güvenlik değerlendirmesi talebi
- Auth/AuthZ implementasyonu review
- OWASP uyumluluk kontrolü

**Çıktı formatı:** `[KRITIK|YÜKSEK|ORTA|DÜŞÜK] bulgu → PoC → Fix`

---

### `test-engineer`
**Model:** `claude-sonnet-4-6`
**Tools:** Read, Edit, Write, Bash

xUnit, NUnit, TestContainers, Playwright, k6 uzmanı.

**Delegasyon tetikleyicileri:**
- Unit / integration / E2E test yazımı
- TDD kılavuzu
- Test coverage analizi

**Kural:** Mock DB yasak — TestContainers zorunlu.

---

### `devops-engineer`
**Model:** `claude-sonnet-4-6`
**Tools:** Read, Edit, Write, Bash

GitHub Actions, Docker, Kubernetes, Terraform, Azure/AWS uzmanı.

**Delegasyon tetikleyicileri:**
- CI/CD pipeline tasarımı
- Container image oluşturma
- IaC (Terraform/Bicep) yazımı
- Zero-downtime deployment

---

### `code-reviewer`
**Model:** `claude-sonnet-4-6`
**Tools:** Read, Bash *(Read-only — kod yazmaz)*

Kod kalite denetimi. Her bulgu satır numarasıyla raporlanır.

**Delegasyon tetikleyicileri:**
- PR review talebi
- Refactor öncesi kalite denetimi
- Mimari uyumluluk kontrolü

**Çıktı formatı:** `L{n}: [🔴CRITICAL|🟡WARN|🔵INFO] kategori: sorun → Fix: çözüm`

---

## Model Değiştirme

```bash
# Tek agent için
sed -i 's/model: claude-sonnet-4-6/model: claude-opus-5/' .claude/agents/backend-specialist.md

# Tüm agentlar için
./setup.sh
```
