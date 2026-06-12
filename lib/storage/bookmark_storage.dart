import 'package:orth_psalter/helpers/utils_helper.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkStorage {
  static getName(String name) {
    return 'bookmarks_$name';
  }

  static getBookmarks(EntityType type) async {
    final asyncPrefs = SharedPreferencesAsync();
    return UtilsHelper.stringListToInt(
      await asyncPrefs.getStringList(BookmarkStorage.getName(type.name)) ?? []
    );
  }

  static addBookmark(EntityType type, int value) async {
    final asyncPrefs = SharedPreferencesAsync();
    List<int> bookmarks = UtilsHelper.stringListToInt(await BookmarkStorage.getBookmarks(type) ?? []);
    if (!bookmarks.contains(value)) {
      bookmarks.add(value);
      await asyncPrefs.setStringList(
        BookmarkStorage.getName(type.name),
        UtilsHelper.intListToString(bookmarks),
      );
    }
  }

  static deleteBookmark(EntityType type, int value) async {
    final asyncPrefs = SharedPreferencesAsync();
    List<int> bookmarks = await BookmarkStorage.getBookmarks(type);
    bookmarks.remove(value);
    await asyncPrefs.setStringList(
      BookmarkStorage.getName(type.name),
      UtilsHelper.intListToString(bookmarks),
    );
  }

  static deleteBookmarks(EntityType type, List<int> values) {
    for (var value in values) {
      BookmarkStorage.deleteBookmark(type, value);
    }
  }
}
