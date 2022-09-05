import 'package:flutter/material.dart';
import 'package:reasa/widgets.dart';

Widget popularSearchPill(item) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      border: Border.all(
        color: Colors.grey[400]!,
      ),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 13,
      vertical: 3,
    ),
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    child: poppinsText(
      item,
      size: 13,
      weight: FontWeight.w600,
    ),
  );
}
