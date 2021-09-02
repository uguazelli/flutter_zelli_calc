import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zelli_calc/controller/app_styles.dart';

import 'package:zelli_calc/controller/temp_conversion.dart';
import 'package:zelli_calc/screen/drawer_menu.dart';
import 'package:zelli_calc/screen/single_key.dart';

class TempConversion extends StatelessWidget {
  TempConversionController tempCtrl = Get.put(TempConversionController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    AppStyle styles = new AppStyle(screenWidth, darkModeOn);
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Conversion'),
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
                flex: 2,
                child: Container(
                  alignment: Alignment(0.85, 0.5),
                  child: Text(
                    "DISPLAY1",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment(0.85, 0.5),
                  child: Text(
                    "DISPLAY2",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(child: SingleKey('', tempCtrl)),
                    Expanded(child: SingleKey('', tempCtrl)),
                    Expanded(child: SingleKey('C', tempCtrl)),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(child: SingleKey('7', tempCtrl)),
                    Expanded(child: SingleKey('8', tempCtrl)),
                    Expanded(child: SingleKey('9', tempCtrl)),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(child: SingleKey('4', tempCtrl)),
                    Expanded(child: SingleKey('5', tempCtrl)),
                    Expanded(child: SingleKey('6', tempCtrl)),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(child: SingleKey('1', tempCtrl)),
                    Expanded(child: SingleKey('2', tempCtrl)),
                    Expanded(child: SingleKey('3', tempCtrl)),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(child: SingleKey('±', tempCtrl)),
                    Expanded(child: SingleKey('0', tempCtrl)),
                    Expanded(child: SingleKey('.', tempCtrl)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
