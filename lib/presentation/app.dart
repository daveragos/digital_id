import 'package:digital_id/app/routes/router.dart';
import 'package:digital_id/app/theme/theme.dart';
import 'package:flutter/material.dart';

class DigitalId extends StatelessWidget {
  const DigitalId({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Digital Id',
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      theme: AppTheme.light,
      themeMode: ThemeMode.system,
    );
  }
}
