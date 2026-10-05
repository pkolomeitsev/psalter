class VerseDto {
  String _num;
  String _value;

  VerseDto(this._num, this._value);

  String getNum() => _num;
  void setNum(String value) {
    _num = value;
  }

  String getValue() => _value;
  void setValue(String value) {
    _value = value;
  }
}