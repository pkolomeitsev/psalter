import 'package:orth_psalter/models/interfaces/entity_object_interface.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';

class Bookmark implements EntityObjectInterface{
  int id;
  String title;
  String description;
  EntityType type;

  Bookmark({required this.id, required this.title, this.description = '', this.type = EntityType.none});

  getId() {
    return this.id;
  }

  getTitle() {
    return this.title;
  }

  getDescription() {
    return this.description;
  }

  getType() {
    return this.type;
  }
}