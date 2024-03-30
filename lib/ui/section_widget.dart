import 'package:flutter/material.dart';
import 'package:shagher/ui/each_job_section.dart';

import '../api_manager/SectionResponse.dart';
import '../api_manager/api_manager.dart';
class SectionWidget extends StatelessWidget {
  Section section;
  int index;
  Function onClickItem;
  SectionWidget({required this.section,required this.index,required this.onClickItem});

  @override
  Widget build(BuildContext context) {


                  return


                    InkWell(
                      onTap: () {
                        onClickItem(section);
                      },
                      child: Container(
                          height: 60,
                          width: 70,

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

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Image.asset(
                                 section.section_logo,

                                  // 'assets/images/document_icon.png',
                                  height: 20, width: 20,),

                                Text(
                                  section.section_title,
                                  style: TextStyle(
                                      fontSize: 5),)
                              ])
                      ),
                    );

                  // });



        }
  }
  class Section{
    String section_title;
 int section_id;
  String section_logo;
Section({required this.section_title,required this.section_id,required this.section_logo});

}
