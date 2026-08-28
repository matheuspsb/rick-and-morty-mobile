# Ícone do app

Coloque a arte do ícone aqui como **`app_icon.png`** — quadrado, idealmente
**1024×1024**, com uma margem de segurança (o rosto/elemento não deve encostar
nas bordas, porque o ícone adaptativo do Android recorta ~15% de cada lado).

Depois, gere os ícones de todas as plataformas:

```bash
dart run flutter_launcher_icons
```

Isso reescreve `android/app/src/main/res/mipmap-*`, o `AppIcon.appiconset` do iOS,
e o `Icon-*` do web. A config está no `pubspec.yaml`, seção `flutter_launcher_icons`
(fundo adaptativo Android = `#F4F1EA`, o papel do tema Field Archive).
