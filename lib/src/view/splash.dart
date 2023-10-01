import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/app_themes.dart';
import '../../utils/size_config.dart';
import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData themeData;
  @override
  void initState() {
    super.initState();
    navigation();
  }

  navigation() async {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: themeData.colorScheme.background,
          body: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://media.istockphoto.com/id/1256489977/vector/tasks-check-checklist-blue-icon.jpg?s=612x612&w=0&k=20&c=dUctYWRSmMz1uiSFCCcJUKOyeoxVbvPuLugf8CLQiSo=",
                      width: AppSize.s300,
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Task Done By",
                      style: AppTheme.getTextStyle(
                        fontSize: AppSize.s16,
                        fontWeight: 500,
                        color: themeData.colorScheme.primary,
                      ),
                    ),
                    Text(
                      "Karthikeyan",
                      style: AppTheme.getTextStyle(
                        fontSize: AppSize.s20,
                        fontWeight: 800,
                        color: themeData.colorScheme.error,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
