import 'package:flutter/material.dart';

import '../../../constants.dart';

authTopIcon(icon) {
  return Container(
    padding: const EdgeInsets.all(4),
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.grey[200],
    ),
    child: icon,
  );
}
