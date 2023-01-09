import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'homeTabs.dart';
import 'utils/theme.dart';

void main() async {
  // loading the environment variables to our app
  // await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, currentMode, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fi_Tracker',
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            themeMode: currentMode,
            //------------------------------------------------------
            home: HomeTabs(),
          );
        });
  }
}
