

import 'package:equatable/equatable.dart';

import '../models/fav_model.dart';

abstract class FavState extends Equatable {
  const FavState();
}

class FavLoading extends FavState {
  @override
  List<Object> get props => [];
}

class FavLoaded extends FavState {
  final FavModel favModel;
  final bool isFav;

  const FavLoaded( {required this.favModel, required this.isFav});

  @override
  List<Object> get props => [favModel];
}

class FavError extends FavState {
  @override
  List<Object> get props => [];
}
