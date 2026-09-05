# CI/CD Pipeline

## Uebersicht

Das Projekt nutzt **GitHub Actions** fuer automatischen Build, Lint und Release.

```
Push / PR auf main
    +-> ci.yml
          +-> Build (monkeyc -t Release)
          +-> Lint  (monkeyc --typecheck 3)
          +-> Artefakt (.prg) hochladen (14 Tage)

git tag v1.x.x
    +-> release.yml
          +-> Build .prg
          +-> Package .iq (Connect IQ Store)
          +-> GitHub Release erstellen
```

## Voraussetzungen

### GitHub Secret anlegen

Siehe `.github/SECRETS.md` fuer die vollstaendige Anleitung.

Kurzzusammenfassung:
```bash
# Developer Key als Base64 exportieren
base64 -w 0 developer_key.der
# -> Ausgabe als Secret GARMIN_DEVELOPER_KEY in GitHub hinterlegen
```

## Release erstellen

```bash
git tag v1.0.0
git push origin v1.0.0
# GitHub Actions baut automatisch und erstellt einen Release
```

## Workflow-Status

Badge fuer README:
```markdown
[![CI](https://github.com/originalptronix/garmin-watchface-builder/actions/workflows/ci.yml/badge.svg)](https://github.com/originalptronix/garmin-watchface-builder/actions/workflows/ci.yml)
```

## Lokaler Build

```bash
monkeyc \
  -f monkey.jungle \
  -o bin/WatchfaceBuilder.prg \
  -y ~/developer_key.der \
  -d epixpro2 \
  -t Release
```
