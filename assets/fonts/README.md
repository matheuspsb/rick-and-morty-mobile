# Fontes do Field Archive

O tema porta os tokens de tipografia do `rick-morty-frontend` (`src/index.css`):

| Papel     | Família         | Arquivos esperados nesta pasta                              |
|-----------|-----------------|------------------------------------------------------------|
| display   | Oswald          | `Oswald-Regular.ttf`, `Oswald-Medium.ttf`, `Oswald-SemiBold.ttf`, `Oswald-Bold.ttf` |
| sans      | IBM Plex Sans   | `IBMPlexSans-Regular.ttf`, `IBMPlexSans-Medium.ttf`, `IBMPlexSans-SemiBold.ttf` |
| mono      | IBM Plex Mono   | `IBMPlexMono-Regular.ttf`, `IBMPlexMono-Medium.ttf`         |

## Como obter (uma vez)

Ambas as famílias são Open Font License (Google Fonts):

- Oswald: https://fonts.google.com/specimen/Oswald
- IBM Plex Sans: https://fonts.google.com/specimen/IBM+Plex+Sans
- IBM Plex Mono: https://fonts.google.com/specimen/IBM+Plex+Mono

Baixe o `.zip` de cada uma, copie os `.ttf` estáticos listados acima para esta pasta
(`assets/fonts/`).

Enquanto os arquivos não estiverem presentes, o app roda com as fontes de fallback
do sistema — sem quebrar o build, apenas sem a identidade visual final.

## Ativar no pubspec

Depois de colocar os `.ttf` aqui, cole o bloco abaixo dentro de `flutter:` no `pubspec.yaml`:

```yaml
  fonts:
    - family: Oswald
      fonts:
        - asset: assets/fonts/Oswald-Regular.ttf
        - asset: assets/fonts/Oswald-Medium.ttf
          weight: 500
        - asset: assets/fonts/Oswald-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Oswald-Bold.ttf
          weight: 700
    - family: IBM Plex Sans
      fonts:
        - asset: assets/fonts/IBMPlexSans-Regular.ttf
        - asset: assets/fonts/IBMPlexSans-Medium.ttf
          weight: 500
        - asset: assets/fonts/IBMPlexSans-SemiBold.ttf
          weight: 600
    - family: IBM Plex Mono
      fonts:
        - asset: assets/fonts/IBMPlexMono-Regular.ttf
        - asset: assets/fonts/IBMPlexMono-Medium.ttf
          weight: 500
```
