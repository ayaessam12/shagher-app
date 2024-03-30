import 'package:hive/hive.dart';
import 'package:shagher/ui/favourite/favourites/models/Entities.dart';
import 'package:shagher/ui/favourite/favourites/repo/base_local_storage_repo.dart';

class LocalStorageRepo extends BaseLocalStorageRepo {
  String boxName = 'favourites';

  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<Entities>(boxName);
    return box;
  }

  @override
  List<Entities> getFav(Box box) {
    return box.values.toList() as List<Entities>;
  }

  @override
  Future<void> addItemToFav(Box box, Entities entities) async {
    await box.put(entities.id, entities);
  }

  @override
  Future<void> removeItemFromFav(Box box, Entities entities) async {
    await box.delete(
      entities.id,
    );
  }

  @override
  Future<void> clearFav(Box box) async {
    await box.clear();
  }

  @override
  Future<void> updateItemFavState(
      Box box, Entities entities, bool isFav) async {
    if (isFav) {
      await addItemToFav(box, entities);
    } else {
      await removeItemFromFav(box, entities);
    }
  }
}
