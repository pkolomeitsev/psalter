import 'package:orth_psalter/models/common_prayers.dart';

class PsalterBeforeAfterPrayers {
  late String _psalmBeforeIfPriestTitle;
  late String _psalmBeforeIfPriest;
  late String _psalmBeforeIfLaymanTitle;
  late String _psalmBeforeIfLayman;
  late String _psalmBeforeGloryThee;
  late String _psalmBeforeTroparion;
  late String _psalmBeforePrayerTitle;
  late String _psalmBeforePrayer;
  late String _psalmBeforeSuggestion;
  late CommonPrayers commonPrayers;

  PsalterBeforeAfterPrayers(Map<String, dynamic> data, this.commonPrayers) {
    this._psalmBeforeIfPriestTitle = data['psalmBeforeIfPriestTitle'] ?? '';
    this._psalmBeforeIfPriest = data['psalmBeforeIfPriest'] ?? '';
    this._psalmBeforeIfLaymanTitle = data['psalmBeforeIfLaymanTitle'] ?? '';
    this._psalmBeforeIfLayman = data['psalmBeforeIfLayman'] ?? '';
    this._psalmBeforeGloryThee = data['psalmBeforeGloryThee'] ?? '';
    this._psalmBeforeTroparion = data['psalmBeforeTroparion'] ?? '';
    this._psalmBeforePrayerTitle = data['psalmBeforePrayerTitle'] ?? '';
    this._psalmBeforePrayer = data['psalmBeforePrayer'] ?? '';
    this._psalmBeforeSuggestion = data['psalmBeforeSuggestion'] ?? '';
  }

  String getPsalmBeforeSuggestion() => _psalmBeforeSuggestion;

  void setPsalmBeforeSuggestion(String value) {
    _psalmBeforeSuggestion = value;
  }

  String getPsalmBeforePrayer() => _psalmBeforePrayer;

  void setPsalmBeforePrayer(String value) {
    _psalmBeforePrayer = value;
  }

  String getPsalmBeforePrayerTitle() => _psalmBeforePrayerTitle;

  void setPsalmBeforePrayerTitle(String value) {
    _psalmBeforePrayerTitle = value;
  }

  String getPsalmBeforeTroparion() => _psalmBeforeTroparion;

  void setPsalmBeforeTroparion(String value) {
    _psalmBeforeTroparion = value;
  }

  String getPsalmBeforeGloryThee() => _psalmBeforeGloryThee;

  void setPsalmBeforeGloryThee(String value) {
    _psalmBeforeGloryThee = value;
  }

  String getPsalmBeforeIfLayman() => _psalmBeforeIfLayman;

  void setPsalmBeforeIfLayman(String value) {
    _psalmBeforeIfLayman = value;
  }

  String getPsalmBeforeIfPriest() => _psalmBeforeIfPriest;

  void setPsalmBeforeIfPriest(String value) {
    _psalmBeforeIfPriest = value;
  }

  String getPsalmBeforeIfLaymanTitle() => _psalmBeforeIfLaymanTitle;

  void setPsalmBeforeIfLaymanTitle(String value) {
    _psalmBeforeIfLaymanTitle = value;
  }

  String getPsalmBeforeIfPriestTitle() => _psalmBeforeIfPriestTitle;

  void setPsalmBeforeIfPriestTitle(String value) {
    _psalmBeforeIfPriestTitle = value;
  }

  CommonPrayers getCommonPrayers() => this.commonPrayers;
}
