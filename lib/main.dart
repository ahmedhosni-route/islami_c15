import 'package:flutter/material.dart';
import 'package:islami_c15/modules/layout/screens/layout_screen.dart';
import 'package:islami_c15/modules/splash/screens/splash_screen.dart';

import 'modules/hadeth_details/screens/hadeth_details_screen.dart';
import 'modules/sura_details/screens/sura_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        LayoutScreen.routeName: (_) => LayoutScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
      },
      initialRoute: SplashScreen.routeName,
      // home: SplashScreen(),
    );
  }
}
