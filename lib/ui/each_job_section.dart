import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shagher/ui/section_widget.dart';

import '../api_manager/SectionResponse.dart';
import '../helper/important_choice_widget.dart';
import '../size_confing.dart';
import 'news_jobs_widget.dart';
class JobsSection extends StatelessWidget {
Section section;
JobsSection(this.section);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

 return
    Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)
            )
        ),
        title: Text('وظائف عسكرية',style:GoogleFonts.notoKufiArabic(
            color:Colors.white)),
        centerTitle: true,
      ),
body:
ListView(
 children:[
   
   Padding(
   padding: const EdgeInsets.all(8.0),
   child: Container(
       height: SizeConfig.screenHeight!/5,

       width: SizeConfig.screenWidth!/4,

       child: ImportantChoiceWidget()),
 ),

]));


  }
}
