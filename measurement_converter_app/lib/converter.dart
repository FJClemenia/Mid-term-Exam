class Converter {
  String? _inputValue;
  String? _box1Value;
  String? _box2Value;

  void setInputValue(String value) {
    _inputValue = value;
  }

  void setBox1Value(String value) {
    _box1Value = value;
  }

  void setBox2Value(String value) {
    _box2Value = value;
  }

  String convert() {
    if (_box1Value == 'Meter' && _box2Value == 'Milimeter') {
      return '${double.parse(_inputValue!) * 1000} mm';
    } else if (_box1Value == 'Meter' && _box2Value == 'Centimeter') {
      return '${double.parse(_inputValue!) * 100} cm';
    } else if (_box1Value == 'Meter' && _box2Value == 'Kilometer') {
      return '${double.parse(_inputValue!) / 1000} km';
    } else if (_box1Value == 'Meter' && _box2Value == 'Feet') {
      return '${double.parse(_inputValue!) / 0.3048} ft';
    } else if (_box1Value == 'Milimeter' && _box2Value == 'Meter') {
      return '${double.parse(_inputValue!) / 1000} m';
    } else if (_box1Value == 'Milimeter' && _box2Value == 'Centimeter') {
      return '${double.parse(_inputValue!) / 10} cm';
    } else if (_box1Value == 'Milimeter' && _box2Value == 'Kilometer') {
      return '${double.parse(_inputValue!) / 1000000} km';
    } else if (_box1Value == 'Milimeter' && _box2Value == 'Feet') {
      return '${double.parse(_inputValue!) / 30.48} ft';
    } else if (_box1Value == 'Centimeter' && _box2Value == 'Meter') {
      return '${double.parse(_inputValue!) / 100} m';
    } else if (_box1Value == 'Centimeter' && _box2Value == 'Milimeter') {
      return '${double.parse(_inputValue!) * 10} mm';
    } else if (_box1Value == 'Centimeter' && _box2Value == 'Kilometer') {
      return '${double.parse(_inputValue!) / 100000} km';
    } else if (_box1Value == 'Centimeter' && _box2Value == 'Feet') {
      return '${double.parse(_inputValue!) / 30.48} ft';
    } else if (_box1Value == 'Kilometer' && _box2Value == 'Meter') {
      return '${double.parse(_inputValue!) * 1000} m';
    } else if (_box1Value == 'Kilometer' && _box2Value == 'Milimeter') {
      return '${double.parse(_inputValue!) * 1000000} mm';
    } else if (_box1Value == 'Kilometer' && _box2Value == 'Centimeter') {
      return '${double.parse(_inputValue!) * 100000} cm';
    } else if (_box1Value == 'Kilometer' && _box2Value == 'Feet') {
      return '${double.parse(_inputValue!) * 3280.84} ft';
    } else if (_box1Value == 'Feet' && _box2Value == 'Meter') {
      return '${double.parse(_inputValue!) * 0.3048} m';
    } else if (_box1Value == 'Feet' && _box2Value == 'Milimeter') {
      return '${double.parse(_inputValue!) * 30.48} mm';
    } else if (_box1Value == 'Feet' && _box2Value == 'Centimeter') {
      return '${double.parse(_inputValue!) * 30.48} cm';
    } else if (_box1Value == 'Feet' && _box2Value == 'Kilometer') {
      return '${double.parse(_inputValue!) / 3280.84} km';
    }

    return '';
  }
}