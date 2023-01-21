import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:traveling/utils/extensions/string_extension.dart';
import 'package:traveling/views/pages/profile_screen.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import 'locations_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  DateTime? currentBackPressTime;

  List<Widget> fragmentList = [
    LocateScreen(),
    LocateScreen(),
    ProfileScreen(),
  ];

  List<String> screenName = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    afterBuildCreated(
      () async {},
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        DateTime now = DateTime.now();

        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          toast('Press again to close');
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        body: fragmentList[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: compass.iconImage(color: appTextSecondaryColor),
              label: 'Explore',
              activeIcon: compass.iconImage(color: primaryColor),
            ),
            BottomNavigationBarItem(
              icon: plus.iconImage(color: appTextSecondaryColor),
              label: 'Create Tour',
              activeIcon: plus.iconImage(color: primaryColor),
            ),
            BottomNavigationBarItem(
              icon: profile.iconImage(color: appTextSecondaryColor),
              label: 'Profile',
              activeIcon: profile.iconImage(color: primaryColor),
            ),
          ],
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
