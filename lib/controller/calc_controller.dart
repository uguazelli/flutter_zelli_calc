import 'package:get/get.dart';

class CalcController extends GetxController {
  CalcController();
  var _memory = '';
  var _operator = ''.obs;
  var _display = '0'.obs;
  set memory(value) => this._memory = value;
  get memory => this._memory;
  set operator(value) => this._operator.value = value;
  get operator => this._operator.value;
  set display(value) => this._display.value = value;
  get display => this._display.value;

  void process(pressedKey) {
    switch (pressedKey) {
      case 'C':
        clean();
        break;

      case '±':
        setSign();
        break;

      case '%':
        //TODO implement
        break;

      case '.':
        setDouble();
        break;

      case '+':
      case '-':
      case 'x':
      case '÷':
        setOperation(pressedKey);
        break;
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        setDigit(pressedKey);
        break;
      default:
        display = 'ERROR';
    }
  }

  void clean() {
    display = '0';
    memory = '';
    operator = '';
  }

  void setDigit(digit) {
    if (operator == '') {
      if (display == '0') {
        display = digit;
      } else {
        display = display + digit;
      }
    } else {
      memory = display;
      display = digit;
    }
  }

  void setDouble() {
    if (!display.contains('.')) {
      if (display == '0') {
        display = '0.';
      } else {
        display = display + '.';
      }
    }
  }

  void setOperation(digit) {
    if (operator == '') {
      operator = digit;
    } else {
      switch (operator) {
        case '+':
          break;
        case '-':
          break;
        case 'x':
          break;
        case '÷':
          break;
        default:
          display = 'ERROR';
      }
      display = calculate(memory, display, operator);
      operator = digit;
      memory = '';
    }

    //String operator = display.substring(display.length - 1);
    //bool hasOperator = ['+', '-', 'x', '÷'].contains(digit);
    ////var hasOperator = RegExp(r"[\+\-x\÷]").hasMatch(display);
    //if (hasOperator) {
    //  operator = digit;
    //  print(operator);
    //  //display = display.substring(0, display.length - 2) + ' ' + digit;
    //} else {
    //  //display = display + ' ' + digit;
    //  operator = digit;
    //}
  }

  void setSign() {
    if (display.substring(0, 1) == '-') {
      display = display.substring(1, display.length);
    } else {
      display = '-' + display;
    }
  }

  String calculate(String num1, String num2, String operatorion) {
    double a = double.parse(num1);
    double b = double.parse(num2);
    String result = 'ERROR';
    if (operatorion == '+') result = (a + b).toString();
    if (operatorion == '-') result = (a - b).toString();
    if (operatorion == 'x') result = (a * b).toString();
    if (operatorion == '÷') result = (a / b).toString();
    return result;
  }
}