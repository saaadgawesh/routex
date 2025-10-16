// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routex_app/core/constant/appthem.dart';
import 'package:routex_app/features/view/auth/register/registrationcubit.dart';
import 'package:routex_app/features/view/splash/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const RouteXApp());
}

class RouteXApp extends StatelessWidget {
  const RouteXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RouteX-3',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const RegistrationWelcomeScreen(),
      // Add routes here
      routes: {
        '/splash': (context) => const SplashScreen(),
      },
    );
  }
}
