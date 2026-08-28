# Fontes do Field Archive

Portam os tokens de tipografia do `rick-morty-frontend` (`src/index.css`). Os `.ttf`
estão versionados nesta pasta e declarados no `pubspec.yaml` (seção `fonts:`).

| Papel   | Família (pubspec) | Arquivos | Pesos |
|---------|-------------------|----------|-------|
| display | `Oswald`          | `Oswald-Regular/Medium/SemiBold/Bold.ttf` | 400/500/600/700 |
| sans    | `IBM Plex Sans`   | `IBMPlexSans-Regular/Medium/SemiBold.ttf` | 400/500/600 |
| mono    | `IBM Plex Mono`   | `IBMPlexMono-Regular/Medium.ttf`          | 400/500 |

Fontes estáticas (não as variáveis) do Google Fonts, sob a SIL Open Font License:
Oswald · IBM Plex Sans · IBM Plex Mono.

Os testes carregam essas fontes via [test/flutter_test_config.dart](../../test/flutter_test_config.dart)
para que os goldens renderizem com a tipografia real.
