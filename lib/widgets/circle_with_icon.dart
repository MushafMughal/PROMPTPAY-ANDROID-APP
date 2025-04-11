import 'package:flutter/material.dart';

class CircleWithIcon extends StatelessWidget {
  const CircleWithIcon({
    super.key,
    required this.icon,
    this.radius = 27,
    this.color = const Color(0xffF4F4F4),
    this.onTap,
  });
  final Widget icon;
  final double radius;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: color,
        radius: radius,
        child: icon,
      ),
    );
  }
}
