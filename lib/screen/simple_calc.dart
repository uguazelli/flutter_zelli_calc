import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zelli_calc/controller/app_styles.dart';
import 'package:zelli_calc/controller/calc_controller.dart';
import 'package:zelli_calc/screen/drawer_menu.dart';
import 'package:zelli_calc/screen/single_key.dart';

class SimpleCalc extends StatelessWidget {
  CalcController calcCtrl = Get.put(CalcController());
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    AppStyle styles = new AppStyle(screenWidth, darkModeOn);
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calc'),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Container(
            constraints: BoxConstraints(
              maxHeight: styles.maxHeight,
              maxWidth: styles.maxWidth,
            ),
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment(0.85, 0.5),
                      child: Obx(() => Text(
                            calcCtrl.display,
                            style: TextStyle(fontSize: 40),
                          )),
                    )),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(child: SingleKey('C', calcCtrl)),
                      Expanded(child: SingleKey('±', calcCtrl)),
                      Expanded(child: SingleKey('%', calcCtrl)),
                      Expanded(child: SingleKey('÷', calcCtrl)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(child: SingleKey('7', calcCtrl)),
                      Expanded(child: SingleKey('8', calcCtrl)),
                      Expanded(child: SingleKey('9', calcCtrl)),
                      Expanded(child: SingleKey('x', calcCtrl)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(child: SingleKey('4', calcCtrl)),
                      Expanded(child: SingleKey('5', calcCtrl)),
                      Expanded(child: SingleKey('6', calcCtrl)),
                      Expanded(child: SingleKey('-', calcCtrl)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(child: SingleKey('1', calcCtrl)),
                      Expanded(child: SingleKey('2', calcCtrl)),
                      Expanded(child: SingleKey('3', calcCtrl)),
                      Expanded(child: SingleKey('+', calcCtrl)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: SingleKey('0', calcCtrl)),
                      Expanded(flex: 1, child: SingleKey('.', calcCtrl)),
                      Expanded(flex: 2, child: SingleKey('=', calcCtrl)),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
