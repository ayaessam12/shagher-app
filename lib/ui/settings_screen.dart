import 'package:flutter/material.dart';
import 'package:shagher/helper/toggle_button.dart';
import 'package:shagher/size_confing.dart';
import 'package:toggle_switch/toggle_switch.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(' إعدادات'),
        centerTitle: true,

      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth!/30,vertical: SizeConfig.screenHeight!/30),
          child: Column(
            children: [

              SizedBox(height: SizeConfig.screenHeight!/10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [


                ],
              ),
              SizedBox(height: SizeConfig.screenHeight!/10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                      ToggleButtonWidget(),
                    ],
                  ),
                  // SizedBox(width:SizeConfig.screenWidth!/3),
                  Row(
                    children: [
                      Text('وضع الليلي',style: TextStyle(fontSize: 20),),
                      SizedBox(width: SizeConfig.screenWidth!/65,),
                      Icon(Icons.dark_mode_outlined,color: Colors.blue,size: 30,)
                    ],
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight!/10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                      ToggleButtonWidget(),
                    ],
                  ),
                  // SizedBox(width:SizeConfig.screenWidth!/3),
                  Row(
                    children: [
                      Text('تحديثات',style: TextStyle(fontSize: 20),),
                      SizedBox(width: SizeConfig.screenWidth!/65,),
                      Icon(Icons.update,color: Colors.blue,size: 30,)
                    ],
                  ),
                ],
              )

            ],
          ),
        ),

      ),
    );
  }
}
