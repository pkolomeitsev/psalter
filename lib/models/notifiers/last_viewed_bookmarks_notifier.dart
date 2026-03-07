import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/models/notifiers/last_viewed_notifier.dart';
import 'package:orth_psalter/storage/last_viewed_bookmarks_storage.dart';

class LastViewedBookmarksNotifier extends LastViewedNotifier {
  Map<EntityType, int> ids = {
    EntityType.psalm: 0,
    EntityType.kathisma: 0,
    EntityType.asNeeded: 0
  };

  Map<EntityType, int> getIds() => ids;
  int getIdByType(EntityType type) => ids[type] ?? 0;

  @override
  void notify(int id, EntityType type) {
    this.ids[type] = id;
    LastViewedBookmarksStorage().set(type, id);
    notifyListeners();
  }
}
