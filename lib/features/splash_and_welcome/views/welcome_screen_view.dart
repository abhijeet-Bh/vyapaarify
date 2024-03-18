import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets.dart';
import '../../../core/theme.dart';
import '../widgets/signup_widget.dart';
import '../widgets/welcome_page_header_view.dart';

class WelcomePageView extends StatefulWidget {
  static const String routeName = 'welcome-screen-view';
  const WelcomePageView({super.key});

  @override
  State<WelcomePageView> createState() => _WelcomePageViewState();
}

Widget bottomSheetContent(BuildContext context) {
  return const SignUpWidget();
}

class _WelcomePageViewState extends State<WelcomePageView> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WelcomeHeader(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Automated Business",
                      style: TextStyle(
                        color: AppTheme.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 100.0),
                    child: Text(
                      "Delight clients with effortless ordering.",
                      style: AppTheme.primaryHeadingTextLarge.copyWith(
                        color: AppTheme.whiteColor,
                        fontSize: 36,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      child: Container(
                        height: 51,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppTheme.black,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            "Get started",
                            style: TextStyle(
                              color: AppTheme.whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => bottomSheetContent(context),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
