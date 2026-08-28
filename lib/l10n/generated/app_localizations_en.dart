// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Rick & Morty Field Archive';

  @override
  String get headerBrand => 'RICK & MORTY';

  @override
  String get headerTitle => 'FIELD ARCHIVE';

  @override
  String get headerSubtitle => 'INTERDIMENSIONAL OBSERVATION DATABASE';

  @override
  String get headerStatusLabel => 'ARCHIVE STATUS:';

  @override
  String get headerStatusOnline => 'ONLINE';

  @override
  String get queryHeading => 'QUERY EPISODES';

  @override
  String get queryDescription =>
      'Enter one or more episode IDs separated by commas';

  @override
  String get queryPlaceholder => '10,28';

  @override
  String get querySubmit => 'LOAD ARCHIVE';

  @override
  String get emptyArchiveTitle => 'ARCHIVE READY';

  @override
  String get emptyArchiveDescription =>
      'Enter one or more episode IDs to query the observed characters.';

  @override
  String get invalidEpisodeIdsTitle => 'INVALID EPISODE IDENTIFIER';

  @override
  String get invalidEpisodeIdsDescription =>
      'The archive only accepts numeric episode identifiers.';

  @override
  String get episodeNotFoundTitle => 'NO EPISODE RECORD FOUND';

  @override
  String get episodeNotFoundDescription =>
      'None of the provided episode IDs exist in the archive.';

  @override
  String get characterNotFoundTitle => 'NO CHARACTER RECORD FOUND';

  @override
  String get characterNotFoundDescription =>
      'This character does not exist in the archive.';

  @override
  String get connectionErrorTitle => 'ARCHIVE CONNECTION ERROR';

  @override
  String get connectionErrorDescription =>
      'Could not connect to the archive. Try again in a moment.';

  @override
  String get retry => 'RETRY';

  @override
  String summaryObservedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count OBSERVED CHARACTERS',
      one: '$count OBSERVED CHARACTER',
    );
    return '$_temp0';
  }

  @override
  String summaryEpisodes(String ids) {
    return 'EPISODES: $ids';
  }

  @override
  String summaryRetrieved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'RETRIEVED: $count RECORDS',
      one: 'RETRIEVED: $count RECORD',
    );
    return '$_temp0';
  }

  @override
  String get detailHeading => 'CHARACTER DETAILS';

  @override
  String detailIdLabel(String id) {
    return 'ID: $id';
  }

  @override
  String get detailBack => 'BACK';

  @override
  String get detailStatus => 'STATUS';

  @override
  String get detailSpecies => 'SPECIES';

  @override
  String get detailType => 'TYPE';

  @override
  String get detailGender => 'GENDER';

  @override
  String get detailSectionOrigin => 'ORIGIN';

  @override
  String get detailSectionLocation => 'LOCATION';

  @override
  String get detailSectionEpisodes => 'EPISODES';

  @override
  String get detailRowName => 'NAME';

  @override
  String get detailRowTotal => 'TOTAL';

  @override
  String get detailValueUnknown => '—';

  @override
  String get emptyDetailTitle => 'NO CHARACTER SELECTED';

  @override
  String get emptyDetailDescription =>
      'Select an observed character in the archive to see its record.';

  @override
  String get statusAlive => 'ALIVE';

  @override
  String get statusDead => 'DEAD';

  @override
  String get statusUnknown => 'UNKNOWN';

  @override
  String get genderFemale => 'FEMALE';

  @override
  String get genderMale => 'MALE';

  @override
  String get genderGenderless => 'GENDERLESS';

  @override
  String get genderUnknown => 'UNKNOWN';

  @override
  String get portraitFallback => 'portrait / api';
}
