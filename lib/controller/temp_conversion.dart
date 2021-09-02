import 'package:get/get.dart';

class TempConversionController extends GetxController {
  TempConversionController();

  var _operator = ''.obs;
  get operator => this._operator.value;
  set operator(value) => this._operator.value = value;

  var _display = '0'.obs;

  get display => this._display.value;
  set display(value) => this._display.value = value;

  void process(pressedKey) {}
}
