import 'package:flutter/material.dart';
import 'package:remontada2/modules/home/home_screen.dart';
import 'package:remontada2/modules/users/users_screen.dart';
import 'package:remontada2/modules/sws_home.dart';
import 'layout/todo_home.dart';
import 'modules/bmi_result/bmi_result_screen.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/counter/counter_screen.dart';
import 'modules/login/login_design.dart';
import 'modules/messenger/messenger.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SWSHome(),


    );
  }


}

