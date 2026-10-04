# Caveman Optimizer

Ultra-compressed output modu. Gereksiz kelime yok, sadece teknik içerik.

## Tetikleyiciler

| Komut | Davranış |
|-------|----------|
| `/caveman` | Tüm yanıtlarda maksimum sıkıştırma |
| `/commit` | Conventional Commits formatında commit mesajı üret |
| `/review` | Tek satır, aksiyonlu kod inceleme yorumları |
| `/caveman-stats` | AI istatistiklerini göster (yalnızca bu komutla) |

## Kurallar

- Konuşma dolgusu (fluff) → **tamamen silinir**
- Commit mesajı → `feat:` / `fix:` + max 50 karakter
- Kod inceleme → `L42: 🔴 bug: ... Fix by ...` formatı
- AI istatistikleri → yalnızca `/caveman-stats` ile çıkar
- Token sıkıştırması → teknik doğruluk korunarak maksimum

## Örnek Çıktılar

**Commit:**
```
feat: add user auth via JWT
```

**Code Review:**
```
L12: 🔴 bug: null check missing. Fix by adding `if (!user) return`.
L34: 🟡 perf: O(n²) loop. Fix by using Map.
```
