import 'package:flutter/material.dart';
import 'package:vyapaarify/core/theme.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Page Under Construction!",
            style: AppTheme.primaryHeadingTextMedium,
          ),
        )
      ],
    );
  }
}
