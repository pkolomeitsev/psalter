class RouterExtraParameters {
  bool resetScrollPosition = false;
  bool enableScrollStorage = false;

  bool isResetScrollPosition() => this.resetScrollPosition;

  bool isEnableScrollStorage() => this.enableScrollStorage;

  void setResetScrollPosition(bool value) {
    this.resetScrollPosition = value;
  }

  void setEnableScrollStorage(bool value) {
    this.enableScrollStorage = value;
  }
}
