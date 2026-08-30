import 'package:orth_psalter/models/psalm.dart';
import 'package:orth_psalter/models/common_prayers.dart';

class Kathisma {
  int? num;
  String? title = '';
  int? psalmFrom;
  int? psalmTo;
  List<int>? gloryAfter = [];
  String? troparion;
  String? prayer;
  CommonPrayers commonPrayers;
  List<Psalm> psalms;

  Kathisma({
    this.num,
    this.title,
    this.psalmFrom,
    this.psalmTo,
    this.gloryAfter,
    this.troparion,
    this.prayer,
    required this.commonPrayers,
    required this.psalms,
  });

  getPsalms() {
    return this.psalms;
  }

  getGloryAfter() {
    return this.gloryAfter;
  }

  getTroparion() {
    return this.troparion;
  }

  getPrayer() {
    return this.prayer;
  }

  CommonPrayers getCommonPrayers() => this.commonPrayers;
}
