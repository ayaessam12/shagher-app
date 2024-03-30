import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shagher/api_manager/JobsDetailsResponse.dart';

import '../api_manager/api_manager.dart';
import '../size_confing.dart';
class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);


    return
      Scaffold(
appBar: AppBar(
  title: Text('efddfdf'),
),

    body:  FutureBuilder<JobsDetailsResponse>(
future: ApiManager.getJobDetails(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: CircularProgressIndicator(),);
    }
    if (snapshot.hasError) {
    return new Text("${snapshot.error.toString()}");
    }
    if (snapshot.data?.success == 'error') {
    return Text('${snapshot.data?.message}');
    }
    return
    ListView.builder(
    itemCount: snapshot.data?.data?.jobs?.length ?? 0,

    itemBuilder: (context, i) {
    return

    Container(
      height:685,
  width: double.infinity,
  child:

      Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
          child: CircleAvatar(
            radius: 50,
            backgroundImage:  NetworkImage(
      '${snapshot.data
          ?.data
          ?.jobs?[i].entity?.logo
          }'),
          ),
        ),
        SizedBox(height: 30,),

           Align(
             alignment: Alignment.center,
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: AutoSizeText('${snapshot?.data?.data?.jobs?[i].entity?.name}',maxLines: 4,),
             )),
            
SizedBox(height: SizeConfig.screenHeight!/45,),

Flexible(
  flex:1,
  fit: FlexFit.loose,

  child:   Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(50,),topLeft: Radius.circular(50)),
        color: Colors.blue,

      ),

  width: double.infinity,


  child: SingleChildScrollView(

      child: Column(



        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [

          SizedBox(height:30),

          Align(

            alignment: Alignment.center,

            child: Text('الشركة الوطنية الأولى للتشغيل والصيانة (نوماك) توفر\n'

  '             وظيفة (مساعد تنفيذي) بجدة'),

          ),

          SizedBox(height: 30,),

          Align(

            alignment: Alignment.center,

            child: Text('أعلنت الشركة الوطنية الأولى للتشغيل والصيانة المحدودة (نوماك) \n'

            '        توفر وظيفة (مساعد تنفيذي) بمحافظة جدة،\n'

            '        وذلك وفقاً للمسميات وطريقة التقديم الموضحة أدناه.\n')),



  SizedBox(height: 40,),

          Align(

            alignment: Alignment.center,

            child:  AutoSizeText('المسمى الوظيفي:')),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: AutoSizeText('${snapshot.data?.data?.jobs?[i].entity?.name}',maxLines: 6,)),
      ),



  SizedBox(height: 30,),

          Align(

            alignment: Alignment.center,

            child: AutoSizeText('التفاصيل:')),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText('${snapshot.data?.data?.jobs?[i].details}'
                  'hgghhgghhgghhg'
                  'ghhhhhhhhhhhhhhhhhhh'
                  'ghhhhhhhhhhhhhhhh'
                  'ghhhhhhhhhhhhhh'
                  'ghhhhhhhhhhhhhh'
                  'ghhhhhhhhhhhhhhh'
                  'hggggggggggggggg'
                  'ghhhhhhhhhhhhh',maxLines:20,),
            ),







   SizedBox( height: 30,),

  Align(

      alignment: Alignment.center,

      child: AutoSizeText('الشروط:')),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: AutoSizeText('  ${snapshot.data?.data?.jobs?[i].qualification}gfdhgghgjgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg',
        maxLines: 6,












        ),
    ),



      SizedBox(height: 30,),

  Align(

      alignment: Alignment.center,

      child: Text(' موعد التقديم:')),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: AutoSizeText('${snapshot.data?.data?.jobs?[i].date}')),
    ),











            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed:(){}, child:

              Text('رابط التقديم')),
            ),





          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed:(){}, child:

            Text('المصدر')),
          ),



        ],

      ),

  ),

  ),
)

      ],
      ));



    });}));
}}
