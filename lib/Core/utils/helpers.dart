import 'package:flutter/material.dart';

push({required BuildContext context, required Widget page}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

showSnackBar(BuildContext context, String message,
    [Color? backgroundColor, SnackBarAction? action, TextAlign? textAlign]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      content: Text(
        message,
        maxLines: 2,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: textAlign ?? TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
      action: action,
    ),
  );
}
