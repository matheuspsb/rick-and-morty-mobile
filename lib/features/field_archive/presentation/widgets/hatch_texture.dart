import 'package:flutter/material.dart';
import 'package:rick_morty_mobile/core/theme/archive_tokens.dart';

class HatchTexture extends StatelessWidget {
  const HatchTexture({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HatchPainter(
        background: ArchiveTokens.texture,
        line: ArchiveTokens.line.withValues(alpha: 0.55),
      ),
      size: Size.infinite,
    );
  }
}

class _HatchPainter extends CustomPainter {
  const _HatchPainter({required this.background, required this.line});

  final Color background;
  final Color line;

  static const _gap = 7.0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = background);

    final stroke = Paint()
      ..color = line
      ..strokeWidth = 1;

    for (var x = -size.height; x <= size.width; x += _gap) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x + size.height, size.height),
        stroke,
      );
    }
  }

  @override
  bool shouldRepaint(_HatchPainter oldDelegate) =>
      oldDelegate.background != background || oldDelegate.line != line;
}
