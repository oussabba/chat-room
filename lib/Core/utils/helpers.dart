import 'package:flutter/material.dart';

push({required BuildContext context, required Widget page}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
