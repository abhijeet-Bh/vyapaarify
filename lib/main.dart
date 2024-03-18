import 'package:flutter/material.dart';
import 'package:vyapaarify/features/dashboard/views/dashboard_view.dart';
import 'package:vyapaarify/features/splash_and_welcome/views/welcome_screen_view.dart';

import 'features/splash_and_welcome/views/splash_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (ctx) => const SplashScreen(),
        WelcomePageView.routeName: (ctx) => const WelcomePageView(),
        DashboardView.routeName: (ctx) => const DashboardView(),
      },
    );
  }
}
