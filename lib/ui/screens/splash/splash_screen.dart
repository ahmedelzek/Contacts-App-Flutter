import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../home/home_screen.dart';

class Splash extends StatelessWidget {
  static const String routeName = "splash";
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Home.routeName);
    });
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Image.asset(AppAssets.logo),
        ));
  }
}
