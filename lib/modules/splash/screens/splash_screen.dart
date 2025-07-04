import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_c15/core/theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash";
  const SplashScreen({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: ZoomIn(
                    duration: Duration(seconds: 2),
                    child: Center(
                        child: Image.asset("assets/logo/app_logo.png")))),
            FadeInUp(
              delay: Duration(seconds: 2),
              onFinish: (direction) {
                Navigator.pushNamed(context, "layout");
              },
              child: Image.asset(
                "assets/logo/route_logo.png",
                width: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
