import 'package:jungers_psalter/models/psalm.dart';

class Kathisma {
  int? num;
  String? title = '';
  int? psalmFrom;
  int? psalmTo;
  List<dynamic>? gloryAfter = [];
  String? troparion;
  String? prayer;
  List<Psalm> psalms;

  Kathisma({
    this.num,
    this.title,
    this.psalmFrom,
    this.psalmTo,
    this.gloryAfter,
    this.troparion,
    this.prayer,
    required this.psalms,
  });

  getPsalms() {
    return this.psalms;
  }
}
