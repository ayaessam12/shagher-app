import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shagher/EntitiesResponse.dart';
import 'package:shagher/api_manager/api_manager.dart';
import 'package:shagher/size_confing.dart';
class NewJobWidget extends StatelessWidget {
  const NewJobWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return
      //     ListView.builder(
      //     itemCount: 3,
      //     itemBuilder: (BuildContext context, int index)
      // {
      //   return
      //

          Padding(
            padding:  EdgeInsets.symmetric(horizontal:5,vertical:5),
            child: Container(

              height: SizeConfig.screenHeight! /2.5,
              width: SizeConfig.screenWidth! / 2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1, color: Color.fromRGBO(112, 112, 112, 100))

              ),
              child:




                   Column(
                   //  crossAxisAlignment: CrossAxisAlignment.start,
                     children:[

//                      Container(
// color: Colors.red,
//                        child: Icon(Icons.add),
//                      ),

                       Container(
                         width: double.infinity,
                          height: SizeConfig.screenHeight!/3.6,
                         color: Colors.white,
                         child: Column(


                                children:[
                                Padding(padding: EdgeInsets.symmetric(vertical:SizeConfig.screenHeight!/100)),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 50,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage('assets/images/job_pic1.png'),
                                  ),
                                ),

                                    // Container(
                                    //   height: 40,
                                    //   width: double.infinity,
                                    //   color: Colors.red,
                                    //
                                    //     child:
                 Align(
                   alignment: Alignment.centerRight,
                   child: AutoSizeText(
                                            'روضة تميم العالمية',

                                            style: TextStyle(fontSize: 15),
                                            maxLines: 2,
                                          ),
                 ),

                                Row(
                                  children: [
                                    Expanded(
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child:
                                      Text('روضة تميم العالمية بالطائف تعلن فتح التوظيف'
                                          ,

                                          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
maxLines: 5,
                                      ),
                                      ),
                                    ),


                                  ],
                                ),
                                SizedBox(height:SizeConfig.screenHeight!/25,),
                                  //
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   children: [
                                  //     AutoSizeText(' منذ 5 دقائق',style: TextStyle(fontSize: 5,color: Color.fromRGBO(195, 193, 191, 100)),),
                                  //     Icon(Icons.timer_sharp,size: 10,color: Color.fromRGBO(195, 193, 191, 100),),
                                  //
                                  //   ],
                                  // ),


            ]),





                       )]) ),
          );



}
}