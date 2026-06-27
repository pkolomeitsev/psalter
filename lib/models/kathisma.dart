import 'package:orth_psalter/models/psalm.dart';
import 'package:orth_psalter/models/trisagion_2_our_father.dart';

class Kathisma {
  int? num;
  String? title = '';
  int? psalmFrom;
  int? psalmTo;
  List<int>? gloryAfter = [];
  String? troparion;
  String? prayer;
  Trisagion2OurFather trisagion2OurFather;
  List<Psalm> psalms;

  Kathisma({
    this.num,
    this.title,
    this.psalmFrom,
    this.psalmTo,
    this.gloryAfter,
    this.troparion,
    this.prayer,
    required this.trisagion2OurFather,
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

  Trisagion2OurFather getTrisagion2OurFather() => this.trisagion2OurFather;
}
