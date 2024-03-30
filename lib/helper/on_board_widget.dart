import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shagher/routes_manager/routes_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../ui/onbording_screen.dart';

class OnboardWidget extends StatelessWidget {
  Function onSubmit;
  var controller;
  List itemsList;
  bool isLast;
  int index;
  OnboardModel onboardModel;



  OnboardWidget(this.onboardModel, this.onSubmit, this.controller,
      this.itemsList, this.isLast, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 5, right: 5, top: 40, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              child: Image(
                image: AssetImage(onboardModel.imagePath),
                //fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    onboardModel.title,
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color:Colors.blue),
                  ),
                  Text(onboardModel.body,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black38)),
                  const SizedBox(
                    height: 50,
                  ),
                  SmoothPageIndicator(
                      controller: controller,
                      effect:  ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 5,
                          expansionFactor: 4,
                          activeDotColor: Colors.pinkAccent),
                      count: itemsList.length),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 100,
                    height: 60,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, Routes.homeRoute);
                          },
                          child:IconButton(onPressed: () {  }, icon: Icon(Icons.keyboard_double_arrow_left),

                          )
                          // Text(
                          //   'تخطي',
                          //   style: TextStyle(
                          //       color: Colors.blue,
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.w600),
                          // ),
                        ),
                      ],
                    ))),
                Container(
                  height: 50,
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue),
                  child: MaterialButton(
                    onPressed: () {
                      if (isLast ) {
                        Navigator.pushNamed(context, Routes.homeRoute);

                      } else {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 200),
                            // curve: Curves.easeInToLinear
                            curve: Curves.easeInOut);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){if(isLast == true){
                          Navigator.pushNamed(context, Routes.homeRoute);
                          }
                          },
                          child: Text(
                            isLast ? "ابدأ"
                            : 'التالي',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
