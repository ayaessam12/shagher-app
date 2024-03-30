import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:shagher/api_manager/firebase_api.dart';
import 'package:shagher/routes_manager/routes_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shagher/ui/favourite/favourites/bloc/fav_bloc.dart';
import 'package:shagher/ui/favourite/favourites/bloc/fav_event.dart';
import 'package:shagher/ui/favourite/favourites/models/Entities.dart';
import 'package:shagher/ui/favourite/favourites/repo/local_storage_repo.dart';
import 'package:shagher/ui/onbording_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
 await  Hive.initFlutter();
  Hive.registerAdapter(EntitiesAdapter());

  await Hive.openBox('Favorites');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  MultiBlocProvider(
        providers: [
        BlocProvider(
        create: (_) => FavBloc(localStorageRepository: LocalStorageRepo())
      ..add(StartFav()))
    ],
    child:


      MaterialApp(
      locale: Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // delegate from localization package.
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.onBoardingRoute,

      ));
  }
}

