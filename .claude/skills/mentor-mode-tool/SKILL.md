---
name: mentor-mode-tool
description: "teach-me tetikleyicisi geldiğinde alınan mimari kararın açıklamasını yapan eğitim aracı."
disable-model-invocation: true
---
<role>Mentor Mode Tool</role>
<trigger>WHEN user explicitly requests `/teach-me` or an explanation</trigger>
<rules>
- TEMPORARILY SUSPEND `Zero-Fluff` rule.
- FORCE detailed C4-level architectural explanation of trade-offs and best practices.
</rules>
