import 'package:flutter/material.dart';
import 'package:remontada2/home_screen.dart';
import 'package:remontada2/users_screen.dart';
import 'bmi_result_screen.dart';
import 'bmi_screen.dart';
import 'counter_screen.dart';
import 'login_design.dart';
import 'messenger.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiScreen(),
      //this is my first update

    );
  }


}

