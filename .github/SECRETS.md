# GitHub Actions Secrets einrichten

Fuer den CI/CD Build wird ein Garmin Developer Key benoetigt.

## 1. Developer Key erstellen

Falls noch kein Key vorhanden:

```bash
# Im Connect IQ SDK Verzeichnis:
cd ~/ciq-sdk/bin
./connectiq  # SDK Manager starten -> Developer Key generieren
# Alternativ:
openssl genrsa -out developer_key.pem 4096
openssl pkcs8 -topk8 -inform PEM -outform DER -in developer_key.pem -out developer_key.der -nocrypt
```

## 2. Key als GitHub Secret hinterlegen

```bash
# Key als Base64 kodieren
base64 -i developer_key.der | pbcopy  # macOS
base64 -w 0 developer_key.der        # Linux
```

Dann in GitHub:
`Repository -> Settings -> Secrets and variables -> Actions -> New repository secret`

| Name | Wert |
|------|------|
| `GARMIN_DEVELOPER_KEY` | Base64-kodierter Inhalt der `developer_key.der` |

## 3. Workflow testen

Nach dem naechsten Push auf `main` laeuft der Build automatisch.
Status: `Actions` Tab im Repository.
