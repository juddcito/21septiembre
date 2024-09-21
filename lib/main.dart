import 'package:flor_amarilla/app_theme.dart';
import 'package:flor_amarilla/dialog_screen.dart';
import 'package:flor_amarilla/flor_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const DialogScreen()
    );
  }
}
