import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../api_manager/AdvertisementResponse.dart';
import '../api_manager/api_manager.dart';
import '../size_confing.dart';

class HomeSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return
      ImageSlideshow(

        /// Width of the [ImageSlideshow].
        width: double.infinity,

        /// Height of the [ImageSlideshow].
        // height: SizeConfig.screenHeight!/1.5,

        /// The page to show when first creating the [ImageSlideshow].
        initialPage: 0,

        /// The color to paint the indicator.
        indicatorColor: Colors.blue,

        /// The color to paint behind th indicator.
        indicatorBackgroundColor: Colors.grey,

        /// The widgets to display in the [ImageSlideshow].
        /// Add the sample image file into the images folder
        children: [

      FutureBuilder<AdvertisementResponse> (
      future: ApiManager.getAdvertise(),
    builder: (context , snapshot){
    if(snapshot.connectionState == ConnectionState.waiting){
    return Center(child: CircularProgressIndicator(),);
    }
    if (snapshot.hasError) {
    return new Text("${snapshot.error.toString()}");
    }
    if(snapshot.data?.success == 'error'){
    return  Text ('${snapshot.data?.message}');
    }
    return ListView.builder(
    itemCount: snapshot.data?.data?.ads?.length ?? 0,

    itemBuilder: (context, i) {
    return
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenHeight!/65,vertical: SizeConfig.screenWidth!/15),
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(245, 245, 247, 100)
              ),
              height: SizeConfig.screenHeight!/6,
              width: double.infinity,
              child:

                  // Row(
                  // children: [
                      // Container(
                      //
                      //
                      // child:
                      //
                      // //         Column(
                      // //
                      // //             children: [
                      // //
                      // //               Align(alignment:Alignment.bottomCenter,child: Text('مركز نون')),
                      // //           Text(
                      // //               'للدورات الانجليزية'),
                      // ]),
                      //         ),


// SizedBox(width: 4,),
                              Container(
                                  child:


    Image.network('${snapshot.data?.data?.ads?[i].image}',fit: BoxFit.cover,)


)
                           //Image.asset('assets/images/Mask Group 1.png'),


                            ),
                );});
    })

                    ],





          // Image.asset(
          //   AssetsManager.slide6,
          //   fit: BoxFit.fill,
          // ),



        /// Called whenever the page in the center of the viewport changes.
        onPageChanged: (value) {
          print('Page changed: $value');
        },

        /// Auto scroll interval.
        /// Do not auto scroll with null or 0.
        autoPlayInterval: 3000,

        /// Loops back to first slide.
        isLoop: true,


      );
  }
}
