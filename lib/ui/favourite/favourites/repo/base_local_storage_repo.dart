import 'package:hive/hive.dart';

import '../models/Entities.dart';

abstract class BaseLocalStorageRepo {
  Future<Box> openBox();
  List<Entities> getFav(Box box);
  Future<void> addItemToFav(Box box, Entities entities);
  Future<void> removeItemFromFav(Box box, Entities entities);
  Future<void> updateItemFavState(Box box, Entities entities, bool isFav);
  Future<void> clearFav(Box box);
}
