import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shagher/api_manager/api_manager.dart';
import 'package:shagher/helper/important_choice_widget.dart';
import 'package:shagher/size_confing.dart';
import 'package:shagher/ui/news_jobs_widget.dart';

import '../api_manager/SubmitData.dart';
class CallUs extends StatefulWidget {
  @override
  State<CallUs> createState() => _CallUsState();
}

class _CallUsState extends State<CallUs> {
TextEditingController nameController = TextEditingController();

   TextEditingController mailController = TextEditingController();

   TextEditingController phoneNumberController = TextEditingController();

   TextEditingController msgController = TextEditingController();

   late SubmitData _submitData;
   bool isFav=false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)
            )
        ),
      ),
      body:


      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
border: OutlineInputBorder(),hintText: ('يرجى ادخال الاسم')
                  ),
                  controller:nameController,
                ),
                SizedBox(height: 25,),


                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),hintText: ('يرجى ادخال البريد')
                  ),
                  controller:mailController,
                ),
                SizedBox(height: 25,),

                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),hintText: ('يرجى ادخال رقم الهاتف')
                  ),
                  controller:phoneNumberController,
                ),
                SizedBox(height: 25,),


                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),hintText: ('اترك رسالة')
                  ),
                  controller:msgController,
                ),
                SizedBox(height: 25,),
                ElevatedButton(onPressed: ()async{
dynamic name= nameController.toString();
dynamic phone_Number= phoneNumberController.toString();

dynamic email= mailController.toString();
dynamic msg =msgController.toString();
SubmitData data = await ApiManager.postData( name, phone_Number, email, msg);

setState(() {
  _submitData = data;
});

                }, child: Text('ارسال')),
              ],
            ),
          ),
        ),
      )

    );
  }
}
