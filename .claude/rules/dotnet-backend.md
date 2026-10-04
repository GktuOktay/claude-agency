---
paths:
  - "**/*.cs"
  - "**/*.csproj"
---

# Backend (.NET) Kalite Kapıları

İhlal eden kodu reddet, düzeltilmiş halini yaz.

**Veri & Domain**
- Audit: durum değiştiren entity → `IAuditableEntity` (`CreatedBy`, `ModifiedAt`) veya Temporal Table. Eksikse reddet.
- Tenant: SaaS sorgularında açık `TenantId` filtresi; EF Core Global Query Filter kullan. Eksikse reddet.
- Zaman: `DateTime.Now` / yerel saat yasak → `DateTimeOffset.UtcNow` veya `TimeProvider`.
- Durum geçişleri (Pending → Paid → Shipped): gevşek `if/else` veya ham enum atama yasak → açık FSM.
- Ubiquitous Language: isimlendirme projenin Domain Glossary'sine uymalı; her entity tek isim.
- Entity kaydı + event yayını: dual-write yasak → Outbox Pattern (DB'ye transaction ile yaz, arka plan worker yayınlasın).

**Doğrulama (3 katman)**
- DB: `NOT NULL`, `MaxLength`, `Unique`, doğru FK cascade. İş gerekçesiz sınırsız string (`varchar(max)`) → reddet.
- API: DTO/Command iş mantığından önce `FluentValidation` ile doğrulanır; `ArgumentNullException.ThrowIfNull`. Ham sistem exception'ı (`SqlException`) kullanıcıya sızmaz.
- Client tarafı kuralları için bkz. frontend kuralları.

**Konfigürasyon & Hata**
- `_configuration["Key"]` doğrudan okuma yasak → `IOptions<T>` + DataAnnotations (`[Required]`), başlangıçta doğrula.
- Hata yanıtı: RFC 7807 `ProblemDetails`, Global Exception Handler. Serbest string / rastgele JSON yasak.
- Server-side session (`HttpContext.Session`, static in-memory state) yasak → stateless JWT veya Redis.

**Loglama & Gizlilik**
- Şifre, TCKN, kart no loglanmaz; maskele (`***`) veya hash'le.
- Başarılı (200) isteklerde tam request/response body loglama; sadece metadata (Method, Path, StatusCode, Duration, UserID). Exception loglarında payload olabilir.
- Diagnostic/exception logları asenkron yazılır, ana OLTP tablolarına değil. Security/Audit logları immutable.
- Kullanıcı aktivite logu yerelleştirilmiş string tutmaz → `ActionType` (`ORDER_UPDATED`) + JSON metadata.

**Dayanıklılık**
- Sadece happy-path yasak: dış çağrılarda 503/429/timeout/null senaryosu ele alınır. Karmaşık algoritma / entegrasyon / PR öncesi pre-mortem: "Prodüksiyonda patlarsa neden patlar?" Bellek sızıntısı, race condition, unhandled rejection kontrolü.
- Harici LLM çıktısı doğrulanmadan parse edilmez → şema doğrulama (FluentValidation/Zod) + otomatik düzeltme denemesi.
