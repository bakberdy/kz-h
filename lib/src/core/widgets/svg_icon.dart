
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconViewer extends StatelessWidget {
  const SvgIconViewer({
    super.key,
    required this.path,
    required this.size,
    required this.isActive,
    this.activeColor,
    required this.color,
  });

  final String path;
  final double size;
  final bool isActive;
  final Color? activeColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        isActive ? (activeColor ?? Colors.blue) : color,
        BlendMode.srcIn,
      ),
    );
  }
}
