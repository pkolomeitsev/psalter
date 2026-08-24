import 'package:flutter/material.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/storage/system/last_viewed_storage.dart';

class LastViewedNotifier with ChangeNotifier {
  int _id = 0;

  int getId() => _id;
  void notify(int id, EntityType type) {
    this._id = id;
    LastViewedStorage().set(type, id);
    notifyListeners();
  }
}