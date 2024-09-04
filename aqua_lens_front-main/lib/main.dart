import 'package:aqua_lens/core/app_theme.dart';
import 'package:aqua_lens/features/onboarding/presentation/screens/educate_screen.dart';
import 'package:aqua_lens/features/onboarding/presentation/screens/how_screen.dart';
import 'package:aqua_lens/features/onboarding/presentation/screens/welcome_screen.dart';
import 'package:aqua_lens/features/scan/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.light(),
        routes: {
          'welcome': (context) => const WelcomeScreen(),
          'home': (context) => const HomeScreen(),
          "how": (context) => const HowScreen(),
          "edu": (context) => const EducationScreen()
        },
        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen());
  }
}
