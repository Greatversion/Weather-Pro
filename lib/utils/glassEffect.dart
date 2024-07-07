import 'package:flutter/material.dart';
import 'package:glossy/glossy.dart';

class GlassMorphic extends StatelessWidget {
  final Widget? widget;
  final double? height;
  final double? width;
  final double? radius;
  const GlassMorphic({
    super.key,
    required this.widget,
    required this.height,
    required this.width,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return GlossyContainer(
      borderRadius: BorderRadius.all(Radius.circular(radius!)),
      border: Border.all(style: BorderStyle.none),
      strengthX: 2,
      strengthY: 2,
      width: width!,
      height: height!,
      child: widget,
    );
  }
}
