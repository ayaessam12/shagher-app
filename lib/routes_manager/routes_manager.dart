
import 'package:flutter/material.dart';
import 'package:shagher/ui/call_us_screen.dart';
import 'package:shagher/ui/home_screen.dart';
import 'package:shagher/ui/job_details_screen.dart';
import 'package:shagher/ui/onbording_screen.dart';
import 'package:shagher/ui/rating.dart';
import 'package:shagher/ui/settings_screen.dart';

import '../ui/each_job_section.dart';
import '../ui/favourite/favourites/pages/fav_screen.dart';
import '../ui/jobs_screen.dart';

class Routes{
  static const String onBoardingRoute="/onBoarding";
  static const String homeRoute="/home";
  static const String jobDetailsRoute="/jobDetails";
  static const String settingsRoute="/settings";
  static const String jobCategoryRoute="/jobCategory";
  static const String callUsRoute="/callUs";
  static const String ratingRoute="/rating";
  static const String jobsSectionRoute="/jobsSection";
  static const String favoriteScreenRoute="/favoriteScreen";






}


class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name) {
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) =>   OnBoardScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) =>  HomeScereen());
      case Routes.jobDetailsRoute:
        return MaterialPageRoute(builder: (_) => const JobDetailsScreen());
      case Routes.settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Routes.jobCategoryRoute:
        return MaterialPageRoute(builder: (_) => const JobCategoryScreen());

      case Routes.callUsRoute:
        return MaterialPageRoute(builder: (_) =>  CallUs());

      case Routes.ratingRoute:
        return MaterialPageRoute(builder: (_) =>  Rating());
      case Routes.jobsSectionRoute:
      //   return MaterialPageRoute(builder: (_) =>  JobsSection());
      // case Routes.favoriteScreenRoute:
        return MaterialPageRoute(builder: (_) =>  FavouriteScreen());



      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic>unDefinedRoute(){
    return MaterialPageRoute(builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('not found'),
        ),
        body: Center(child:Text('not found')

        ) ));

  }
}