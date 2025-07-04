import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_c15/core/models/sura_data.dart';

import '../../../core/theme/app_colors.dart';
import '../../sura_details/screens/sura_details_screen.dart';

class MostRecentlyCard extends StatelessWidget {
  final SuraData suraData;
  const MostRecentlyCard({super.key, required this.suraData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,arguments: suraData);

      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  suraData.suraEn,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor),
                ),
                Text(
                  suraData.suraAr,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor),
                ),
                Text(
                  "${suraData.ayahNumber} verses",
                  style: TextStyle(fontSize: 14, color: AppColors.textColor),
                ),
              ],
            ),
            SizedBox(
              width: 12,
            ),
            Image.asset("assets/images/card_image.png")
          ],
        ),
      ),
    );
    ;
  }
}
