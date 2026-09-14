# Hooks Referansı

Claude Code'un hook sistemi — tool çağrısı seviyesinde kalite kontrolü.

## Neden Hook?

Skill'ler ve gate'ler prompt bazlı çalışır — Claude dikkate alabilir ya almayabilir.
Hook'lar **shell komutu** çalıştırır: Claude'un kararından bağımsız, garantili yürütme.

## Mevcut Hook'lar

### `PreToolUse[Bash]` — Yasak Pattern Bloklayıcı

```
Tetiklenir: Her Bash tool çağrısından önce
Bloklar:    DateTime.Now  →  DateTimeOffset.UtcNow kullan
            rm -rf        →  onay al
            DROP TABLE    →  migration kullan
Sonuç:      exit 1 → Claude engellenir, kullanıcıya hata raporu
```

### `PreToolUse[Write|Edit]` — Güvenlik Uyarısı

```
Tetiklenir: Her Write/Edit tool çağrısından önce
Uyarır:     DateTime.Now (non-Offset kullanım)
            password = "..." (hardcoded)
Sonuç:      stderr uyarı — engellemez, bilgilendirir
```

### `PostToolUse[Write|Edit]` — Build Hatırlatması

```
Tetiklenir: .cs uzantılı dosya yazıldıktan sonra
Mesaj:      "dotnet build" çalıştırılmasını hatırlatır
Sonuç:      stderr bilgilendirme
```

### `Stop` — Oturum Bildirimi

```
Tetiklenir: Claude oturumu kapandığında
Mesaj:      "[Autonomous Agency] Claude oturumu tamamlandı."
```

## Hook Ekleme

`.claude/settings.json` içinde `hooks` bölümüne ekle:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [{
          "type": "command",
          "command": "bash -c '...kontrol komutu...'"
        }]
      }
    ]
  }
}
```

**Matcher seçenekleri:** `Bash`, `Write`, `Edit`, `Read`, `*` (tümü)
**Event tipleri:** `PreToolUse`, `PostToolUse`, `Stop`, `SubagentStop`

## Hook Hata Kodları

| Exit kodu | Davranış |
|---|---|
| `0` | Devam et |
| `1` | Tool çağrısını engelle (PreToolUse) |
| Diğer | Uyarı logla, devam et |
