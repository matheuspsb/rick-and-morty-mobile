import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_mobile/core/network/image_cache_manager.dart';
import 'package:rick_morty_mobile/core/theme/archive_tokens.dart';
import 'package:rick_morty_mobile/features/field_archive/presentation/widgets/hatch_texture.dart';

enum PortraitAspect {
  card(1 / 0.94),
  detail(1 / 1.08);

  const PortraitAspect(this.ratio);

  final double ratio;
}

class EntityPortrait extends ConsumerWidget {
  const EntityPortrait({
    required this.imageUrl,
    required this.aspect,
    required this.fallbackLabel,
    this.semanticLabel,
    super.key,
  });

  final String imageUrl;
  final PortraitAspect aspect;
  final String fallbackLabel;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: aspect.ratio,
      child: ClipRRect(
        borderRadius: ArchiveTokens.borderRadius,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          cacheManager: ref.watch(imageCacheManagerProvider),
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 150),
          imageBuilder: (context, imageProvider) => Semantics(
            image: true,
            label: semanticLabel,
            child: Ink.image(image: imageProvider, fit: BoxFit.cover),
          ),
          placeholder: (context, url) => const HatchTexture(),
          errorWidget: (context, url, error) =>
              _PortraitFallback(label: fallbackLabel),
        ),
      ),
    );
  }
}

class _PortraitFallback extends StatelessWidget {
  const _PortraitFallback({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const HatchTexture(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: ColoredBox(
              color: ArchiveTokens.bg,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
