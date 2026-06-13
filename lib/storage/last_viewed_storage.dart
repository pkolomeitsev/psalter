import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LastViewedStorage {
  final String name = 'lastviewed';

  getName(EntityType type) {
    return '${this.name}_${type.name}';
  }

  Future<int> get(EntityType type) async {
    final asyncPrefs = SharedPreferencesAsync();
    return await asyncPrefs.getInt(this.getName(type)) ?? 0;
  }

  void set(EntityType type, int value) async {
    final asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.setInt(this.getName(type), value);
  }
}