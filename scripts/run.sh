#!/usr/bin/env bash
# Roda o app. Por padrao aponta para o backend REMOTO (publicado).
#
#   scripts/run.sh              -> remoto (Vercel) — nao precisa de backend local
#   scripts/run.sh emulator    -> http://10.0.2.2:3000 (backend local visto pelo emulador)
#   scripts/run.sh device      -> config/local-device.json (celular fisico; ajuste o IP)
#   scripts/run.sh remote      -> igual ao padrao (explicito)
#
# Qualquer outro argumento passa direto pro `flutter run`:
#   scripts/run.sh -d chrome
#   scripts/run.sh emulator -d chrome

set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

case "${1:-}" in
  remote|emulator|device) target="$1"; shift ;;
  *) target="remote" ;;
esac

case "$target" in
  remote)   config="$root/config/prod.json" ;;
  emulator) config="$root/config/dev.json" ;;
  device)
    config="$root/config/local-device.json"
    if [ ! -f "$config" ]; then
      cp "$root/config/local-device.json.example" "$config"
      echo "Criei $config a partir do .example. Ajuste o IP da sua maquina e rode de novo." >&2
      exit 1
    fi
    ;;
esac

[ "$target" = "remote" ] && echo 'Backend: remoto (Vercel). Use "emulator" ou "device" para backend local.'
echo "> flutter run --dart-define-from-file=$config $*"
exec flutter run --dart-define-from-file="$config" "$@"
