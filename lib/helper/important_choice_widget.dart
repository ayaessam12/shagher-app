


















import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shagher/size_confing.dart';
class NewsJobsWidget extends StatelessWidget {
  const NewsJobsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 12),
        itemCount: 5,
        separatorBuilder:(context,i) {
          return SizedBox(width: 12,);
        },
        itemBuilder: (BuildContext context, i){
          return



            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Colors.grey

                    ),
                    borderRadius: BorderRadius.circular(20)
                ),
                height: SizeConfig.screenHeight!/3,

                width: SizeConfig.screenWidth!/1.7,
                child:
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    child: Column(

                      children: [

                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: Column(

                            children: [

                              Container(

                                height: 30,

                                width: 30,


                                margin: EdgeInsets.all(3),

                                decoration: BoxDecoration(

                                    color: Colors.white,

                                    shape: BoxShape.circle,

                                    boxShadow: [

                                      BoxShadow(

                                          blurRadius: 3,

                                          color: Colors.grey


                                      ),

                                    ]),
                                child: Icon(Icons.favorite_border,color: Colors.grey,),
                              ),


                            ],

                          ),
                        ),


                        // SizedBox(height: SizeConfig.screenHeight!/55,),
                        CircleAvatar(
                          radius: 54,
                          child: CircleAvatar(

                            backgroundColor: Colors.white,


                            radius: 52,

                            child: CircleAvatar(


                              radius: 44,


                              backgroundImage: AssetImage('assets/images/splash2.png'),


                            ),

                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10,top: 10),
                          child: Align(
                              alignment:AlignmentDirectional.centerStart,
                              child: AutoSizeText('روضة تميم العالمية',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Align(
                              alignment:AlignmentDirectional.centerStart,
                              child: AutoSizeText('روضة تميم العالمية بالطائف تعلن فتح التوظيف '
                                  'للوظائف التعليمية والإداري',style: TextStyle(fontSize:5),maxLines: 2,)
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight!/60,),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                Icon(Icons.timer_sharp,color: Colors.grey,size: 12,),
                                AutoSizeText(' منذ 5 دقائق',style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                          ),
                        )

                      ],

                    ),


                  ),
                )
            );

        }
    );
  }
}


















// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:english_words/english_words.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:shagher/ui/job_details_screen.dart';
// import '../EntitiesResponse.dart';
// import '../api_manager/api_manager.dart';
//
// import '../size_confing.dart';
// class ImportantChoiceWidget extends StatefulWidget {
//    ImportantChoiceWidget({Key? key}) : super(key: key);
//
//   @override
//   State<ImportantChoiceWidget> createState() => _ImportantChoiceWidgetState();
// }
//
// class _ImportantChoiceWidgetState extends State<ImportantChoiceWidget> {
//   final words = nouns.take(50).toList();
//   bool isFav=false;
//
//   @override
//   Widget build(BuildContext context) {
//
//     SizeConfig().init(context);
//
//     return
//       FutureBuilder<EntitiesResponse>(
//           future: ApiManager.getEntities(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator(),);
//             }
//             if (snapshot.hasError) {
//               return new Text("${snapshot.error.toString()}");
//             }
//             if (snapshot.data?.success == 'error') {
//               return Text('${snapshot.data?.message}');
//             }
//             return ValueListenableBuilder(
//                 valueListenable: Hive.box('Favorites').listenable(),
//                 builder: (context, box, child,) {
//     return ListView.builder(
//         itemCount:snapshot.data?.data?.entities?.length ?? 0 ,
//         itemBuilder: (context,i){
//
//         return
//           Container(
//             decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 1,
//                     color: Colors.grey
//
//                 ),
//                 borderRadius: BorderRadius.circular(20)
//             ),
//             height: SizeConfig.screenHeight!/6,
//
//             width: double.infinity,
//
//
//             child: Row(
//
//           children: [
//
//
//
//             Column(
//               children: [
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child:Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: CircleAvatar(
//                                     radius: 44,
//                                     child: CircleAvatar(
//
//                                       backgroundColor: Colors.white,
//
//
//                                       radius: 42,
//
//                                       child: CircleAvatar(
//
//
//                                         radius: 33,
//
//
//                                         backgroundImage: AssetImage('assets/images/splash2.png'),
//
//
//                 ),
//                 ),),
//                   ),
//                 ),
//               ],
//             ),
//
//             Padding(
//               padding: EdgeInsets.only(top: 10),
//               child: AutoSizeText('روضة تميم العالمية',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,),maxLines: 1,),
//             ),
//
//
//               Padding(
//             padding: EdgeInsets.only(top: 10),
//             child: AutoSizeText('كلية الملك فهد الأمنية تعلن موعد القبول في دورة (الضّباط)'
//             'لحملة الثانوية العامة',style:
//             TextStyle(
//                 color:Colors.black,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),maxLines: 5,),
//               ),
//
//
//
//
//
//             // Container(
//             //
//             //   height: 30,
//             //
//             //   width: 30,
//             //
//             //
//             //   margin: EdgeInsets.all(3),
//             //
//             //   decoration: BoxDecoration(
//             //
//             //       color: Colors.white,
//             //
//             //       shape: BoxShape.circle,
//             //
//             //       boxShadow: [
//             //
//             //         BoxShadow(
//             //
//             //             blurRadius: 3,
//             //
//             //             color: Colors.grey
//             //
//             //
//             //         ),
//             //
//             //       ]),
//             //   child: Icon(Icons.favorite_border,color: Colors.grey,),
//             // ),
//                 //
//                 // SizedBox(height: SizeConfig.screenHeight!/8,),
// //                   Column(
// //                     children: [
// //                       Container(
// //
// //                         height: 30,
// //
// //                         width: 30,
// //
// //
// //                         margin: EdgeInsets.all(3),
// //
// //                         decoration: BoxDecoration(
// //
// //                             color: Colors.white,
// //
// //                             shape: BoxShape.circle,
// //
// //                             boxShadow: [
// //
// //                               BoxShadow(
// //
// //                                   blurRadius: 3,
// //
// //                                   color: Colors.grey
// //
// //
// //                               ),
// //
// //                             ]),
// //                         child: Icon(Icons.favorite_border,color: Colors.grey,),
// //                       ),
// // ]),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(Icons.timer_sharp,color: Colors.grey,size: 12,),
//                             AutoSizeText('منذ 5 دقائق',style: TextStyle(color: Colors.grey),),
//                           ],
//                         ),
//                       ],
//                     ),
//             SizedBox(width: SizeConfig.screenWidth!/35,),
//             Column(
//                 children: [
//                   Container(
//
//                     height: 30,
//
//                     width: 30,
//
//
//                     margin: EdgeInsets.all(3),
//
//                     decoration: BoxDecoration(
//
//                         color: Colors.white,
//
//                         shape: BoxShape.circle,
//
//                         boxShadow: [
//
//                           BoxShadow(
//
//                               blurRadius: 3,
//
//                               color: Colors.grey
//
//
//                           ),
//
//                         ]),
//                     child: Icon(Icons.favorite_border,color: Colors.grey,),
//                   ),
//                 ])
//           ]));
//
//
//
//
//
//
//
//
//
//
//     });
//                   });
//
// });
//   }
// }