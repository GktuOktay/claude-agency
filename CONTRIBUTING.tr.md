# 🤝 Katkıda Bulunma Rehberi

🌐 [English](CONTRIBUTING.md) · **Türkçe**

**Claude Agency** projesine katkıda bulunmak istediğiniz için teşekkür ederiz! Yüksek mühendislik standartlarını korumak ve çoklu ajan orkestrasyonunu kusursuz tutmak için lütfen aşağıdaki yönergeleri izleyin.

---

## 🚀 Nasıl Katkıda Bulunabilirsiniz?

1. Projeyi GitHub üzerinde **Fork** edin.
2. `main` dalından yeni bir özellik dalı (feature branch) oluşturun:
   ```bash
   git checkout -b feature/yeni-guvenlik-skilli
   ```
3. Değişikliklerinizi [Conventional Commits](https://www.conventionalcommits.org/) standartlarına uygun olarak commit'leyin:
   ```bash
   git commit -m "feat(skill): yeni güvenlik denetim skilli eklendi"
   ```
4. Kendi fork'unuza push'layın:
   ```bash
   git push origin feature/yeni-guvenlik-skilli
   ```
5. `main` dalına yönelik bir **Pull Request (PR)** açın.

---

## 🛠️ Yeni Bir Skill (Beceri) Ekleme

Tüm skill'ler `.claude/skills/<skill-adi>/SKILL.md` dizininde yer alır. Her skill kesinlikle dosyanın ilk satırında geçerli bir YAML frontmatter ile başlamalıdır:

```markdown
---
name: skill-adi
description: "Tetiklenme koşulunu ve yeteneğini açıklayan tek cümlelik özet."
alwaysApply: false
---

# Beceri Başlığı

Yönerge adımları, teknik standartlar ve kontrol listeleri...
```

### Skill Standartları:
- **Eksiksiz Çıktı (Zero Truncation)**: Asla `...` veya `// kodun geri kalanı aynı` gibi tembel ifadeler ve yer tutucular kullanmayın.
- **Anti-Sycophancy**: Boş övgüden uzak, objektif ve yapıcı teknik eleştiri ilkesine bağlı kalın.
- **Frontmatter**: Dosyanın 1. satırı kesinlikle `---` ile başlamalıdır.

---

## 🤖 Alt Ajan (Subagent) Ekleme veya Düzenleme

Subagent tanımları `.claude/agents/<ajan-adi>.md` dizininde yer alır. Her tanım şunları içermelidir:
1. **Frontmatter**: `name`, `description`, `model` ve izinli `tools`.
2. **Persona ve Kapsam**: Uzmanlık alanının net sınırları (.NET, React, Swift, Güvenlik vb.).
3. **Zorunlu Kurallar**: Görev sınırları, anti-pattern yasakları ve çıktı formatı.

---

## 📝 Commit Standartları

[Conventional Commits](https://www.conventionalcommits.org/) kuralları geçerlidir:

| Tip | Tanım |
|---|---|
| `feat:` | Yeni bir skill, agent veya özellik eklendiğinde |
| `fix:` | Bir prompt veya betik hatası düzeltildiğinde |
| `docs:` | Yalnızca dokümantasyon güncellendiğinde |
| `refactor:` | Davranış değişmeden prompt/yapı sadeleştirildiğinde |
| `chore:` | CI/CD, araç veya bağımlılık güncellemelerinde |

---

## 🚦 Pull Request Kontrol Listesi

PR göndermeden önce şunları doğrulayın:
- [ ] Tüm `SKILL.md` dosyaları `---` YAML frontmatter ile başlıyor.
- [ ] Hiçbir agent tanım dosyası boş değil.
- [ ] Sayı değiştiyse `docs/skill-catalog.md` ve `docs/agents.md` güncellendi.
- [ ] GitHub Actions CI testleri başarıyla geçti.

---

## 📜 Davranış Kuralları

Tüm katılımcılar [Code of Conduct](CODE_OF_CONDUCT.md) belgesindeki kurallara uymakla yükümlüdür.
