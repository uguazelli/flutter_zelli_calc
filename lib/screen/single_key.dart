import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zelli_calc/controller/app_styles.dart';
import 'package:zelli_calc/controller/calc_controller.dart';

class SingleKey extends StatelessWidget {
  String stringValue = '';
  CalcController processor;
  SingleKey(this.stringValue, this.processor);

  final List<String> specialKeys = ['+', '-', 'x', '÷', 'C', '±', '%'];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    AppStyle styles = new AppStyle(screenWidth, darkModeOn);

    if (stringValue == '=') {
      return InkWell(
        onTap: () {
          processor.process(stringValue);
        },
        child: Container(
          margin: EdgeInsets.all(3),
          alignment: Alignment(0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: styles.accentKey,
          ),
          child: Text(
            stringValue,
            style: TextStyle(
              fontSize: styles.fontSize,
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          processor.process(stringValue);
        },
        borderRadius: BorderRadius.circular(40),
        child: Obx(() => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (stringValue == processor.operator)
                    ? Colors.yellow
                    : styles.normalKey,
              ),
              margin: EdgeInsets.all(3),
              alignment: Alignment(0.0, 0.0),
              child: Text(
                stringValue,
                style: TextStyle(
                  fontSize: styles.fontSize,
                  color: specialKeys.contains(stringValue)
                      ? styles.accentKeyText
                      : styles.normalKeyText,
                ),
              ),
            )),
      );
    }
  }
}
