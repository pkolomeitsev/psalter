class VerseDto {
  int _num;
  String _value;

  VerseDto(this._num, this._value);

  int getNum() => _num;
  void setNum(int value) {
    _num = value;
  }

  String getValue() => _value;
  void setValue(String value) {
    _value = value;
  }
}