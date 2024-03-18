import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vyapaarify/core/theme.dart';

import '../../../core/assets.dart';
import '../widgets/dashboard_widget.dart';

class DashboardView extends StatefulWidget {
  static const String routeName = 'dashboard-view';
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

bool isOpen = true;
int _selectedIndex = 0;
List<Widget> _widgetList = <Widget>[
  const DashBoardWidget(),
];

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppTheme.whiteColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Switch(
            activeColor: AppTheme.accentColor,
            value: isOpen,
            onChanged: (bool value) {
              setState(() {
                isOpen = !isOpen;
              });
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
              ),
            ),
          ),
        ],
      ),
      body: const DashBoardWidget(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.dashboardIcon,
              width: 26,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.bellIcon,
              width: 26,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.pastOrders,
              width: 24,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            label: "Past Orders",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.growthIcon,
              width: 24,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            label: "Growth",
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
