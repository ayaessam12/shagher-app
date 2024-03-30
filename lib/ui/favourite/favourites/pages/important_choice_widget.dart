import 'package:auto_size_text/auto_size_text.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shagher/ui/favourite/favourites/models/Entities.dart';

import '../../../../EntitiesResponse.dart';
import '../../../../api_manager/api_manager.dart';
import '../../../../size_confing.dart';
import '../bloc/fav_bloc.dart';
import '../bloc/fav_event.dart';
import '../bloc/fav_states.dart';

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

    return BlocBuilder<FavBloc, FavState>(
      builder: (context, states) {
        if (states is FavLoaded) {
          return FutureBuilder<EntitiesResponse>(
              future: ApiManager.getEntities(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return new Text("${snapshot.error.toString()}");
                }
                if (snapshot.data?.success == 'error') {
                  return Text('${snapshot.data?.message}');
                }
                return ListView.builder(
                  itemCount: snapshot.data!.data!.entities!.length,
                  itemBuilder: (context, int index) {
                    bool isFav = states.isFav;
                    return ListTile(
                        onTap: () {},
                        tileColor: Colors.grey,
                        splashColor: Colors.blue,
                        leading: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 35,
                          child: CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  AssetImage('assets/images/splash1.png')),
                        ),
                        title: Row(children: [
                          AutoSizeText(
                            snapshot.data!.data!.entities![0].name ??
                                "سلام يا ولاد العبيطة",
                            style: TextStyle(
                                fontSize: 5, fontWeight: FontWeight.bold),
                            textScaleFactor: 1.5,
                          ),
                          Text(
                            '   انتهي',
                            style: TextStyle(color: Colors.red, fontSize: 9),
                          ),
                        ]),
                        subtitle: const AutoSizeText(
                          'كلية الملك فهد الأمنية تعلن موعد القبول في دورة (الضّباط)',
                          maxLines: 3,
                        ),
                        horizontalTitleGap: 25,
                        trailing: isFav
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    context.read<FavBloc>().add(
                                        RemoveItemFromFav(
                                            snapshot
                                                .data!.data!.entities![index] as Entities,
                                            false));
                                  });
                                },
                                icon: Icon(Icons.favorite),
                                color: Colors.red,
                              )
                            : BlocBuilder<FavBloc, FavState>(
                                builder: (context, state) {
                                  return IconButton(
                                    onPressed: () {
                                      context.read<FavBloc>().add(AddItemToFav(
                                          snapshot.data!.data!.entities![index] as Entities,
                                          true));
                                    },
                                    icon: const Icon(Icons.favorite_border),
                                    color: Colors.white,
                                  );
                                },
                              ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)));
                  },
                );
              });
        }
        return SizedBox();
      },
    );
  }
}
