import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c15/core/models/sura_data.dart';
import 'package:islami_c15/core/theme/app_colors.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "suraDetails";
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  bool isCard = true;
  final List<String> tafsirAlFatiha = [
    "1. بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ\nأبدأ قراءتي باسم الله الذي وسعت رحمته كل شيء، وهو كثير الرحمة دائم العطاء.",
    "2. الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ\nالثناء الكامل لله وحده، فهو رب كل الخلق ومدبر أمرهم.",
    "3. الرَّحْمَٰنِ الرَّحِيمِ\nالذي يتصف بالرحمة الواسعة والعطف الدائم.",
    "4. مَالِكِ يَوْمِ الدِّينِ\nهو المتصرف والحاكم الوحيد في يوم القيامة، يوم الحساب والجزاء.",
    "5. إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ\nلا نعبد إلا أنت، ولا نطلب العون إلا منك.",
    "6. اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ\nدلّنا وأرشدنا إلى الطريق المستقيم الواضح الذي يرضيك.",
    "7. صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ\nطريق من أنعمت عليهم بالإيمان والهداية من عبادك الصالحين.",
    "غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ\nوليس طريق الذين غضبت عليهم أو الذين ضلّوا عن الحق."
  ];

  @override
  Widget build(BuildContext context) {
    SuraData data = ModalRoute.of(context)!.settings.arguments as SuraData;
    if (verses.isEmpty) {
      readFile(data.id);
    }
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppColors.primaryColor,
        ),
        title: Text(
          data.suraEn,
          style: TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                isCard = !isCard;
                setState(() {});
              },
              icon: Icon(Icons.change_circle_outlined))
        ],
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/images/left.png"),
                Expanded(
                  child: Center(
                    child: Text(
                      data.suraAr,
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Image.asset("assets/images/right.png"),
              ],
            ),
            isCard
                ? Expanded(
                    child: ListView.builder(
                      itemCount: verses.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border:
                                  Border.all(color: AppColors.primaryColor)),
                          child: Center(
                            child: Text(
                              "${verses[index].trim()} ( ${index + 1} )",
                              style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.amiriQuran().fontFamily,
                                  color: AppColors.primaryColor,
                                  fontSize: 18),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: Text.rich(
                        TextSpan(
                            children: verses.map(
                          (e) {
                            int index = verses.indexOf(e);
                            return TextSpan(
                                text: e.trim(),
                                style: TextStyle(
                                  color: e.contains("اللَّه")? Colors.blue:null
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          child: Center(
                                              child: Text(
                                            tafsirAlFatiha[index],
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.rtl,
                                          )),
                                        );
                                      },
                                    );
                                  },
                                children: [
                                  TextSpan(
                                      text: "${index + 1} ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "quran2",
                                          fontSize: 30))
                                ]);
                          },
                        ).toList()),
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 22,
                            fontFamily: GoogleFonts.amiriQuran().fontFamily),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Future<void> readFile(int id) async {
    String sura =
        (await rootBundle.loadString("assets/suras/${id + 1}.txt")).trim();
    verses = sura.split("\n");
    setState(() {});
  }
}
