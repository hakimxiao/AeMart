import 'package:aemart/core/configs/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AeMart());
}

class AeMart extends StatelessWidget {
  const AeMart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
