import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiapi_design_thiran/src/view/splash.dart';
import 'package:uiapi_design_thiran/utils/size_config.dart';

import 'utils/app_themes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return MaterialApp(
      title: 'Interview User Data',
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      home: const SplashScreen(),
    );
  }
}
