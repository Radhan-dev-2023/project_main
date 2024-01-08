import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      backgroundColor: const Color(0xFF0E1330),
    ),
  );
}
