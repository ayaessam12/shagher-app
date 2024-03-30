
import 'package:flutter/material.dart';
import 'package:shagher/routes_manager/routes_manager.dart';

import '../helper/cach_helper.dart';
import '../helper/on_board_widget.dart';

class OnBoardScreen extends StatefulWidget {

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  var boardingController = PageController();

  bool isLast = false;

  List itemsList = OnboardModel.getAllOnBoardItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     TextButton(
      //         onPressed: () {
      //           onSubmit();
      //         },
      //         child: Text(
      //           'Skip',
      //           style: TextStyle(
      //               color: KPrimaryColor, fontSize: 18, fontFamily: 'j'),
      //         ))
      //   ],
      // ),
      body: PageView.builder(
          physics: BouncingScrollPhysics(),
          controller: boardingController,
          itemCount: itemsList.length,
          onPageChanged: (int index) {
            if (index == itemsList.length - 1) {
              setState(() {
                isLast = true;
              });
            } else {
              setState(() {
                isLast = false;
              });
            }
            ;
          },
          itemBuilder: (context, index) {
            return OnboardWidget(itemsList[index], onSubmit, boardingController,
                itemsList, isLast, index);
          }),
    );
  }

  void onSubmit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value == true) {
        Navigator.pushNamed(context, Routes.homeRoute);
      }
    });
  }
}

class OnboardModel {
  String imagePath;
  String title;
  String body;

  OnboardModel(this.imagePath, this.title, this.body);

  static List<OnboardModel> getAllOnBoardItems = [
    OnboardModel('assets/images/splash1.png','تطبيق يقدم آخر الأخبار الوظيفية ',
        'وظائف مدنيةوعسكرية وشركات؛ ونتائج القبول للجهات المعلنة'
        'وتم توفير تطبيقات لنظام الآي أو إس ولنظام الأندرويد'
        'بشكل مجاني، وحسابات للتواصل الإجتماعي'
       ' في أشهر المواقع العالمية.'),
    OnboardModel('assets/images/splash2.png', '',
        'يتم متابعة جديد الوظائف على مدار اليوم مع ارسال'
        'تنبيهات عند توفر وظائف أو اخبار حديثة و يتم تذكيركم'
        'عند بدء تقديم للوظائف'),
    OnboardModel('assets/images/splash3.png', '',
        'مصادر موثوقة يتم جلب أخبار الوظائف و البرامج '
  'و الدورات مع وضع رابط المصدر كل خبر'),
  ];
}






































// import 'package:flutter/material.dart';
// import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class OnboardingScreens extends StatelessWidget {
//   const OnboardingScreens({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//     Scaffold(
//
//     body:
//
//                 OnBoardingSlider(
//
//                 headerBackgroundColor: Colors.white,
//                 finishButtonText: 'Register',
//                 finishButtonStyle: FinishButtonStyle(
//                   backgroundColor: Colors.black,
//                 ),
//
//           //  skipTextButton: Text('Skip'),
//            // trailing: Text('Login'),
//                 background: [
//
//                    SizedBox(height:290, child: Image.asset('assets/images/splash1.png')),
//                   Center(child: SizedBox(height:290, child: Image.asset('assets/images/splash2.png'))),
//                   SizedBox(height:290, child: Image.asset('assets/images/splash3.png')),
//
//
//                 ],
//                 totalPage: 3,
//                 speed: 1.8,
//                 pageBodies: [
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 40),
//                     child: Column(
//                       children: <Widget>[
//                         SizedBox(
//                           height: 370,
//                         ),
//                         Text('تطبيق يقدم آخر الأخبار الوظيفية، وظائف مدنية'
//                         'وعسكرية وشركات؛ ونتائج القبول للجهات المعلنة'
//                         'وتم توفير تطبيقات لنظام الآي أو إس ولنظام الأندرويد'
//                        ' بشكل مجاني، وحسابات للتواصل الإجتماعي'
//                         'في أشهر المواقع العالمية'),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 40),
//                     child: Column(
//                       children: <Widget>[
//                         SizedBox(
//                           height: 480,
//                         ),
//                         Text('يتم متابعة جديد الوظائف على مدار اليوم مع ارسال'
//                         'تنبيهات عند توفر وظائف أو اخبار حديثة و يتم تذكيركم'
//                        ' عند بدء تقديم للوظائف'),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 40),
//                     child: Column(
//                       children: <Widget>[
//                         SizedBox(
//                           height: 480,
//                         ),
//                         Text('مصادر موثوقة يتم جلب أخبار الوظائف و البرامج '
//                         'و الدورات مع وضع رابط المصدر كل خبر'),
//                       ],
//                     ),
//                   ),
//
//                 ],
//           ),
//
//
//
//
//     );
//   }
//
//   }
//
