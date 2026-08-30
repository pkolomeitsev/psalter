class CommonPrayers {
  late String _hallelujah3T;
  late String _lordHaveMercy3T;
  late String _lordHaveMercy40T;
  late String _gloryForeverShort;
  late String _gloryForever;
  late String _trisagion2OurFatherLabel;
  late String _trisagion;
  late String _mostHolyTrinity;
  late String _ourFather;
  late String _tropariaLabel;
  late String _prayerLabel;
  late String _psalmLabel;
  late String _oHeavenlyKing;
  late String _comeLetUsWorship;
  late String _easterSuggestion;
  late String _hymnToTheTheotokos;
  late String _hymnToTheTheotokosShort;
  late String _stEphremPrayer;
  late String _hymnToTheTheotokosSuggestion;

  CommonPrayers(Map<String, dynamic> data) {
    this._hallelujah3T = data['hallelujah3T'] ?? '';
    this._lordHaveMercy3T = data['lordHaveMercy3T'] ?? '';
    this._lordHaveMercy40T = data['lordHaveMercy40T'] ?? '';
    this._gloryForeverShort = data['gloryForeverShort'] ?? '';
    this._gloryForever = data['gloryForever'] ?? '';
    this._trisagion2OurFatherLabel = data['trisagion2OurFather'] ?? '';
    this._trisagion = data['trisagion'] ?? '';
    this._mostHolyTrinity = data['mostHolyTrinity'] ?? '';
    this._ourFather = data['ourFather'] ?? '';
    this._tropariaLabel = data['troparia'] ?? '';
    this._prayerLabel = data['prayer'] ?? '';
    this._psalmLabel = data['psalmLabel'] ?? '';
    this._oHeavenlyKing = data['oHeavenlyKing'] ?? '';
    this._comeLetUsWorship = data['comeLetUsWorship'] ?? '';
    this._easterSuggestion = data['easterSuggestion'] ?? '';
    this._hymnToTheTheotokos = data['hymnToTheTheotokos'] ?? '';
    this._hymnToTheTheotokosShort = data['hymnToTheTheotokosShort'] ?? '';
    this._stEphremPrayer = data['stEphremPrayer'] ?? '';
    this._hymnToTheTheotokosSuggestion = data['hymnToTheTheotokosSuggestion'] ?? '';
  }

  String getPsalmLabel() => _psalmLabel;
  void setPsalmLabel(String value) {
    _psalmLabel = value;
  }

  String getPrayerLabel() => _prayerLabel;
  void setPrayerLabel(String value) {
    _prayerLabel = value;
  }

  String getTropariaLabel() => _tropariaLabel;
  void setTropariaLabel(String value) {
    _tropariaLabel = value;
  }

  String getOurFather() => _ourFather;
  void setOurFather(String value) {
    _ourFather = value;
  }

  String getMostHolyTrinity() => _mostHolyTrinity;
  void setMostHolyTrinity(String value) {
    _mostHolyTrinity = value;
  }

  String getTrisagion() => _trisagion;
  void setTrisagion(String value) {
    _trisagion = value;
  }

  String getTrisagion2OurFatherLabel() => _trisagion2OurFatherLabel;
  void setTrisagion2OurFather(String value) {
    _trisagion2OurFatherLabel = value;
  }

  String getGloryForever() => _gloryForever;
  void setGloryForever(String value) {
    _gloryForever = value;
  }

  String getGloryForeverShort() => _gloryForeverShort;
  void setGloryForeverShort(String value) {
    _gloryForeverShort = value;
  }

  String getLordHaveMercy40T() => _lordHaveMercy40T;
  void setLordHaveMercy40T(String value) {
    _lordHaveMercy40T = value;
  }

  String getLordHaveMercy3T() => _lordHaveMercy3T;
  void setLordHaveMercy3T(String value) {
    _lordHaveMercy3T = value;
  }

  String getHallelujah3T() => _hallelujah3T;
  void setHallelujah3T(String value) {
    _hallelujah3T = value;
  }

  String getOHeavenlyKing() => _oHeavenlyKing;
  void setOHeavenlyKing(String value) {
    _oHeavenlyKing = value;
  }

  String getComeLetUsWorship() => _comeLetUsWorship;
  void setComeLetUsWorship(String value) {
    _comeLetUsWorship = value;
  }

  String getEasterSuggestion() => _easterSuggestion;
  void setEasterSuggestion(String value) {
    _easterSuggestion = value;
  }

  String getHymnToTheTheotokos() => _hymnToTheTheotokos;
  void setHymnToTheTheotokos(String value) {
    _hymnToTheTheotokos = value;
  }

  String getHymnToTheTheotokosShort() => _hymnToTheTheotokosShort;
  void setHymnToTheTheotokosShort(String value) {
    _hymnToTheTheotokosShort = value;
  }

  String getStEphremPrayer() => _stEphremPrayer;
  void setStEphremPrayer(String value) {
    _stEphremPrayer = value;
  }

  String getHymnToTheTheotokosSuggestion() => _hymnToTheTheotokosSuggestion;
  void setHymnToTheTheotokosSuggestion(String value) {
    _hymnToTheTheotokosSuggestion = value;
  }
}
