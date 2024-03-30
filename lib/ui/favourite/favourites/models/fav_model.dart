import 'package:equatable/equatable.dart';

import 'Entities.dart';

class FavModel extends Equatable {
  final List<Entities> entities;

  const FavModel({this.entities = const <Entities>[]});

  @override
  List<Object?> get props => [entities];
}