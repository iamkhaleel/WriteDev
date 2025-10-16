import 'package:flutter/material.dart';
import 'features/onboarding/onboarding_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WriteDev Onboarding',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'SpaceGrotesk',
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF1b63bb),
          background: const Color(0xFFf6f7f8),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'SpaceGrotesk',
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF1b63bb),
          surface: const Color(0xFF0E1A2B),
        ),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
    );
  }
}


