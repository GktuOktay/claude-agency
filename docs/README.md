# 📚 Claude Agency — Dokümantasyon Merkezi

Claude Agency sisteminin tüm mimari, ajan, yetenek ve konfigürasyon referansları aşağıda listelenmiştir.

> 🌐 **Dil Politikası:** Bu dizindeki dokümantasyon ve ajan personoları, `CLAUDE.md`'deki temel kurala uygun olarak **Türkçe** hazırlanmıştır (kod blokları ve teknik terminoloji evrensel İngilizce'dir). Genel açık kaynak katkıcıları için kök dizindeki `README.md` ve `CONTRIBUTING.md` İngilizce olarak sunulmaktadır.

---

## 🗺️ Canlı Görsel Harita
- **[Interactive Agency Map (Canlı Web)](https://gktuoktay.github.io/claude-agency/agency-map.html)** — Tüm ajan ve yetenek ilişkilerini interaktif olarak görselleştiren harita.

---

## 🏛️ Mimari & Süreç Akışları

| Doküman | Açıklama |
|---|---|
| **[architecture.md](architecture.md)** | Sistem genel akışı, orkestrasyon katmanları, hook ve gate kuralları, yasaklı anti-pattern'ler. |
| **[flow-diagram.md](flow-diagram.md)** | Yaşam döngüsü, delegasyon karar matrisi ve uçtan uca görev işletim akışları. |

---

## 📦 Referans Katalogları

| Doküman | Açıklama |
|---|---|
| **[agents.md](agents.md)** | 38 uzman subagent'ın detaylı görev, araç ve delegasyon kılavuzu (Teknik, Kalite, Ürün, Destek). |
| **[skill-catalog.md](skill-catalog.md)** | 139 skill'in kategorize edilmiş tam envanteri (Orkestratörler, Uzmanlar, Kalite Kapıları, Pentest). |

---

## ⚙️ Yapılandırma & Entegrasyon

| Doküman | Açıklama |
|---|---|
| **[hooks.md](hooks.md)** | Claude Code tool-call seviyesindeki PreToolUse, PostToolUse ve Stop hook kuralları. |
| **[mcp.md](mcp.md)** | PostgreSQL, Filesystem, Brave Search, Playwright ve MS Learn MCP sunucu yapılandırmaları. |
| **[memory-guide.md](memory-guide.md)** | Claude Code kalıcı proje hafıza sistemi (`MEMORY.md`) kurulum ve kullanım rehberi. |

---

## 📂 Dizin Yapısı

```
docs/
├── README.md            # Bu rehber (Dokümantasyon Merkezi)
├── index.html           # GitHub Pages yönlendirici
├── agency-map.html      # Canlı interaktif mimari harita
├── architecture.md      # Sistem mimarisi & anti-pattern standartları
├── flow-diagram.md      # Yaşam döngüsü ve akış şemaları
├── agents.md            # 38 subagent referansı
├── skill-catalog.md     # 139 skill kataloğu
├── hooks.md             # Hook sistemi ve regex kuralları
├── mcp.md               # Model Context Protocol (MCP) ayarları
└── memory-guide.md      # Kalıcı hafıza yönetim kılavuzu
```
