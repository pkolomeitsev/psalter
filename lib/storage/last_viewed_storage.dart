import 'package:hive/hive.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';

class LastViewedStorage {
  static getName() {
    return 'lastviewed';
  }

  static int get(EntityType type) {
    final box = Hive.box(LastViewedStorage.getName());
    return box.get(type.name) ?? 0;
  }

  static set(EntityType type, int value) {
    final box = Hive.box(LastViewedStorage.getName());
    box.put(type.name, value);
  }
}