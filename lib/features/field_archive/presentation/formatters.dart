String padEntityId(int id) => id.toString().padLeft(3, '0');

String formatEntityCode(int id) => '#${padEntityId(id)}';

String formatEpisodeIdsForDisplay(String rawEpisodeIds) => rawEpisodeIds
    .split(',')
    .map((part) => part.trim())
    .where((part) => part.isNotEmpty)
    .join(', ');
