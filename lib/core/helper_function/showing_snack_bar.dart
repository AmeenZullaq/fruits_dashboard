import 'package:flutter/material.dart';

void showingSnackBar(BuildContext context, {required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 4),
    ),
  );
}
