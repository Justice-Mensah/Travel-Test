import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:traveling/constants/app_colors.dart';
import 'package:traveling/views/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    init();
  }

  Future<void> init() async {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: secondaryPrimaryColor),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              32.height,
              Text('Travel App',
                  style: boldTextStyle(size: 26, color: primaryColor)),
            ],
          ),
        ],
      ),
    );
  }
}
