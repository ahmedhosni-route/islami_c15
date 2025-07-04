import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c15/core/constatn/app_constant.dart';
import 'package:islami_c15/core/models/sura_data.dart';
import 'package:islami_c15/core/theme/app_colors.dart';
import 'package:islami_c15/modules/layout/widgets/most_recently_card.dart';
import 'package:islami_c15/modules/layout/widgets/sura_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<int> indexes = [];
  List<String> mostRecently = [];
  @override
  void initState() {
    getMostRecently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/quran_background.png",
              ),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/logo/home_logo.png",
                height: 140,
              ),
            ),
            TextField(
              onChanged: (value) {
                search(value);
              },
              cursorColor: AppColors.primaryColor,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Sura Name",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        "assets/icons/quran.svg",
                        color: AppColors.primaryColor,
                        width: 24,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColors.primaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColors.primaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColors.primaryColor))),
            ),
            SizedBox(
              height: 8,
            ),
            if (indexes.isEmpty && mostRecently.isNotEmpty)
              Text(
                "Most Recently",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            if (indexes.isEmpty && mostRecently.isNotEmpty)
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mostRecently.length,
                  itemBuilder: (context, index) {
                    int currentIndex = int.parse(mostRecently[index]);
                    return MostRecentlyCard(
                        suraData: SuraData(
                            suraAr: AppConstatnt.suraAr[currentIndex],
                            suraEn: AppConstatnt.suraEn[currentIndex],
                            ayahNumber: AppConstatnt.ayahNumber[currentIndex],
                            id: currentIndex));
                  },
                ),
              ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Suras List",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(8),
                itemCount: indexes.isEmpty
                    ? AppConstatnt.suraAr.length
                    : indexes.length,
                itemBuilder: (context, index) {
                  int curentIndex = indexes.isEmpty ? index : indexes[index];
                  return SuraWidget(
                    onTap: () {
                      addMostRecently(curentIndex);
                    },
                    suraData: SuraData(
                      suraAr: AppConstatnt.suraAr[curentIndex],
                      suraEn: AppConstatnt.suraEn[curentIndex],
                      ayahNumber: AppConstatnt.ayahNumber[curentIndex],
                      id: curentIndex,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 24,
                    endIndent: 20,
                    indent: 20,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void search(String value) {
    indexes.clear();
    try {
      int index = int.parse(value);
      indexes.add(index - 1);
    } catch (e) {
      AppConstatnt.suraEn.where(
        (element) {
          if (element.toLowerCase().contains(value.toLowerCase())) {
            indexes.add(AppConstatnt.suraEn.indexOf(element));
          }
          return true;
        },
      ).toList();
      AppConstatnt.suraAr.where(
        (element) {
          if (element.toLowerCase().contains(value.toLowerCase())) {
            indexes.add(AppConstatnt.suraAr.indexOf(element));
          }
          return true;
        },
      ).toList();
    }
    if (value.isEmpty) {
      indexes.clear();
    }
    setState(() {});
  }

  void addMostRecently(int id) async {
    if (mostRecently.contains(id.toString())) {
      return;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostRecently.insert(0, id.toString());
    await prefs.setStringList("most", mostRecently);
    setState(() {});
  }

  void getMostRecently() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostRecently = prefs.getStringList("most") ?? [];
    setState(() {});
  }
}
