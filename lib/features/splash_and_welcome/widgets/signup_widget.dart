import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vyapaarify/core/assets.dart';
import 'package:vyapaarify/features/dashboard/views/dashboard_view.dart';

import '../../../core/theme.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  bool isInitial = true;
  bool isLast = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: AppTheme.whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: isInitial
                  ? SignupGoogleEmail(
                      emailController: emailController,
                    )
                  : SignupEmail(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                child: Container(
                  height: 51,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: AppTheme.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if (isLast) {
                    Navigator.pushReplacementNamed(
                      context,
                      DashboardView.routeName,
                    );
                  }
                  setState(() {
                    isLast = true;
                    isInitial = !isInitial;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SignupGoogleEmail extends StatelessWidget {
  final TextEditingController emailController;
  const SignupGoogleEmail({
    super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Sign in with",
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Let's get those orders rolling.",
            style: AppTheme.primaryBodyTextSmall.copyWith(
              color: AppTheme.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            child: Container(
              height: 51,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppTheme.black,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.googleIcon,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Sign in with Google",
                      style: TextStyle(
                        color: AppTheme.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.line,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "or sign in with email",
                style: TextStyle(
                    fontSize: 12, color: AppTheme.black.withOpacity(0.5)),
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                Assets.line,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Email Address",
            style: AppTheme.primaryBodyTextSmall.copyWith(
              color: AppTheme.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              filled: true,
              hintText: "Enter your business email address",
              hintStyle:
                  TextStyle(color: const Color(0xff222222).withOpacity(0.5)),
              fillColor: const Color(0xff222222).withOpacity(0.10),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: AppTheme.black.withOpacity(0.25)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SignupEmail extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const SignupEmail({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Sign in with",
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Let's get those orders rolling.",
            style: AppTheme.primaryBodyTextSmall.copyWith(
              color: AppTheme.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Email Address",
            style: AppTheme.primaryBodyTextSmall.copyWith(
              color: AppTheme.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              filled: true,
              hintText: "Enter your business email address",
              hintStyle:
                  TextStyle(color: const Color(0xff222222).withOpacity(0.5)),
              fillColor: const Color(0xff222222).withOpacity(0.10),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: AppTheme.black.withOpacity(0.25)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Password",
            style: AppTheme.primaryBodyTextSmall.copyWith(
              color: AppTheme.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              filled: true,
              hintText: "Enter your password",
              hintStyle:
                  TextStyle(color: const Color(0xff222222).withOpacity(0.5)),
              fillColor: const Color(0xff222222).withOpacity(0.10),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: AppTheme.black.withOpacity(0.25)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
