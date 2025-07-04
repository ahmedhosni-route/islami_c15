import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c15/core/theme/app_colors.dart';
import 'package:islami_c15/modules/hadeth_details/screens/hadeth_details_screen.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethData> hadethData = [];
  @override
  Widget build(BuildContext context) {
    if(hadethData.isEmpty){
      readAhadeth();

    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/quran_background.png"),
      )),
      child: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/logo/home_logo.png",
                height: 100,
              ),
            ),
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                    // height: MediaQuery.of(context).size.height* 0.65 ,
                    // pageSnapping: true,
                    viewportFraction: 0.8,
                    scrollDirection: Axis.vertical,
                    enlargeCenterPage: true),
                items: hadethData.map((hadeth) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, HadethDetailsScreen.routeName, arguments: hadeth);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.primaryColor),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/left.png",
                                          color:
                                              AppColors.scaffoldBackgroundColor,
                                        ),
                                        Spacer(),
                                        Image.asset(
                                          "assets/images/right.png",
                                          color:
                                              AppColors.scaffoldBackgroundColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: Opacity(
                                          opacity: 0.3,
                                          child: Image.asset(
                                            "assets/images/HadithCardBackGround.png",
                                            height: 350,
                                          ))),
                                  ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                      child: Image.asset(
                                          "assets/images/Mosque-02.png"))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    SizedBox(height: 20,),

                                    Text(hadeth.title,style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(height: 40,),
                                    Expanded(
                                      child: Text(hadeth.body,style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                      ),
                                      textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> readAhadeth() async {
    for (int i = 1; i <= 50; i++) {
      String hadeth = await rootBundle.loadString("assets/Hadeeth/h$i.txt");
      String title = hadeth.trim().split("\n")[0];
      String body = hadeth.trim().split("\n")[1];
      HadethData data = HadethData(title: title, body: body);
      hadethData.add(data);
    }
    setState(() {
    });
  }
}


class HadethData{
  String title;
  String body;
  HadethData({required this.title , required this.body});
}
