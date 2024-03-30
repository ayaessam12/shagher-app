import 'package:auto_size_text/auto_size_text.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shagher/ui/favourite/favourites/models/Entities.dart';
import '../../../../size_confing.dart';
import '../bloc/fav_bloc.dart';
import '../bloc/fav_event.dart';
import '../bloc/fav_states.dart';

class FavouriteScreen extends StatefulWidget {

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final words = nouns.take(50).toList();


  bool isFav = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                )
            ),
            title:  Text('المفضلة',style:GoogleFonts.notoKufiArabic(
    color:Colors.white)),
            // automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          body: BlocBuilder<FavBloc, FavState>(
            builder: (context, state) {
              if (state is FavLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              if (state is FavLoaded) {
                if (state.favModel.entities.isEmpty) {
                  return Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            // child: Lottie.asset(
                            //   'assets/images/splash1.png',
                            // ),
                          ),
                          Text(
                            'فارغة',
                            style: TextStyle(fontSize: 24, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  );
                } else if (state.favModel.entities.isNotEmpty) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0),
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2.25,
                      ),
                      itemCount: state.favModel.entities.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: Colors.grey

                                ),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            height: SizeConfig.screenHeight! / 6,

                            width: double.infinity,


                            child: Column(
                                children: [
                                  Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(

                                            height: 35,

                                            width: 39,


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
                                            child: state.isFav
                                                ? IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  context.read<FavBloc>().add(
                                                      RemoveItemFromFav(
                                                          state.favModel.entities[index] as Entities,
                                                          false));
                                                  BlocProvider.of<FavBloc>(context).add(
                                                      UpdateItemFavState(
                                                          entities: state
                                                              .favModel.entities[index] as Entities,
                                                          isFav: false));
                                                });
                                              },
                                              icon: Icon(Icons.favorite),
                                              color: Colors.red,
                                            )
                                                : BlocBuilder<FavBloc, FavState>(
                                              builder: (context, state) {
                                                return IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(Icons.favorite_border),
                                                  color: Colors.white,
                                                );
                                              },
                                            ),
// shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(15))
                                          ),



                                        ),
                                      ]),

                                  Row(
                                      children: [

                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: CircleAvatar(
                                            radius: 44,
                                            child: CircleAvatar(

                                              backgroundColor: Colors.white,


                                              radius: 42,

                                              child: CircleAvatar(


                                                radius: 33,


                                                backgroundImage: AssetImage(
                                                    'assets/images/splash2.png'),


                                              ),
                                            ),),
                                        ),

                                        Column(
                                          children: [
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: SizedBox(

                                                    child: Padding(
                                                      padding: EdgeInsets
                                                          .only(
                                                          right: 10),
                                                      child: AutoSizeText(
                                                          'بيبللبgffffgfggfHFGfTRFGTRgلبلب'),
                                                    ))),
                                            SizedBox(
                                                width: 240,

                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10),
                                                  child: AutoSizeText(
                                                    'jhjjfddddddffdfffrrrrrrrrrrrrrrrrrrrrrrrfffffdddddfgffffffffffffghhhffffffdddhhhghg',
                                                    maxLines: 2,),
                                                )),
                                          ],

                                        ),
                                      ]),
                                ])
                        );

                      },
                    ),
                  );
                }
              }
              return Text('Something went wrong!');
            },
          )),
    );
  }
}













