import 'package:flutter/material.dart';
import 'package:shagher/helper/important_choice_widget.dart';
import 'package:shagher/ui/news_jobs_widget.dart';

import '../size_confing.dart';
class JobCategoryScreen extends StatelessWidget {
  const JobCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('وظائف عسكرية'),
        centerTitle: true,
      ),
       body:ListView(
         children:[ Column(
           children: [
             Container(
                 height: SizeConfig.screenHeight!/7,
                 width: double.infinity,
                 // width: SizeConfig.screenWidth!/1,

                 child:ListView.builder(itemCount: 23,

    itemBuilder: (context, i) {
      {
        return

              ImportantChoiceWidget();
      }
    })

             ),
           ],
         ),
       ])
        // SingleChildScrollView(
      //   child:Container(child: ListView.builder(itemCount: 15,
      //
      //       itemBuilder: (context, i) {
      //         {
      //           return


            //   }
            // }),),

      );
  }
}
