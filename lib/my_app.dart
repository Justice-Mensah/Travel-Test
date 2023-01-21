import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:traveling/constants/app_theme.dart';
import 'package:traveling/views/pages/splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (theme, lightTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          title: 'Travel App',
          home: SplashScreen(),
          theme: theme,
          darkTheme: lightTheme,
        );
      },
    );
  }
}
