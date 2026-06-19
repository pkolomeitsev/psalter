import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScrollPositionStorage {
  static getName(EntityType type, {bool listView = false}) {
    return listView
        ? 'scroll_position_listview_${type.name}'
        : 'scroll_position_${type.name}';
  }

  static getOffset(EntityType type, {bool listView = false}) async {
    final asyncPrefs = SharedPreferencesAsync();
    return await asyncPrefs.getDouble(
        ScrollPositionStorage.getName(type, listView: listView)
    ) ?? 0;
  }

  static setOffset(
    EntityType type,
    double value, {
    bool listView = false,
  }) async {
    final asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.setDouble(
      ScrollPositionStorage.getName(type, listView: listView),
      value,
    );
  }

  static deleteOffset(EntityType type, {bool listView = false}) async {
    final asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.remove(
      ScrollPositionStorage.getName(type, listView: listView),
    );
  }
}
