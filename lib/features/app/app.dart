import 'package:flutter/material.dart';
import 'package:forestvpn_test/features/app/routes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().generateRouter(),
    );
  }
}
