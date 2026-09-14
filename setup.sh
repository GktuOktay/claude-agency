#!/usr/bin/env bash
set -e

AGENTS_DIR=".claude/agents"
SETTINGS_FILE=".claude/settings.json"
ENV_FILE=".env"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

echo ""
echo -e "${BOLD}╔══════════════════════════════════════╗${RESET}"
echo -e "${BOLD}║       Claude Agency — Kurulum        ║${RESET}"
echo -e "${BOLD}╚══════════════════════════════════════╝${RESET}"
echo ""

# ── Model Seçimi ──────────────────────────────────────────────
echo -e "${CYAN}${BOLD}[ 1 / 3 ] Model Seçimi${RESET}"
echo ""
echo "  1) claude-sonnet-4-6   — Varsayılan · Maliyet odaklı (~15x ucuz)"
echo "  2) claude-opus-5       — Maksimum kalite · Karmaşık mimari kararlar"
echo "  3) Karma               — Güvenlik+Backend → Opus 5 · Diğerleri → Sonnet 4.6"
echo ""
read -p "  Seçim [1]: " model_choice
model_choice="${model_choice:-1}"

case "$model_choice" in
  1)
    DEFAULT_MODEL="claude-sonnet-4-6"
    SECURITY_MODEL="claude-sonnet-4-6"
    BACKEND_MODEL="claude-sonnet-4-6"
    echo -e "  ${GREEN}✓ Tüm agentlar: claude-sonnet-4-6${RESET}"
    ;;
  2)
    DEFAULT_MODEL="claude-opus-5"
    SECURITY_MODEL="claude-opus-5"
    BACKEND_MODEL="claude-opus-5"
    echo -e "  ${GREEN}✓ Tüm agentlar: claude-opus-5${RESET}"
    ;;
  3)
    DEFAULT_MODEL="claude-sonnet-4-6"
    SECURITY_MODEL="claude-opus-5"
    BACKEND_MODEL="claude-opus-5"
    echo -e "  ${GREEN}✓ Karma: security + backend → Opus 5 · diğerleri → Sonnet 4.6${RESET}"
    ;;
  *)
    echo -e "  ${YELLOW}Geçersiz seçim, varsayılan kullanılıyor: claude-sonnet-4-6${RESET}"
    DEFAULT_MODEL="claude-sonnet-4-6"
    SECURITY_MODEL="claude-sonnet-4-6"
    BACKEND_MODEL="claude-sonnet-4-6"
    ;;
esac

# Agent dosyalarını güncelle
sed -i.bak "s/model: .*/model: $DEFAULT_MODEL/" "$AGENTS_DIR/test-engineer.md"
sed -i.bak "s/model: .*/model: $DEFAULT_MODEL/" "$AGENTS_DIR/devops-engineer.md"
sed -i.bak "s/model: .*/model: $DEFAULT_MODEL/" "$AGENTS_DIR/code-reviewer.md"
sed -i.bak "s/model: .*/model: $SECURITY_MODEL/" "$AGENTS_DIR/security-specialist.md"
sed -i.bak "s/model: .*/model: $BACKEND_MODEL/" "$AGENTS_DIR/backend-specialist.md"
rm -f "$AGENTS_DIR"/*.bak

echo ""

# ── MCP Seçimi ────────────────────────────────────────────────
echo -e "${CYAN}${BOLD}[ 2 / 3 ] MCP Server Seçimi${RESET}"
echo ""
echo "  Microsoft Learn aktif (API key gerektirmez) — varsayılan: EVET"
echo ""

POSTGRES_CONN=""
PROJECT_ROOT_VAL=""
BRAVE_KEY=""

read -p "  PostgreSQL MCP aktif edilsin mi? [e/H]: " pg_choice
if [[ "$pg_choice" =~ ^[Ee]$ ]]; then
  read -p "    POSTGRES_CONNECTION_STRING: " POSTGRES_CONN
fi

read -p "  Filesystem MCP aktif edilsin mi? [e/H]: " fs_choice
if [[ "$fs_choice" =~ ^[Ee]$ ]]; then
  read -p "    PROJECT_ROOT (dizin yolu): " PROJECT_ROOT_VAL
fi

read -p "  Brave Search MCP aktif edilsin mi? [e/H]: " brave_choice
if [[ "$brave_choice" =~ ^[Ee]$ ]]; then
  read -p "    BRAVE_API_KEY: " BRAVE_KEY
fi

read -p "  Playwright MCP kurulsun mu? (E2E test / web scraping) [E/h]: " pw_choice
pw_choice="${pw_choice:-E}"
PLAYWRIGHT_INSTALLED=false
if [[ "$pw_choice" =~ ^[Ee]$ ]]; then
  echo "  Playwright browser'ları kuruluyor..."
  if npx @playwright/mcp --version &>/dev/null; then
    npx playwright install chromium --quiet 2>/dev/null && \
      echo -e "  ${GREEN}✓ Playwright MCP + Chromium kuruldu${RESET}" && PLAYWRIGHT_INSTALLED=true || \
      echo -e "  ${YELLOW}⚠ Playwright kurulumunda hata — manuel: npx playwright install${RESET}"
  else
    echo -e "  ${YELLOW}⚠ @playwright/mcp bulunamadı — npm install -g @playwright/test çalıştırın${RESET}"
  fi
fi

echo ""

# ── .env Oluştur ──────────────────────────────────────────────
echo -e "${CYAN}${BOLD}[ 3 / 3 ] Ortam Değişkenleri${RESET}"
echo ""

if [ -n "$POSTGRES_CONN" ] || [ -n "$PROJECT_ROOT_VAL" ] || [ -n "$BRAVE_KEY" ]; then
  read -p "  .env dosyası oluşturulsun mu? [E/h]: " env_choice
  env_choice="${env_choice:-E}"

  if [[ "$env_choice" =~ ^[Ee]$ ]]; then
    {
      echo "# Claude Agency — MCP Ortam Değişkenleri"
      echo "# Bu dosyayı .gitignore'a ekleyin"
      [ -n "$POSTGRES_CONN" ]    && echo "POSTGRES_CONNECTION_STRING=$POSTGRES_CONN"
      [ -n "$PROJECT_ROOT_VAL" ] && echo "PROJECT_ROOT=$PROJECT_ROOT_VAL"
      [ -n "$BRAVE_KEY" ]        && echo "BRAVE_API_KEY=$BRAVE_KEY"
    } > "$ENV_FILE"
    echo -e "  ${GREEN}✓ .env oluşturuldu${RESET}"

    # .gitignore kontrolü
    if ! grep -q "^\.env$" .gitignore 2>/dev/null; then
      echo ".env" >> .gitignore
      echo -e "  ${GREEN}✓ .env → .gitignore'a eklendi${RESET}"
    fi
  fi
fi

# ── Özet ──────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}${BOLD}  ✅ Kurulum tamamlandı${RESET}"
echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo "  Skill sayısı  : $(ls .claude/skills/ | wc -l | tr -d ' ')"
echo "  Agent sayısı  : $(ls .claude/agents/*.md | wc -l | tr -d ' ')"
echo "  Model (varsay): $DEFAULT_MODEL"
[ -n "$POSTGRES_CONN" ]    && echo "  PostgreSQL MCP : ✓"
[ -n "$PROJECT_ROOT_VAL" ] && echo "  Filesystem MCP : ✓"
[ -n "$BRAVE_KEY" ]        && echo "  Brave Search   : ✓"
[ "$PLAYWRIGHT_INSTALLED" = true ] && echo "  Playwright MCP : ✓ (Chromium)"
echo "  MS Learn MCP  : ✓ (her zaman aktif)"
echo ""
echo "  Claude Code'u bu dizinde başlatın:"
echo -e "  ${CYAN}claude${RESET}"
echo ""
