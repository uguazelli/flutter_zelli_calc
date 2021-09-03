import 'package:get/get.dart';

class TempConversionController extends GetxController {
  TempConversionController();
  var _operator = 'display1'.obs;
  var _display1 = '0'.obs;
  var _display2 = '32'.obs;
  var _reset = false;

  get reset => this._reset;
  set reset(value) => this._reset = value;

  get operator => this._operator.value;
  set operator(value) => this._operator.value = value;

  get display1 => this._display1.value;
  set display1(var value) => this._display1.value = value;

  get display2 => this._display2.value;
  set display2(value) => this._display2.value = value;

  void process(pressedKey) {
    switch (pressedKey) {
      case 'C':
        clean();
        break;
      case '±':
        setSign();
        break;
      case '.':
        setDouble();
        break;
      default:
        setDisplay(pressedKey);
    }
  }

  String toF(c) => (double.parse(c) * 1.8 + 32).toStringAsFixed(2);
  String toC(f) => ((double.parse(f) - 32) * 5 / 9).toStringAsFixed(2);

  void setDisplay1(value) {
    display1 = value;
    display2 = toF(display1);
  }

  void setDisplay2(value) {
    display2 = value;
    display1 = toC(display2);
  }

  void clean() => operator == 'display1' ? setDisplay1('0') : setDisplay2('0');

  void setDisplay(pressedKey) {
    if (operator == 'display1') {
      reset
          ? setDisplay1(pressedKey)
          : setDisplay1(double.parse(display1 + pressedKey).toString());
    } else {
      reset
          ? setDisplay2(pressedKey)
          : setDisplay2(double.parse(display2 + pressedKey).toString());
    }
    reset = false;
  }

  void setActiveDisplay(activeDisplay) {
    operator = activeDisplay;
    reset = true;
  }

  void setSign() {
    if (operator == 'display1') {
      display1.substring(0, 1) == '-'
          ? setDisplay1(display1.substring(1, display1.length))
          : setDisplay1('-' + display1);
    } else {
      display2.substring(0, 1) == '-'
          ? setDisplay2(display2.substring(1, display2.length))
          : setDisplay2('-' + display2);
    }
  }

  void setDouble() {
    if (operator == 'display1') {
      if (!display1.contains('.'))
        display1 == '0' ? setDisplay1('0.') : setDisplay1(display1 + '.');
    } else {
      if (!display2.contains('.'))
        display2 == '0' ? setDisplay2('0.') : setDisplay2(display2 + '.');
    }
  }
}
