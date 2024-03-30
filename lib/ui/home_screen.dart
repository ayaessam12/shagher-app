
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shagher/Entities.dart';
import 'package:shagher/api_manager/SectionResponse.dart';
import 'package:shagher/api_manager/api_manager.dart';
import 'package:shagher/helper/home_sliders.dart';
import 'package:shagher/helper/important_choice_widget.dart';
import 'package:shagher/helper/newjobs_widget.dart';
import 'package:shagher/routes_manager/routes_manager.dart';
import 'package:shagher/size_confing.dart';
import 'package:shagher/ui/call_us_screen.dart';
import 'package:shagher/ui/news_jobs_widget.dart';
import 'package:shagher/ui/rating.dart';
import 'package:shagher/ui/section_widget.dart';
import 'package:shagher/ui/settings_screen.dart';

import '../EntitiesResponse.dart';
import 'each_job_section.dart';
import 'favourite/favourites/pages/fav_screen.dart';
class HomeScereen extends StatefulWidget {
  HomeScereen({Key? key}) : super(key: key);
  @override
  State<HomeScereen> createState() => _HomeScereenState();
}
double rating=0;
final scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScereenState extends State<HomeScereen> {

  List <Section> section = [
    Section(
        section_title: "Section ARr",
        section_id: 1,
        section_logo: 'assets/images/building_icon.png'),

  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        key: scaffoldKey,

        appBar: AppBar(
            title: Text(
              selectedSection == null ? "شاغرSHAGHER" : selectedSection!
                  .section_title, style: GoogleFonts.notoKufiArabic(
                color: Colors.indigo
            ),),
            centerTitle: true,

            leading: selectedSection == null ? IconButton(
              icon: Image.asset('assets/images/drawer_icon.png'),
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                  //close drawer, if drawer is open
                } else {
                  scaffoldKey.currentState!.openDrawer();
                  //open drawer, if drawer is closed
                }
              },
            ) :
            IconButton(onPressed: () {
              setState(() {
                selectedSection = null;
                // Navigator.pushNamed(context,Routes.homeRoute);
                // Navigator.pop(context);
              });
            }, icon: Icon(Icons.chevron_left))

          //  : shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(30),
          //     bottomRight: Radius.circular(30)
          //   )
          // ),
        ),
        drawer: Drawer(

          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 60,),
              Center(
                child: Text('شاغرSHAGHER', style: GoogleFonts.notoKufiArabic(
                  color: Color.fromRGBO(73, 88, 252, 100), fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),


              // Center(child: Text('شاغر',style: TextStyle(fontSize:50 ,fontStyle: FontStyle.italic,color: Colors.blue),)),
              // ),
              SizedBox(height: SizeConfig.screenHeight! / 9,),
              ListTile(
                  leading: IconButton(
                      icon: Image.asset(
                        'assets/images/home_icon.png', scale: 4,),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  title: Text("رئيسية", style: GoogleFonts.notoKufiArabic(
                      color: Color.fromRGBO(73, 88, 252, 100)),)
              ),

              // ListTile(
              //   leading: Icon(Icons.settings,color: Colors.blue,), title: Text("إعدادات",style: TextStyle(color: Colors.blue,fontSize: 20),),
              //     onTap:(){ Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) =>  SettingsScreen()),
              //     );
              //   }
              // ),

              ListTile(
                leading: IconButton(
                    icon: Image.asset(
                      'assets/images/civil_job_icon.png', scale: 4,),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                title: Text("وظائف مدنية", style: GoogleFonts.notoKufiArabic(
                  color: Color.fromRGBO(73, 88, 252, 100), fontSize: 15,)),),


              ListTile(
                  leading: IconButton(
                      icon: Image.asset(
                        'assets/images/fighter_job_icon.png', scale: 4,),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  title: Text("وظائف عسكرية", style: GoogleFonts.notoKufiArabic(
                    color: Color.fromRGBO(73, 88, 252, 100), fontSize: 15,),)
              ),

              ListTile(
                leading: IconButton(
                    icon: Image.asset(
                      'assets/images/company_job_icon.png', scale: 4,),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                title: Text("وظائف شركات", style: GoogleFonts.notoKufiArabic(
                  color: Color.fromRGBO(73, 88, 252, 100), fontSize: 15,),),
              ),

              ListTile(
                leading: IconButton(
                    icon: Icon(Icons.favorite_border,
                      color: Color.fromRGBO(73, 88, 252, 100), size: 30,),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.favoriteScreenRoute);
                    }),
                title: Text("المفضلة", style: GoogleFonts.notoKufiArabic(
                  color: Color.fromRGBO(73, 88, 252, 100), fontSize: 15,),),
              ),

              ListTile(
                leading: IconButton(
                    icon: Icon(Icons.star_rate_outlined,
                      color: Color.fromRGBO(73, 88, 252, 100), size: 30,),
                    onPressed: () {
                     showRating();
                    }),
                title: Text("ضع تقييمك", style: GoogleFonts.notoKufiArabic(
                  color: Color.fromRGBO(73, 88, 252, 100), fontSize: 15,),),
              ),


              SizedBox(height: SizeConfig.screenHeight! / 2.5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CallUs()),
                        );
                      },
                      child: Text('اتصل بنا', style: GoogleFonts.notoKufiArabic(
                        color: Color.fromRGBO(73, 88, 252, 100),
                        fontSize: 15,),)),
                  Text('ساسية خصوصية', style: GoogleFonts.notoKufiArabic(
                    color: Color.fromRGBO(73, 88, 252, 100), fontSize: 15,),),

                ],
                ),
              )
            ],
          ),
        ),


        body: selectedSection == null ?
        ListView(

            children: [

              SizedBox(height: SizeConfig.screenHeight! / 70),


              Row(


                  children: [
                    Container(


                        height: 66,


                        width: 380,


                        child:


                        FutureBuilder<SectionResponse>(
                            future: ApiManager.getSection(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),);
                              }
                              if (snapshot.hasError) {
                                return new Text("${snapshot.error.toString()}");
                              }
                              if (snapshot.data?.success == 'error') {
                                return Text('${snapshot.data?.message}');
                              }

                              return
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),

                                  itemBuilder: (context, index) =>
                                      SectionWidget(section: section[index],
                                        onClickItem: onClick,

                                        index: index,),
                                  itemCount: snapshot.data?.data?.sections
                                      ?.length,
                                  scrollDirection: Axis.horizontal,);
                            })
                    )
                  ]),


              Container(
                  height: SizeConfig.screenHeight! / 4,
                  width: double.infinity,

                  child: HomeSlider()),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('جديد الوظائف', style: GoogleFonts.notoKufiArabic(
                        color: Color.fromRGBO(73, 88, 252, 100),
                        fontSize: 15,)),

                      Text('عرض المزيد', style: GoogleFonts.notoKufiArabic(
                        color: Color.fromRGBO(73, 88, 252, 100),
                        fontSize: 15,),),
                      //
                    ]),
              ),

//
//
              SizedBox(height: 25,),

              Container(

                  height: SizeConfig.screenHeight! / 3,

                  width: SizeConfig.screenWidth! / 1.7,
                  child: NewsJobsWidget()),


              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('مختارات شركات', style: GoogleFonts.notoKufiArabic(
                        color: Color.fromRGBO(73, 88, 252, 100),
                        fontSize: 15,),),

                      Text('عرض المزيد', style: GoogleFonts.notoKufiArabic(
                        color: Color.fromRGBO(73, 88, 252, 100),
                        fontSize: 15,),),
                      //
                    ]),
              ),


              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                    height: SizeConfig.screenHeight! / 5,

                    width: SizeConfig.screenWidth! / 4,

                    child: ImportantChoiceWidget()),
              ),


            ])
            : JobsSection(selectedSection!)
    );
  }

  Section? selectedSection = null;

  void onClick(Section section) {
    setState(() {
      selectedSection = section;
    });
  }


  double rating = 0;

  void showRating() =>
      showDialog(context: context, builder: (context) =>
          AlertDialog(
            title: Text('تقييمك يهمنا'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('من فضلك ضع التقييم المناسب'),
                SizedBox(height: 32,),
                RatingBar.builder(
                  minRating: 1,
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: Colors.amberAccent,),
                  updateOnDrag: true,
                  onRatingUpdate: (rating) =>
                      setState(() {
                        this.rating = rating;
                      }),

                )
              ],
            ),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context,);
              }, child: Text('تم'))
            ],
          ));
}



//134ff16246144b05b26294a801eadf42