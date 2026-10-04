#!/usr/bin/env python3
"""Sabit token yükü denetimi.

Her oturumda bağlama giren kalemleri tahmin eder:
  - CLAUDE.md (tamamı)
  - model tarafından çağrılabilir skill'lerin name + description satırı
  - agent'ların name + description satırı
  - .claude/rules içinde `paths:` olmayan (koşulsuz yüklenen) dosyalar

Tahmin: karakter / 3.3 (Türkçe ağırlıklı metin). Gerçek tokenizer değildir;
önce/sonra karşılaştırması için tutarlı bir ölçüdür.

Kullanım: python3 scripts/token-audit.py [--budget 4000] [--json]
"""
import argparse, json, re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CPT = 3.3


def est(chars):
    return round(chars / CPT)


def frontmatter(text):
    m = re.match(r"---\n(.*?)\n---\n?", text, re.S)
    return m.group(1) if m else ""


def field(fm, key):
    m = re.search(rf"^{key}:\s*(.*?)(?=^\S|\Z)", fm, re.S | re.M)
    if not m:
        return ""
    v = m.group(1).strip()
    if v[:1] in ">|":
        v = v[1:]
    v = re.sub(r"\s*\n\s*", " ", v).strip().strip("\"'")
    return v


def scan():
    rows = {"claude_md": 0, "skills": [], "agents": [], "rules": []}
    cm = ROOT / "CLAUDE.md"
    if cm.exists():
        rows["claude_md"] = len(cm.read_text())
    for f in sorted((ROOT / ".claude/skills").glob("*/SKILL.md")):
        fm = frontmatter(f.read_text())
        if re.search(r"^disable-model-invocation:\s*true", fm, re.M):
            continue
        n, d = field(fm, "name") or f.parent.name, field(fm, "description")
        rows["skills"].append((n, len(n) + len(d)))
    for f in sorted((ROOT / ".claude/agents").glob("*.md")):
        fm = frontmatter(f.read_text())
        n, d = field(fm, "name") or f.stem, field(fm, "description")
        rows["agents"].append((n, len(n) + len(d)))
    rd = ROOT / ".claude/rules"
    if rd.exists():
        for f in sorted(rd.glob("*.md")):
            t = f.read_text()
            if not re.search(r"^paths:", frontmatter(t), re.M):
                rows["rules"].append((f.name, len(t)))
    return rows


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--budget", type=int, default=0, help="aşılırsa exit 1")
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--top", type=int, default=0)
    a = ap.parse_args()
    r = scan()
    parts = {
        "CLAUDE.md": est(r["claude_md"]),
        f"skill listesi ({len(r['skills'])})": est(sum(c for _, c in r["skills"])),
        f"agent listesi ({len(r['agents'])})": est(sum(c for _, c in r["agents"])),
        f"koşulsuz rules ({len(r['rules'])})": est(sum(c for _, c in r["rules"])),
    }
    total = sum(parts.values())
    if a.json:
        print(json.dumps({"parts": parts, "total": total}, ensure_ascii=False))
    else:
        for k, v in parts.items():
            print(f"{k:<28}{v:>7} token")
        print(f"{'TOPLAM (tahmini)':<28}{total:>7} token")
        if a.top:
            allr = [("skill", n, c) for n, c in r["skills"]] + [("agent", n, c) for n, c in r["agents"]]
            for t, n, c in sorted(allr, key=lambda x: -x[2])[: a.top]:
                print(f"  {t:<6}{n:<45}{est(c):>5}")
    if a.budget and total > a.budget:
        print(f"BÜTÇE AŞILDI: {total} > {a.budget}", file=sys.stderr)
        sys.exit(1)


main()
