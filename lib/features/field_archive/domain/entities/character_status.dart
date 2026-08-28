enum CharacterStatus {
  alive,
  dead,
  unknown;

  static CharacterStatus fromApi(String raw) => switch (raw.toLowerCase()) {
    'alive' => CharacterStatus.alive,
    'dead' => CharacterStatus.dead,
    _ => CharacterStatus.unknown,
  };
}
