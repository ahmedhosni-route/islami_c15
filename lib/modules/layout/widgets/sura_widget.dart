import 'package:flutter/material.dart';
import 'package:islami_c15/core/models/sura_data.dart';
import 'package:islami_c15/modules/sura_details/screens/sura_details_screen.dart';

class SuraWidget extends StatelessWidget {
  final SuraData suraData;
  final Function() onTap;
  const SuraWidget({super.key, required this.suraData,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,arguments: suraData);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/icons/surah_number.png",
                width: 54,
              ),
              Text(
                (suraData.id + 1).toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suraData.suraEn,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "${suraData.ayahNumber} Verses",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Text(
            suraData.suraAr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
