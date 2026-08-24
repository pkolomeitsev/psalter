import 'package:orth_psalter/models/enums/appearance_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppearanceConfigStorage {
  final String name = 'appearance_config';

  getName(AppearanceConfig configuration) {
    return '${this.name}_${configuration.name}';
  }

  Future<int> get(AppearanceConfig configuration, {int defaultValue = 0}) async {
    final asyncPrefs = SharedPreferencesAsync();
    return await asyncPrefs.getInt(this.getName(configuration)) ?? defaultValue;
  }

  void set(AppearanceConfig configuration, int value) async {
    final asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.setInt(this.getName(configuration), value);
  }
}