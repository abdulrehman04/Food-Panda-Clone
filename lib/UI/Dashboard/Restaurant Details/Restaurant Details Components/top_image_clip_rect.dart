import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.lineTo(0, size.height - 15);

    path0.quadraticBezierTo(
      size.width * 0.5,
      size.height + 15,
      size.width,
      size.height - 15,
    );

    path0.lineTo(size.width, size.height);

    path0.lineTo(size.width, 0);

    path0.close();
    return path0;
    // throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
