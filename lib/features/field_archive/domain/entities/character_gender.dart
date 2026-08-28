enum CharacterGender {
  female,
  male,
  genderless,
  unknown;

  static CharacterGender fromApi(String raw) => switch (raw.toLowerCase()) {
    'female' => CharacterGender.female,
    'male' => CharacterGender.male,
    'genderless' => CharacterGender.genderless,
    _ => CharacterGender.unknown,
  };
}
