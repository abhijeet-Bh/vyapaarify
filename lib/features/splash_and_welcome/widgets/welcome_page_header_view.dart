import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:vyapaarify/core/assets.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DelayedDisplay(
          delay: const Duration(milliseconds: 200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                Assets.assets1,
                height: 114,
                width: 143,
              ),
              const SizedBox(
                width: 40,
              ),
            ],
          ),
        ),
        DelayedDisplay(
          delay: const Duration(milliseconds: 250),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 17,
              ),
              Image.asset(
                Assets.assets2,
                height: 120,
                width: 226,
              ),
            ],
          ),
        ),
        DelayedDisplay(
          delay: const Duration(milliseconds: 300),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                Assets.assets3,
                height: 174,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
