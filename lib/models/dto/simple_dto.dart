import 'package:flutter/material.dart';

class SimpleDto {
  String _label;
  dynamic _value;
  Icons? _icon;

  SimpleDto(this._label, this._value, this._icon);

  String getLabel() => _label;
  dynamic getValue() => _value;
  Icons? getIcon() => _icon;

  setIcon(Icons value) {
    _icon = value;
  }

  setValue(dynamic value) {
    _value = value;
  }

  setLabel(String value) {
    _label = value;
  }
}
