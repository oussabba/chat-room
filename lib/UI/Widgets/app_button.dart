import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color bgColor;
  final VoidCallback onPressed;
  final bool isLoading;
  const AppButton({
    Key? key,
    required this.label,
    required this.color,
    required this.bgColor,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ))
          : Text(
              label,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          minimumSize: const Size(250, 55),
          elevation: 4,
          primary: bgColor,
          onPrimary: color),
    );
  }
}
