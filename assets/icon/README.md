# Ícone do app

`app_icon.png` — 2048×2048, arte do Rick em traço de tinta sobre o papel do tema
(`#F4F1EA`), com ~9% de margem de segurança para o recorte do ícone adaptativo do
Android.

Gerado a partir de uma arte 2048×2048 (JPEG) recomposta num canvas quadrado com a
cor de fundo do tema. Para regenerar os ícones de todas as plataformas após trocar
`app_icon.png`:

```bash
dart run flutter_launcher_icons
```

Config no `pubspec.yaml`, seção `flutter_launcher_icons` (fundo adaptativo Android
= `#F4F1EA`). Saídas: `android/app/src/main/res/mipmap-*` + `drawable-*` +
`mipmap-anydpi-v26/`, `ios/Runner/Assets.xcassets/AppIcon.appiconset`, `web/icons`,
`windows/runner/resources/app_icon.ico`.
