import 'package:flutter/material.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/storage/last_viewed_storage.dart';

class LastViewedNotifier with ChangeNotifier {
  int id = 0;

  int getId() => id;
  void notify(int id, EntityType type) {
    this.id = id;
    LastViewedStorage().set(type, id);
    notifyListeners();
  }
}