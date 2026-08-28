# Rick & Morty — Field Archive (mobile)

App Flutter que é a versão mobile do [rick-morty-frontend](../rick-morty-frontend),
consumindo o [rick-morty-backend](../rick-morty-backend).

Dado um ou mais IDs de episódio, lista os personagens presentes neles (grid) e abre
uma tela de detalhe por personagem.

## Screenshots

| Estado inicial | Resultados | Detalhe |
|:---:|:---:|:---:|
| ![Estado inicial](docs/screenshots/03-archive-empty.png) | ![Resultados](docs/screenshots/04-results.png) | ![Detalhe](docs/screenshots/05-detail.png) |

| Ícone (launcher) | Splash |
|:---:|:---:|
| ![Ícone](docs/screenshots/01-launcher.png) | ![Splash](docs/screenshots/02-splash.png) |

## Stack

- **Flutter** (canal stable) / **Dart 3**
- **Riverpod** (`flutter_riverpod` + `riverpod_generator`) — estado e injeção de dependência
- **go_router** — navegação
- **Dio** — HTTP
- **freezed** + **json_serializable** — imutabilidade e (de)serialização
- **cached_network_image** — retratos
- **flutter gen-l10n** — i18n (pt/en, padrão pt)
- **very_good_analysis** — lint
- **mocktail** + `flutter_test` — testes (unit, widget, golden)

> Por padrão o app aponta para o **backend publicado** (Vercel) — `flutter run` /
> `flutter build` sem nenhum argumento já funcionam, sem subir nada localmente.

## Requisitos

- Flutter stable recente (o projeto usa `dart run build_runner` sem `--delete-conflicting-outputs`)
- **Windows:** habilitar o *Developer Mode* (`start ms-settings:developers`) — o Flutter
  precisa de symlink para os plugins
- Um emulador Android / dispositivo, ou Chrome
- Backend: por padrão usa o **publicado**; só precisa do `rick-morty-backend` local
  se for rodar nos alvos `emulator` / `device` (ver abaixo)

## Rodando

```bash
flutter pub get
dart run build_runner build      # gera *.g.dart / *.freezed.dart
flutter gen-l10n                 # gera lib/l10n/generated/
flutter run                      # já aponta para o backend publicado
```

### Backend local (opcional)

A `API_BASE_URL` é injetada em build time via `--dart-define`. Sem argumento, o
default no código é o backend da Vercel. Para apontar para um backend local:

```bash
scripts/run.ps1 emulator   # Windows  — http://10.0.2.2:3000 (backend na máquina host)
scripts/run.ps1 device     #          — http://<IP-da-máquina>:3000 (celular na mesma rede)
scripts/run.sh  emulator   # bash/macOS/Linux
```

`scripts/run.{ps1,sh}` sem argumento = remoto. Args extras passam direto pro
`flutter run` (ex.: `scripts/run.ps1 emulator -d chrome`).

| Alvo | Config | `API_BASE_URL` |
|---|---|---|
| _(default)_ / `remote` | `config/prod.json` | backend na Vercel |
| `emulator` | `config/dev.json` | `http://10.0.2.2:3000` |
| `device` | IP detectado / `config/local-device.json` (não versionado; copie de `.example`) | `http://<lan-ip>:3000` |

No VS Code: **F5** roda a config `Field Archive (remoto)`; as variantes
`· backend local (emulador/device)` estão no dropdown de _Run and Debug_.

## Comandos

| Ação | Comando |
|---|---|
| Analisar | `flutter analyze` |
| Formatar | `dart format lib test` |
| Gerar código | `dart run build_runner build` |
| Gerar i18n | `flutter gen-l10n` |
| Testes | `flutter test` |
| Cobertura | `flutter test --coverage` |
| Só golden | `flutter test --tags golden` |
| Atualizar golden | `flutter test --tags golden --update-goldens` |

## Build

```bash
flutter build apk --release                     # APK universal, backend publicado (default)
flutter build apk --release --split-per-abi      # APKs por ABI (~20 MB cada)
flutter build appbundle --release                # .aab p/ Play Store
```

O APK já aponta para o backend da Vercel (default no código), então instala e funciona
sem setup. Para fixar `APP_ENV=prod`, adicione `--dart-define-from-file=config/prod.json`.

O `build.gradle.kts` ainda assina o release com a chave de **debug** (TODO do template) —
troque por um `signingConfig` próprio antes de distribuir. APK universal fica ~50 MB
(todas as ABIs); `--split-per-abi` derruba para ~20 MB cada.

### Ícone do app

Arte em `assets/icon/app_icon.png` (Rick em traço de tinta, no papel do tema). Os
ícones de Android/iOS/web/Windows já estão gerados; para refazer após trocar a arte:
`dart run flutter_launcher_icons`. Config no `pubspec.yaml`; fundo do adaptativo
Android = `#F4F1EA`. Detalhes em [assets/icon/README.md](assets/icon/README.md).

## Arquitetura

Feature-first com Clean Architecture pragmática. Uma única feature: `field_archive`
(episódio é *input*, não recurso navegável — o backend não expõe lista de episódios).

```
lib/
  app/            RickMortyApp (MaterialApp.router + tema + i18n)
  bootstrap.dart  composition root (runZonedGuarded + ProviderScope)
  core/
    env/          AppEnv — lê API_BASE_URL/APP_ENV do --dart-define, valida a URL
    network/      Dio + interceptor de log (dev), ApiException, cache manager de imagem
    error/        sealed Failure (InvalidInput / NotFound / Connection / Unknown)
    router/       go_router: '/' e '/character/:id'; paths em `Routes` (zero magic string)
    theme/        tokens do "Field Archive" -> ThemeData + ArchiveColors (ThemeExtension)
  features/field_archive/
    data/         CharacterDto (json_serializable) + mapper, RemoteDataSource (Dio),
                  RepositoryImpl (ApiException -> Failure)
    domain/       Character (freezed) + enums, EpisodeQuery (value object),
                  CharacterRepository (contrato), GetCharactersByEpisodes (use case)
    presentation/ controllers (AsyncNotifier), pages, widgets
```

### Fluxo de dados e erro

```
UI → Controller (AsyncNotifier) → UseCase → Repository → RemoteDataSource → Dio → backend
                                                     ↑ mapeia DioException → ApiException
                                     ↑ mapeia ApiException → Failure (sealed)
        ↑ o Failure sobe como AsyncValue.error; a UI faz `switch` exaustivo nele
```

### Decisões

- **DTO ≠ entidade.** A API é *stringly-typed* (`status`/`gender` são strings). O mapper
  converte para enums (`CharacterStatus` / `CharacterGender`). A entidade só carrega o que
  as telas usam.
- **Sem `Either`/`fpdart`.** O repositório lança `Failure`; o `AsyncNotifier` já modela
  loading/data/error — empilhar `Either` sobre `AsyncValue` seria wrapper duplo.
- **Sem `GetCharacterById`.** Seria use case de pura passagem; a tela de detalhe usa um
  provider que chama o repositório direto. `GetCharactersByEpisodes` existe porque carrega
  lógica real (constrói/valida o `EpisodeQuery`).
- **`EpisodeQuery`** (value object) é dono da validação dos IDs de episódio (regex, trim,
  dedupe preservando ordem) — porta de `episodeIds.ts` do frontend. Fica no domínio, não na UI.
- **Paginação:** client-side, scroll lazy (`GridView.builder`). Sem botões numerados —
  mais nativo em mobile.
- **Tema:** tokens do `@theme` do frontend (cores, tipografia, raio 2px) portados para
  `ThemeData`; cores fora do `ColorScheme` num `ThemeExtension` (`context.archiveColors`).
- **Riverpod:** sintaxe code-gen (`@riverpod`), `AsyncNotifier` para estado de tela,
  `Ref` como container de DI. Sem provider global mutável.

## Testes

~70 testes cobrindo domínio, data, controllers e widgets. Cobertura de linha ~86%
(`domain/` e `data/` perto de 100%).

- **unit** — `EpisodeQuery`, mapeamento `Failure`/`ApiException`, DTO→entidade, `AppEnv`
- **repository / data source** — `mocktail` isolando Dio e o data source
- **controller** — `ProviderContainer` + overrides
- **widget** — página do archive (vazio / loading / resultados / erro / input inválido),
  detalhe (preloaded / fetch por id / 404), componentes
- **golden** — `EntityCard`, `StatusIndicator`, `CharacterDetailView` (tag `golden`)

> Goldens são renderizados por pixel e sensíveis à plataforma. Os baselines commitados
> foram gerados no Windows; em outra plataforma rode
> `flutter test --tags golden --update-goldens` uma vez.

## CI

[.github/workflows/ci.yaml](.github/workflows/ci.yaml): `pub get` → `build_runner` →
`gen-l10n` → checagem de formatação → `analyze` → testes com cobertura → testes golden.

## Fontes

Oswald (display), IBM Plex Sans (texto) e IBM Plex Mono (mono) — estáticas do Google
Fonts (OFL), versionadas em `assets/fonts/` e declaradas no `pubspec.yaml`. Os testes
as carregam via [test/flutter_test_config.dart](test/flutter_test_config.dart) para que
os goldens usem a tipografia real. Ver [assets/fonts/README.md](assets/fonts/README.md).
