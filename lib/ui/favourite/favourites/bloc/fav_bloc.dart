import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shagher/ui/favourite/favourites/models/Entities.dart';

import '../models/fav_model.dart';
import '../repo/local_storage_repo.dart';
import 'fav_event.dart';
import 'fav_states.dart';

class FavBloc extends Bloc<FavEvent, FavState> {
  final LocalStorageRepo _localStorageRepository;

  FavBloc({required LocalStorageRepo localStorageRepository})
      : _localStorageRepository = localStorageRepository,
        super(FavLoading()) {
    on<StartFav>(_onStartFav);
    on<AddItemToFav>(_onAddProductToWishlist);
    on<RemoveItemFromFav>(_onRemoveItemFromFav);
    on<UpdateItemFavState>(_onUpdateItemFavState); // New event and handler
  }

  void _onStartFav(
    StartFav event,
    Emitter<FavState> emit,
  ) async {
    emit(FavLoading());
    try {
      Box box = await _localStorageRepository.openBox();

      List<Entities> entities = _localStorageRepository.getFav(box);
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(
        FavLoaded(
          favModel: FavModel(entities: entities),
          isFav: false,
        ),
      );
    } catch (_) {
      emit(FavError());
    }
  }

  void _onAddProductToWishlist(
    AddItemToFav event,
    Emitter<FavState> emit,
  ) async {
    if (this.state is FavLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        bool isFav = event.isFav;

        _localStorageRepository.addItemToFav(box, event.entities );

        emit(
          FavLoaded(
            favModel: FavModel(
              entities: List.from((this.state as FavLoaded).favModel.entities)
                ..add(event.entities ),
            ),
            isFav: isFav,
          ),
        );
      } on Exception {
        emit(FavError());
      }
    }
  }

  void _onRemoveItemFromFav(
    RemoveItemFromFav event,
    Emitter<FavState> emit,
  ) async {
    if (this.state is FavLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        bool isFav = event.isFav;

        _localStorageRepository.removeItemFromFav(box, event.entities);

        emit(
          FavLoaded(
            favModel: FavModel(
              entities: List.from((this.state as FavLoaded).favModel.entities)
                ..remove(event.entities),
            ),
            isFav: isFav,
          ),
        );
      } on Exception {
        emit(FavError());
      }
    }
  }

  void _onUpdateItemFavState(
    UpdateItemFavState event,
    Emitter<FavState> emit,
  ) async {
    if (this.state is FavLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        bool isFav = event.isFav;
        Entities entities = event.entities ;

        _localStorageRepository.updateItemFavState(box, entities, isFav);

        List<Entities> updatedEntities =
            List.from((this.state as FavLoaded).favModel.entities);
        if (isFav) {
          updatedEntities.add(entities);
        } else {
          updatedEntities.remove(entities);
        }

        emit(
          FavLoaded(
            isFav: isFav,
            favModel: FavModel(entities: updatedEntities),
          ),
        );
      } on Exception {
        emit(FavError());
      }
    }
  }
}
