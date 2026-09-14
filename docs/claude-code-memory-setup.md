# Claude Code Memory Sistemi Kurulumu

Claude Code, proje başına kalıcı memory destekliyor. Bu sayede mimari kararlar, teknik borç notları ve onboarding bağlamı oturumlar arasında korunur.

## Dosya Yolu

```
~/.claude/projects/<proje-path-hash>/memory/
```

Her proje için ayrı memory namespace oluşturulur.

## Memory Türleri

| Tür | Ne Zaman | Örnek |
|---|---|---|
| `user` | Kullanıcı rolü/tercihleri değiştiğinde | "Principal Architect, .NET uzmanı" |
| `feedback` | Yaklaşım düzeltmesi/onayı | "Mock DB yasak — TestContainers kullan" |
| `project` | Mimari karar, deadline, kısıt | "Auth middleware yasal uyum nedeniyle yeniden yazılıyor" |
| `reference` | Dış sistem referansları | "Linear INGEST projesi: pipeline bug'ları" |

## MEMORY.md Index Formatı

Her proje memory klasöründe `MEMORY.md` index dosyası bulunur:

```markdown
- [Proje Mimarisi](project-arch.md) — Clean Architecture, CQRS, .NET 8 kararları
- [Teknik Borç](tech-debt.md) — Bilinen borçlar ve öncelik sırası
- [Feedback](feedback-rules.md) — Yaklaşım kuralları ve geçmiş düzeltmeler
```

## Bu Proje İçin Önerilen Memory Dosyaları

### `project-arch.md`
Mimari kararlar: hangi pattern seçildi ve neden.

### `tech-debt.md`  
Bilinen teknik borçlar, önceliklendirilmiş liste.

### `feedback-rules.md`
Geçmiş oturumlardaki düzeltmeler — aynı hatayı tekrar yapma.

### `onboarding.md`
Yeni proje başlarken Claude'a verilecek bağlam özeti.

## Kullanım

Claude oturumu açıldığında otomatik yüklenir. Elle kaydetmek için:
> "Bunu hatırla: [bilgi]" → Claude memory dosyasına yazar.
> "Unut: [konu]" → İlgili memory silinir.
