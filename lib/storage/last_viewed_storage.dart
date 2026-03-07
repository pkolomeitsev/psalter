import 'package:hive/hive.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';

class LastViewedStorage {
  final String name = 'lastviewed';

  getName() {
    return name;
  }

  int get(EntityType type) {
    final box = Hive.box(this.getName());
    return box.get(type.name) ?? 0;
  }

  void set(EntityType type, int value) {
    final box = Hive.box(this.getName());
    box.put(type.name, value);
  }
}