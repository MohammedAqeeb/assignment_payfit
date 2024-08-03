import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:paygo_assignment/app/home/home_screen.dart';
import 'package:paygo_assignment/constants/colors.dart';
import 'package:paygo_assignment/constants/images.dart';
import 'package:paygo_assignment/constants/styles.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  List appScreens = [
    const HomeScreen(),
    const Center(child: Text('Booking')),
    const Center(child: Text('Explore')),
    const Center(child: Text('Profile')),
  ];

  void onSelect(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: appScreens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueGrey,
        onTap: onSelect,
        currentIndex: selectedIndex,
        unselectedItemColor: greyTextColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: labelText.copyWith(
          fontSize: 12,
          color: purpleColor,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: labelText.copyWith(
          fontSize: 12,
          color: greyTextColor,
          fontWeight: FontWeight.w500,
        ),
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            label: 'Home',
            activeIcon: Icon(
              FluentSystemIcons.ic_fluent_home_filled,
              color: purpleColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(pipeLogo),
            label: 'Bookings',
            activeIcon: Image.asset(pipeLogo, color: purpleColor),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(chartLogo),
            label: 'Explore',
            activeIcon: Image.asset(chartLogo, color: purpleColor),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(userLogo),
            activeIcon: Image.asset(
              userLogo,
              color: purpleColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
