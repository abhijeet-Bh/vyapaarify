import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vyapaarify/core/assets.dart';
import 'package:vyapaarify/core/theme.dart';
import 'package:vyapaarify/features/splash_and_welcome/views/welcome_screen_view.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash-screen-view';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

void navigateAfterDelay(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 3));

  Navigator.pushReplacementNamed(
    context,
    WelcomePageView.routeName,
  );
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterDelay(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppTheme.primaryColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.1,
              child: SvgPicture.asset(
                width: double.infinity,
                height: double.infinity,
                Assets.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  DelayedDisplay(
                    delay: const Duration(seconds: 1),
                    child: SvgPicture.asset(
                      Assets.logo,
                      width: 200,
                    ),
                  ),
                  Text(
                    "An Apni Dukaan Venture Pvt. Ltd.",
                    style: AppTheme.primaryBodyTextMedium
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
