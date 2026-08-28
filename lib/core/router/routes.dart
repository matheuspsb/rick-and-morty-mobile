abstract final class Routes {
  static const archive = '/';

  static const characterDetailName = 'character-detail';
  static const characterDetail = '/character/:id';

  static String characterDetailLocation(int id) => '/character/$id';
}
