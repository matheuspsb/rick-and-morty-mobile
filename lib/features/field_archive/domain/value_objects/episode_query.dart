import 'package:meta/meta.dart';

@immutable
class EpisodeQuery {
  const EpisodeQuery._(this.ids);

  static final _pattern = RegExp(r'^\d+(,\d+)*$');

  final List<int> ids;

  static EpisodeQuery? tryParse(String raw) {
    final normalized = raw
        .split(',')
        .map((part) => part.trim())
        .where((part) => part.isNotEmpty)
        .join(',');

    if (!_pattern.hasMatch(normalized)) return null;

    final ids = <int>[];
    for (final part in normalized.split(',')) {
      final id = int.parse(part);
      if (!ids.contains(id)) ids.add(id);
    }

    return EpisodeQuery._(List.unmodifiable(ids));
  }

  String toPathSegment() => ids.join(',');

  @override
  bool operator ==(Object other) {
    if (other is! EpisodeQuery) return false;
    if (other.ids.length != ids.length) return false;
    for (var i = 0; i < ids.length; i++) {
      if (other.ids[i] != ids[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode => Object.hashAll(ids);

  @override
  String toString() => 'EpisodeQuery(${toPathSegment()})';
}
