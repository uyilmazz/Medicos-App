import 'package:flutter/material.dart';
import 'package:medicos_app/core/constants/color_constants.dart';
import 'package:medicos_app/view/home/view/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ColorConstants.backgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Montserrat',
            displayColor: Colors.black,
            bodyColor: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}
