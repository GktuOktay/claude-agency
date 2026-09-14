# MCP Server Referansı

Model Context Protocol — Claude Code'un dış sistemlere native erişimi.

## Mevcut Server'lar

### `microsoft-learn` *(Her zaman aktif)*
```
URL:    https://learn.microsoft.com/api/mcp
Tip:    Remote (API key gerektirmez)
Amaç:  .NET 10, EF Core 9+, ASP.NET Core 10, Azure resmi dokümantasyon
```

Kullanım örneği:
> "DateTimeOffset ve TimeProvider farkını .NET 10 dokümantasyonundan göster"

---

### `postgres`
```
Paket:  @modelcontextprotocol/server-postgres
Env:    POSTGRES_CONNECTION_STRING
Amaç:  DB schema okuma, query çalıştırma, migration doğrulama
```

Kullanım örneği:
> "Users tablosunun mevcut şemasını göster"
> "Bu migration'ı çalıştırmadan önce etkilenen tabloları listele"

---

### `filesystem`
```
Paket:  @modelcontextprotocol/server-filesystem
Env:    PROJECT_ROOT
Amaç:  Proje dışı dizin erişimi (monorepo, shared kütüphane)
```

---

### `brave-search`
```
Paket:  @modelcontextprotocol/server-brave-search
Env:    BRAVE_API_KEY
API:    brave.com/search/api (ücretsiz tier: 2000 sorgu/ay)
Amaç:  CVE araştırması, kütüphane alternatif karşılaştırması
```

---

## Kurulum

```bash
# Otomatik (setup.sh ile)
./setup.sh

# Manuel — .env dosyasına ekle
POSTGRES_CONNECTION_STRING=postgresql://user:pass@localhost/dbname
PROJECT_ROOT=/path/to/project
BRAVE_API_KEY=your-key
```

## MCP Ekleme

`.claude/settings.json` içine:

```json
{
  "mcpServers": {
    "yeni-server": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-xxx"],
      "env": { "API_KEY": "${API_KEY}" }
    }
  }
}
```

Remote server için:
```json
{
  "mcpServers": {
    "remote-server": {
      "type": "url",
      "url": "https://api.example.com/mcp"
    }
  }
}
```
