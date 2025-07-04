import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c15/core/models/sura_data.dart';
import 'package:islami_c15/core/theme/app_colors.dart';
import 'package:islami_c15/modules/layout/screens/hadeth_screen.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "hadethDetails";
  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    HadethData data = ModalRoute.of(context)!.settings.arguments as HadethData;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppColors.primaryColor,
        ),
        title: Text(
          data.title,
          style: TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Text(data.body,style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                color: AppColors.primaryColor
              ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),          ],
        ),
      ),
    );
  }

}
