import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_gender.dart';
import 'package:rick_morty_mobile/features/field_archive/domain/entities/character_status.dart';
import 'package:rick_morty_mobile/l10n/generated/app_localizations.dart';

String statusLabel(AppLocalizations l10n, CharacterStatus status) =>
    switch (status) {
      CharacterStatus.alive => l10n.statusAlive,
      CharacterStatus.dead => l10n.statusDead,
      CharacterStatus.unknown => l10n.statusUnknown,
    };

String genderLabel(AppLocalizations l10n, CharacterGender gender) =>
    switch (gender) {
      CharacterGender.female => l10n.genderFemale,
      CharacterGender.male => l10n.genderMale,
      CharacterGender.genderless => l10n.genderGenderless,
      CharacterGender.unknown => l10n.genderUnknown,
    };
