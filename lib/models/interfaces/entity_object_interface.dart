import 'package:orth_psalter/models/enums/entity_type.dart';

abstract class EntityObjectInterface {
  int getId();
  String getTitle();
  EntityType getType();
}