import 'package:flutter/material.dart';
import 'package:zelli_calc/screen/simple_calc.dart';
import 'package:zelli_calc/screen/temp_conversion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(accentColor: Colors.blue),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      initialRoute: '/simplecalc',
      routes: {
        '/simplecalc': (context) => SimpleCalc(),
        '/tempconversion': (context) => TempConversion(),
      },
      //home: SimpleCalc(),
    );
  }
}
