import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  final variants = [
    "В 1465",
    "В 1475",
    "В 1765",
    "В 1415",
    "В 1455",
    "В 1445",
  ];

  @override
  Widget build(BuildContext context) {
    const alphabetLetters = [
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z"
    ];
     final themeData = Theme.of(context);
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Column(
          children: <Widget>[
            SizedBox(height: 120.h,),
            Text("Тема:", style: themeData.textTheme.labelSmall,),
            Text("Казахское ханство",style: themeData.textTheme.headlineSmall,),
            SizedBox(height: 30.h,),
            Container(
              padding: EdgeInsets.only(top: 24.h, right: 20.w, left: 20.w, bottom: 20.h),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color(0xff4A4A4A),
                ),
                borderRadius: BorderRadius.circular(4.r)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Wrap(
                    children: [
                      Text(
                        style: themeData.textTheme.bodyMedium,
                          "В каком году зародилась казахское ханство?"),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: variants.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                    return Column(
                      children: [Container(
                        alignment: Alignment.center,
                        height: 38.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: Color(0xff4A4A4A), width: 1)
                        ),
                        child: Text("${alphabetLetters[index]}) ${variants[index]}", style: themeData.textTheme.bodySmall,),
                      ),
                        SizedBox(height: 10.h,)
                      ]
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
