// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Rick & Morty Field Archive';

  @override
  String get headerBrand => 'RICK & MORTY';

  @override
  String get headerTitle => 'FIELD ARCHIVE';

  @override
  String get headerSubtitle => 'BANCO DE OBSERVAÇÃO INTERDIMENSIONAL';

  @override
  String get headerStatusLabel => 'STATUS DO ARQUIVO:';

  @override
  String get headerStatusOnline => 'ONLINE';

  @override
  String get queryHeading => 'CONSULTAR EPISÓDIOS';

  @override
  String get queryDescription =>
      'Digite um ou mais IDs de episódio separados por vírgula';

  @override
  String get queryPlaceholder => '10,28';

  @override
  String get querySubmit => 'CARREGAR ARQUIVO';

  @override
  String get emptyArchiveTitle => 'ARQUIVO PRONTO';

  @override
  String get emptyArchiveDescription =>
      'Digite um ou mais IDs de episódio para consultar os personagens observados.';

  @override
  String get invalidEpisodeIdsTitle => 'IDENTIFICADOR DE EPISÓDIO INVÁLIDO';

  @override
  String get invalidEpisodeIdsDescription =>
      'O arquivo aceita apenas identificadores numéricos de episódio.';

  @override
  String get episodeNotFoundTitle => 'NENHUM REGISTRO DE EPISÓDIO ENCONTRADO';

  @override
  String get episodeNotFoundDescription =>
      'Nenhum dos IDs de episódio informados existe no arquivo.';

  @override
  String get characterNotFoundTitle =>
      'NENHUM REGISTRO DE PERSONAGEM ENCONTRADO';

  @override
  String get characterNotFoundDescription =>
      'Este personagem não existe no arquivo.';

  @override
  String get connectionErrorTitle => 'ERRO DE CONEXÃO COM O ARQUIVO';

  @override
  String get connectionErrorDescription =>
      'Não foi possível conectar ao arquivo. Tente novamente em instantes.';

  @override
  String get retry => 'TENTAR NOVAMENTE';

  @override
  String summaryObservedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count PERSONAGENS OBSERVADOS',
      one: '$count PERSONAGEM OBSERVADO',
    );
    return '$_temp0';
  }

  @override
  String summaryEpisodes(String ids) {
    return 'EPISÓDIOS: $ids';
  }

  @override
  String summaryRetrieved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'RECUPERADOS: $count REGISTROS',
      one: 'RECUPERADO: $count REGISTRO',
    );
    return '$_temp0';
  }

  @override
  String get detailHeading => 'DETALHES DO PERSONAGEM';

  @override
  String detailIdLabel(String id) {
    return 'ID: $id';
  }

  @override
  String get detailBack => 'VOLTAR';

  @override
  String get detailStatus => 'STATUS';

  @override
  String get detailSpecies => 'ESPÉCIE';

  @override
  String get detailType => 'TIPO';

  @override
  String get detailGender => 'GÊNERO';

  @override
  String get detailSectionOrigin => 'ORIGEM';

  @override
  String get detailSectionLocation => 'LOCALIZAÇÃO';

  @override
  String get detailSectionEpisodes => 'EPISÓDIOS';

  @override
  String get detailRowName => 'NOME';

  @override
  String get detailRowTotal => 'TOTAL';

  @override
  String get detailValueUnknown => '—';

  @override
  String get emptyDetailTitle => 'NENHUM PERSONAGEM SELECIONADO';

  @override
  String get emptyDetailDescription =>
      'Selecione um personagem observado no arquivo para ver seu registro.';

  @override
  String get statusAlive => 'VIVO';

  @override
  String get statusDead => 'MORTO';

  @override
  String get statusUnknown => 'DESCONHECIDO';

  @override
  String get genderFemale => 'FEMININO';

  @override
  String get genderMale => 'MASCULINO';

  @override
  String get genderGenderless => 'SEM GÊNERO';

  @override
  String get genderUnknown => 'DESCONHECIDO';

  @override
  String get portraitFallback => 'retrato / api';
}
