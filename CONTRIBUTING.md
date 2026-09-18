# Contributing Guidelines

Bu projeye katkıda bulunmak istediğiniz için teşekkür ederiz! Lütfen aşağıdaki yönergeleri izleyin.

## How to Contribute
1. Projeyi fork'layın.
2. Yeni bir branch oluşturun (`git checkout -b feature/yeni-ozellik`).
3. Değişikliklerinizi yapın.
4. Commit'leyin (`git commit -m 'feat: yeni özellik eklendi'`).
5. Branch'inize push'layın (`git push origin feature/yeni-ozellik`).
6. Pull Request (PR) oluşturun.

## Skill Ekleme Rehberi
Yeni bir skill eklerken, `SKILL.md` formatında olmalı ve başında aşağıdaki gibi bir YAML frontmatter içermelidir:
```yaml
---
name: Skill_Name
description: Skill'in kısa açıklaması
---
```
İçerik kısmında skill'in ne işe yaradığını ve nasıl kullanılacağını açıklayın.

## Agent Ekleme Rehberi
Yeni bir agent eklerken, agent'ın markdown dosyası boş olmamalıdır. Agent'ın amacını, kullandığı skill'leri ve davranışlarını net bir şekilde belirtin.

## Commit Standartları
Projeye katkıda bulunurken [Conventional Commits](https://www.conventionalcommits.org/) standartlarını kullanıyoruz. Örnek commit mesajları:
- `feat:` (Yeni bir özellik eklendiğinde)
- `fix:` (Bir hata düzeltildiğinde)
- `docs:` (Sadece dökümantasyon değişiklikleri yapıldığında)
- `chore:` (Build süreci, araçlar vs. güncellendiğinde)

## Pull Request (PR) Kuralları
- PR açıklamasını eksiksiz doldurun.
- Varsa ilgili issue'ları linkleyin.
- Kodunuzun mevcut mimari ve kodlama standartlarına uygun olduğundan emin olun.
- PR şablonundaki kontrol listesini tamamlayın.

## Code of Conduct
Tüm katkıcılar [Code of Conduct](CODE_OF_CONDUCT.md) belgesindeki kurallara uymakla yükümlüdür.
