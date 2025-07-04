import 'package:flutter/material.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/quran_background.png"),)

      ),
      child: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/logo/home_logo.png",
                height: 140,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
