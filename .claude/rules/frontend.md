---
paths:
  - "**/*.{ts,tsx,js,jsx,vue,svelte,dart}"
---

# Frontend Kalite Kapıları

**Doğrulama (client katmanı)**
- Formlarda client-side doğrulama (`Zod`, `Yup`). Ham teknik mesaj ("String must contain 8 characters") yasak → yerelleştirilmiş, kullanıcı dostu mesaj.
- API 400 yanıtları doğru input alanına bağlanır.

**Graceful degradation**
- API hatasında boş ekran / yakalanmamış 500 yasak → fallback UI (skeleton, cache'lenmiş durum, error boundary).

**Performans (60fps)**
- Main thread'de ağır senkron iş yasak (client-side PDF, 10MB JSON parse, görüntü işleme, devasa döngü) → Web Worker, Wasm veya backend'e it.
- Büyük dosyalar state'e (Redux/Zustand) yüklenmez → `ReadableStream` / chunk. Binlerce kayıt dönen API'de sayfalama veya infinite scroll zorunlu.
- Bundle: tüm `lodash` / `moment.js` import'u yasak → tree-shakable import (`lodash/debounce`), `Intl`, `date-fns`.
- Gereksiz re-render yasak: ağır hesaplarda `useMemo`/`useCallback`, yerel değişiklik için global render tetikleme.

**Dış LLM çıktısı**
- Doğrulanmadan parse edilmez → `Zod` şema + yeniden deneme.
