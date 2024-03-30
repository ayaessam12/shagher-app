import 'package:equatable/equatable.dart';

import '../models/Entities.dart';

abstract class FavEvent extends Equatable {
  const FavEvent();
}

class StartFav extends FavEvent {


  @override
  List<Object> get props => [];
}

class AddItemToFav extends FavEvent {
  final Entities entities;
  final bool isFav;

  const AddItemToFav(this.entities, this.isFav);

  @override
  List<Object> get props => [entities];
}

class RemoveItemFromFav extends FavEvent {
  final Entities entities;
  final bool isFav;

  const RemoveItemFromFav(this.entities, this.isFav);

  @override
  List<Object> get props => [entities];
}

class UpdateItemFavState extends FavEvent {
  final Entities entities;
  final bool isFav;
  UpdateItemFavState({required this.entities, required this.isFav});

  @override
  List<Object> get props => [entities, isFav];
}
