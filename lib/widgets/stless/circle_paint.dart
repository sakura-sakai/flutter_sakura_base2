import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../theme/theme.dart';

///
/// [CirclePaint] is a widget used to draw a circle
/// ///
/// It can be used as follows
/// ```
/// CirclePaint(
///   radius: 10,
/// ),
/// ```
///
/// Select color from [AppColors]
///

class CirclePaint extends HookWidget {
  const CirclePaint(
    this.radius, {
    this.offsetDx = 0,
    this.offsetDy = 0,
    this.topLeftColor,
    this.bottomRightColor,
    Key? key,
  }) : super(key: key);

  /// Coordinates centered of the circle
  final double offsetDx;
  final double offsetDy;

  /// Radius of the circle
  final double radius;

  /// Gradient Color
  final Color? topLeftColor;
  final Color? bottomRightColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CirclePainter(
        Offset(offsetDx, offsetDy),
        radius: radius,
        topLeftColor: topLeftColor ?? AppColors.violet[900]!,
        bottomRightColor: bottomRightColor ?? AppColors.violetAccent[700]!,
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  _CirclePainter(
    this.offset, {
    required this.radius,
    required this.topLeftColor,
    required this.bottomRightColor,
  });

  /// Coordinates centered of the circle
  final Offset offset;

  /// Radius of the circle
  final double radius;

  /// Gradient Color
  final Color topLeftColor;
  final Color bottomRightColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [topLeftColor, bottomRightColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(
        Rect.fromCircle(
          center: const Offset(0, 0),
          radius: radius,
        ),
      );

    canvas.drawCircle(offset, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
