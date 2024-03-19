import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vyapaarify/core/coming_soon_page.dart';
import 'package:vyapaarify/core/theme.dart';
import 'package:vyapaarify/features/orders/views/orders_view.dart';

import '../../../core/assets.dart';
import '../widgets/dashboard_widget.dart';

class DashboardView extends StatefulWidget {
  static const String routeName = 'dashboard-view';
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

bool isOpen = true;
int _selectedIndex = 1;
List<Widget> _widgetList = <Widget>[
  const DashBoardWidget(),
  const OrderView(),
  const ComingSoonPage(),
  const ComingSoonPage(),
];

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          Assets.logo,
          width: 100,
          color: AppTheme.black,
        ),
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
      body: SafeArea(
        child: _widgetList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        backgroundColor: AppTheme.whiteColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              Assets.homeIconActive,
              width: 20,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(
              Assets.homeIcon,
              width: 26,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              Assets.bellIconActive,
              width: 26,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(
              Assets.bellIcon,
              width: 26,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              Assets.pastOrdersActive,
              width: 22,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(
              Assets.pastOrders,
              width: 24,
              colorFilter: const ColorFilter.mode(
                Colors.black,
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
                Colors.black,
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
