import 'package:flutter/material.dart';

import '../../../core/theme.dart';

class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Namaste, Deepam",
              style: AppTheme.primaryBodyTextLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Order Status",
              style: AppTheme.primaryHeadingTextLarge
                  .copyWith(color: AppTheme.black),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width - 40) / 2,
                  height: 190,
                  decoration: BoxDecoration(
                    color: AppTheme.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 45) / 2,
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xffF2BC18),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width - 45) / 2,
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xff44CA58),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Sales Analytics",
              style: AppTheme.primaryHeadingTextLarge
                  .copyWith(color: AppTheme.black),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              height: 137,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 190,
              decoration: BoxDecoration(
                color: AppTheme.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
