import 'package:flutter/material.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/quran_background.png"))
      ),
    );
  }
}
