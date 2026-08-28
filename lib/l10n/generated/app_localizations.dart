import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('pt'),
    Locale('en'),
  ];

  /// Application title / archive header primary line
  ///
  /// In en, this message translates to:
  /// **'Rick & Morty Field Archive'**
  String get appTitle;

  /// No description provided for @headerBrand.
  ///
  /// In en, this message translates to:
  /// **'RICK & MORTY'**
  String get headerBrand;

  /// No description provided for @headerTitle.
  ///
  /// In en, this message translates to:
  /// **'FIELD ARCHIVE'**
  String get headerTitle;

  /// No description provided for @headerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'INTERDIMENSIONAL OBSERVATION DATABASE'**
  String get headerSubtitle;

  /// No description provided for @headerStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'ARCHIVE STATUS:'**
  String get headerStatusLabel;

  /// No description provided for @headerStatusOnline.
  ///
  /// In en, this message translates to:
  /// **'ONLINE'**
  String get headerStatusOnline;

  /// No description provided for @queryHeading.
  ///
  /// In en, this message translates to:
  /// **'QUERY EPISODES'**
  String get queryHeading;

  /// No description provided for @queryDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter one or more episode IDs separated by commas'**
  String get queryDescription;

  /// No description provided for @queryPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'10,28'**
  String get queryPlaceholder;

  /// No description provided for @querySubmit.
  ///
  /// In en, this message translates to:
  /// **'LOAD ARCHIVE'**
  String get querySubmit;

  /// No description provided for @emptyArchiveTitle.
  ///
  /// In en, this message translates to:
  /// **'ARCHIVE READY'**
  String get emptyArchiveTitle;

  /// No description provided for @emptyArchiveDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter one or more episode IDs to query the observed characters.'**
  String get emptyArchiveDescription;

  /// No description provided for @invalidEpisodeIdsTitle.
  ///
  /// In en, this message translates to:
  /// **'INVALID EPISODE IDENTIFIER'**
  String get invalidEpisodeIdsTitle;

  /// No description provided for @invalidEpisodeIdsDescription.
  ///
  /// In en, this message translates to:
  /// **'The archive only accepts numeric episode identifiers.'**
  String get invalidEpisodeIdsDescription;

  /// No description provided for @episodeNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'NO EPISODE RECORD FOUND'**
  String get episodeNotFoundTitle;

  /// No description provided for @episodeNotFoundDescription.
  ///
  /// In en, this message translates to:
  /// **'None of the provided episode IDs exist in the archive.'**
  String get episodeNotFoundDescription;

  /// No description provided for @characterNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'NO CHARACTER RECORD FOUND'**
  String get characterNotFoundTitle;

  /// No description provided for @characterNotFoundDescription.
  ///
  /// In en, this message translates to:
  /// **'This character does not exist in the archive.'**
  String get characterNotFoundDescription;

  /// No description provided for @connectionErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'ARCHIVE CONNECTION ERROR'**
  String get connectionErrorTitle;

  /// No description provided for @connectionErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'Could not connect to the archive. Try again in a moment.'**
  String get connectionErrorDescription;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'RETRY'**
  String get retry;

  /// No description provided for @summaryObservedCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{{count} OBSERVED CHARACTER} other{{count} OBSERVED CHARACTERS}}'**
  String summaryObservedCount(int count);

  /// No description provided for @summaryEpisodes.
  ///
  /// In en, this message translates to:
  /// **'EPISODES: {ids}'**
  String summaryEpisodes(String ids);

  /// No description provided for @summaryRetrieved.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{RETRIEVED: {count} RECORD} other{RETRIEVED: {count} RECORDS}}'**
  String summaryRetrieved(int count);

  /// No description provided for @detailHeading.
  ///
  /// In en, this message translates to:
  /// **'CHARACTER DETAILS'**
  String get detailHeading;

  /// No description provided for @detailIdLabel.
  ///
  /// In en, this message translates to:
  /// **'ID: {id}'**
  String detailIdLabel(String id);

  /// No description provided for @detailBack.
  ///
  /// In en, this message translates to:
  /// **'BACK'**
  String get detailBack;

  /// No description provided for @detailStatus.
  ///
  /// In en, this message translates to:
  /// **'STATUS'**
  String get detailStatus;

  /// No description provided for @detailSpecies.
  ///
  /// In en, this message translates to:
  /// **'SPECIES'**
  String get detailSpecies;

  /// No description provided for @detailType.
  ///
  /// In en, this message translates to:
  /// **'TYPE'**
  String get detailType;

  /// No description provided for @detailGender.
  ///
  /// In en, this message translates to:
  /// **'GENDER'**
  String get detailGender;

  /// No description provided for @detailSectionOrigin.
  ///
  /// In en, this message translates to:
  /// **'ORIGIN'**
  String get detailSectionOrigin;

  /// No description provided for @detailSectionLocation.
  ///
  /// In en, this message translates to:
  /// **'LOCATION'**
  String get detailSectionLocation;

  /// No description provided for @detailSectionEpisodes.
  ///
  /// In en, this message translates to:
  /// **'EPISODES'**
  String get detailSectionEpisodes;

  /// No description provided for @detailRowName.
  ///
  /// In en, this message translates to:
  /// **'NAME'**
  String get detailRowName;

  /// No description provided for @detailRowTotal.
  ///
  /// In en, this message translates to:
  /// **'TOTAL'**
  String get detailRowTotal;

  /// No description provided for @detailValueUnknown.
  ///
  /// In en, this message translates to:
  /// **'—'**
  String get detailValueUnknown;

  /// No description provided for @emptyDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'NO CHARACTER SELECTED'**
  String get emptyDetailTitle;

  /// No description provided for @emptyDetailDescription.
  ///
  /// In en, this message translates to:
  /// **'Select an observed character in the archive to see its record.'**
  String get emptyDetailDescription;

  /// No description provided for @statusAlive.
  ///
  /// In en, this message translates to:
  /// **'ALIVE'**
  String get statusAlive;

  /// No description provided for @statusDead.
  ///
  /// In en, this message translates to:
  /// **'DEAD'**
  String get statusDead;

  /// No description provided for @statusUnknown.
  ///
  /// In en, this message translates to:
  /// **'UNKNOWN'**
  String get statusUnknown;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'FEMALE'**
  String get genderFemale;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'MALE'**
  String get genderMale;

  /// No description provided for @genderGenderless.
  ///
  /// In en, this message translates to:
  /// **'GENDERLESS'**
  String get genderGenderless;

  /// No description provided for @genderUnknown.
  ///
  /// In en, this message translates to:
  /// **'UNKNOWN'**
  String get genderUnknown;

  /// No description provided for @portraitFallback.
  ///
  /// In en, this message translates to:
  /// **'portrait / api'**
  String get portraitFallback;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
