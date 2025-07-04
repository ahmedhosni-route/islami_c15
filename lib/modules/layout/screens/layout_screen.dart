import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c15/core/theme/app_colors.dart';
import 'package:islami_c15/modules/layout/screens/hadeth_screen.dart';
import 'package:islami_c15/modules/layout/screens/quran_screen.dart';
import 'package:islami_c15/modules/layout/screens/sebha_screen.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = "layout";
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    SebhaScreen(),
    SebhaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(150),
      //     child: SafeArea(
      //       child: Image.asset(
      //         "assets/logo/home_logo.png",
      //         height: 150,
      //       ),
      //     ),),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primaryColor,
          selectedItemColor: Colors.white,
          showUnselectedLabels: false,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/quran.svg"),
                label: "Quran",
                activeIcon: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColors.textColor.withValues(alpha: 0.4)),
                  child: SvgPicture.asset(
                    "assets/icons/quran.svg",
                    // colorFilter: ColorFilter.mode(color, BlendMode.clear),
                    color: Colors.white,
                  ),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/hadeth.svg"),
                label: "Hadeth",
                activeIcon: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColors.textColor.withValues(alpha: 0.4)),
                  child: SvgPicture.asset(
                    "assets/icons/hadeth.svg",
                    // colorFilter: ColorFilter.mode(color, BlendMode.clear),
                    color: Colors.white,
                  ),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/sebha.svg"),
                label: "Sebha",
                activeIcon: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColors.textColor.withValues(alpha: 0.4)),
                  child: SvgPicture.asset(
                    "assets/icons/sebha.svg",
                    // colorFilter: ColorFilter.mode(color, BlendMode.clear),
                    color: Colors.white,
                  ),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/radio.svg"),
                label: "Radio",
                activeIcon: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColors.textColor.withValues(alpha: 0.4)),
                  child: SvgPicture.asset(
                    "assets/icons/radio.svg",
                    // colorFilter: ColorFilter.mode(color, BlendMode.clear),
                    color: Colors.white,
                  ),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/salaah.svg"),
                label: "Time",
                activeIcon: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColors.textColor.withValues(alpha: 0.4)),
                  child: SvgPicture.asset(
                    "assets/icons/salaah.svg",
                    // colorFilter: ColorFilter.mode(color, BlendMode.clear),
                    color: Colors.white,
                  ),
                )),
          ]),
      body: screens[selectedIndex],
    );
  }
}
