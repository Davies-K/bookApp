import 'package:book_app/AppConfig/app_config.dart';
import 'package:book_app/Core/Helpers/navigation_helper.dart';
import 'package:book_app/Presentation/Layout/adaptive_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _navigateToDesiredPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Container(
          height: heightOfScreen(context) * 0.3,
          child: Lottie.asset(
            'assets/json/splash-book.json',
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ),
    );
  }

  Future _navigateToDesiredPage() {
    return Future.delayed(Duration(seconds: 4), () {
      AppNavigationHelper.navigateAndReplace(context, pageName: 'authenticate');
    });
  }
}
