

















import 'package:auto_size_text/auto_size_text.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shagher/ui/favourite/favourites/models/Entities.dart';
import '../EntitiesResponse.dart';
import '../api_manager/api_manager.dart';

import '../size_confing.dart';
import 'favourite/favourites/bloc/fav_bloc.dart';
import 'favourite/favourites/bloc/fav_event.dart';
import 'favourite/favourites/bloc/fav_states.dart';
class ImportantChoiceWidget extends StatefulWidget {
   ImportantChoiceWidget({Key? key}) : super(key: key);

  @override
  State<ImportantChoiceWidget> createState() => _ImportantChoiceWidgetState();
}

class _ImportantChoiceWidgetState extends State<ImportantChoiceWidget> {
  final words = nouns.take(50).toList();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return
      BlocBuilder<FavBloc, FavState>(
        builder: (context, states) {
          if (states is FavLoaded) {
            return

              FutureBuilder<EntitiesResponse>(
                  future: ApiManager.getEntities(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator(),);
                    }
                    if (snapshot.hasError) {
                      return new Text("${snapshot.error.toString()}");
                    }
                    if (snapshot.data?.success == 'error') {
                      return Text('${snapshot.data?.message}');
                    }
                    return ListView.builder(
                        itemCount: snapshot.data?.data?.entities?.length ?? 0,
                        itemBuilder: (context, i) {
                          bool isFav = states.isFav;

                          return
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.grey

                                  ),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              height: SizeConfig.screenHeight! /5,

                              width: double.infinity,


                              child: Padding(
                                padding:  EdgeInsets.only(top: 3),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(

                                            height:35,

                                            width: 39,


                                            // margin: EdgeInsets.all(3),

                                            decoration: BoxDecoration(

                                                color: Colors.white,

                                                shape: BoxShape.circle,

                                                boxShadow: [

                                                  BoxShadow(

                                                      blurRadius: 3,

                                                      color: Colors.grey


                                                  ),

                                                ]),

                                            child: isFav? Align(
                                              alignment: AlignmentDirectional.centerStart,
                                              child: IconButton(
                                                onPressed: () {
                                    // setState(() {
                                    context.read<FavBloc>().add(
                                    RemoveItemFromFav(
                                    snapshot
                                        .data!.data!.entities![i]   ,
                                    false));
                                    // });
                                    },
                                      icon: Icon(Icons.favorite),
                                      color: Colors.red,
                                    ),
                                            )

                                            : BlocBuilder<FavBloc, FavState>(
                                              builder: (context, state) {
                                          return IconButton(
                                          onPressed: () {

                          context.read<FavBloc>().add(AddItemToFav(
                                          snapshot.data!.data!.entities![i]  ,
                                          true));


                                          },
                                          icon: const Icon(Icons.favorite_border),
                                          color: Colors.grey,
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
                                 ]),
                              )
                            );

                              });
                  });
          }
          return SizedBox();
          }

        );
}
}












//       SizedBox(height: SizeConfig.screenHeight!/60,),
//       Padding(
//       padding: EdgeInsets.only(left: 10),
//       child: Align(
//       alignment: AlignmentDirectional.bottomEnd,
//       child: Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//
//       Icon(Icons.timer_sharp,color: Colors.grey,size: 12,),
//       AutoSizeText(' منذ 5 دقائق',style: TextStyle(color: Colors.grey),),
//       ],
//       ),
//       ),
//       )
//
//       ],
//
//       ),
//     ),
//
//
//    ]) ),
//     )
//     );
//
//         }
//
//
// }
