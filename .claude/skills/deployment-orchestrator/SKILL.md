---
name: deployment-orchestrator
description: "Deployment, CI/CD, altyapı yönetimi (IaC) ve bulut süreçlerini yöneten ana orkestratör. Gerektiğinde alt skill'leri otomatik çağırır."
---

# Deployment Orchestrator — Deployment & Infrastructure Manager

You are an orchestrator. Analyze the user's request related to deployment, hosting, infrastructure, or CI/CD, determine which of the sub-skills below are required, and **automatically invoke them**. You can use multiple skills sequentially or in parallel.

---

## Sub-Skills You Manage

### 1. `.claude/skills/deployment-orchestrator/references/ci-cd-engineer.md`
**When to Invoke:**
- When setting up or modifying a CI/CD pipeline (GitHub Actions, GitLab CI, Jenkins).
- When automating tests, builds, and deployments on code push.

### 2. `.claude/skills/deployment-orchestrator/references/iac-architect.md`
**When to Invoke:**
- When writing Terraform, Pulumi, or Ansible code.
- When provisioning cloud infrastructure (AWS, GCP, Azure) declaratively.

### 3. `.claude/skills/deployment-orchestrator/references/container-master.md`
**When to Invoke:**
- When creating or optimizing a `Dockerfile`.
- When designing Kubernetes (K8s) manifests or Helm charts.
- When handling container orchestration and scaling configurations.

### 4. `.claude/skills/deployment-orchestrator/references/gitops-manager.md`
**When to Invoke:**
- When setting up Argo CD or Flux for Kubernetes.
- When applying GitOps principles for continuous deployment.

### 5. `.claude/skills/deployment-orchestrator/references/cloud-deployer.md`
**When to Invoke:**
- When deploying a frontend/fullstack app to Vercel, Netlify, or Cloudflare Pages.
- When configuring Serverless Framework, AWS Lambda, or AWS CDK.

### 6. `.claude/skills/deployment-orchestrator/references/observability-setup.md`
**When to Invoke:**
- When setting up monitoring, metrics, or logging (Prometheus, Grafana, ELK Stack, Datadog).
- When configuring alerts for system health.

---

## Orchestration Rules

1. **Analyze:** Read the user's request. Which deployment sub-skills are needed?
2. **Order:** Determine the dependencies. e.g., Dockerfile (`.claude/skills/deployment-orchestrator/references/container-master.md`) first → then GitHub Actions (`.claude/skills/deployment-orchestrator/references/ci-cd-engineer.md`).
3. **Invoke:** Read the relevant SKILL.md file and act according to its instructions.
4. **Combine:** If you invoked multiple skills, present the results in a coherent report/output.
5. **Feedback:** Briefly inform the user about which skills you used and why.

### Common Flow Examples

| User Request | Skills to Invoke (Ordered) |
|---|---|
| "Next.js projesini Vercel'a atalım ve action yazalım" | `.claude/skills/deployment-orchestrator/references/ci-cd-engineer.md` → `.claude/skills/deployment-orchestrator/references/cloud-deployer.md` |
| "AWS'de EKS kurup ArgoCD ile bağlayalım" | `.claude/skills/deployment-orchestrator/references/iac-architect.md` → `.claude/skills/deployment-orchestrator/references/gitops-manager.md` |
| "Dockerfile yaz ve GitLab CI ile build al" | `.claude/skills/deployment-orchestrator/references/container-master.md` → `.claude/skills/deployment-orchestrator/references/ci-cd-engineer.md` |

---

## Alt Yetenekler

> **Alt yetenekler** `references/` altındadır; Skill tool ile çağrılmazlar. Göreve uyan dosyayı Read ile yükle, gerisini yükleme.

| Dosya | Ne zaman |
|---|---|
| `references/ci-cd-engineer.md` | Sürekli entegrasyon ve dağıtım (CI/CD) pipeline'ları kurma uzmanı. GitHub Actions, GitLab CI ve Jenkins için yapılandırmalar oluşturur. |
| `references/container-master.md` | Konteynerleştirme ve orkestrasyon uzmanı. Dockerfile yazımı, optimizasyonu ve Kubernetes (K8s) / Helm yapılandırmaları. |
| `references/iac-architect.md` | Altyapının kod olarak yönetimi (IaC). Terraform, Pulumi ve Ansible kullanarak bulut ve sunucu altyapısını tasarlar. |
| `references/gitops-manager.md` | ArgoCD ve Flux ile Kubernetes üzerinde GitOps tabanlı sürekli dağıtım (CD) süreçlerini yönetir. |
| `references/cloud-deployer.md` | Vercel, Netlify, Cloudflare, Serverless Framework gibi platformlara hızlı ve zero-config dağıtım süreçlerini yönetir. |
| `references/observability-setup.md` | Sistem izleme, loglama ve metrik toplama (Prometheus, Grafana, ELK, Datadog) altyapılarını kurar. |
| `references/zero-downtime-deployment-strategist.md` | Güncellemelerde Expand & Contract desenini dayatan kesintisiz deployment uzmanı. |
