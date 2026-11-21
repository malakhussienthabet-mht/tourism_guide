import 'package:flutter/material.dart';
import '../models/attraction.dart';

class FavProvider extends ChangeNotifier {
  List<Attraction> favouriteItems = [];

  void toggleProvider(Attraction attraction) {
    if (favouriteItems.any((item) => item.id == attraction.id)) {
      favouriteItems.removeWhere(
            (item) => item.id == attraction.id,
      );
    } else {
      favouriteItems.add(attraction);
    }

    notifyListeners();
  }

  bool isFavourite(int id) {
    return favouriteItems.any((item) => item.id == id);
  }
}