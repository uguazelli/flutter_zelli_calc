import 'package:flutter/material.dart';
import 'package:zelli_calc/screen/drawer_menu.dart';

class TempConversion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Conversion'),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Text('Temp Conversion'),
      ),
    );
  }
}
