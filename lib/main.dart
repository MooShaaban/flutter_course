import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:remontada2/modules/home/home_screen.dart';
import 'package:remontada2/modules/users/users_screen.dart';
import 'package:remontada2/shared/bloc_observer.dart';
import 'package:remontada2/sws_project/cast/all_bins.dart';
import 'package:remontada2/sws_project/cast/bin_description.dart';
import 'package:remontada2/sws_project/cast/staff_home.dart';
import 'package:remontada2/sws_project/visitor/sws_home.dart';
import 'layout/todo_home.dart';
import 'modules/bmi_result/bmi_result_screen.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/counter/counter_screen.dart';
import 'modules/login/login_design.dart';
import 'modules/messenger/messenger.dart';

void main() {

  BlocOverrides.runZoned(
        () {
          runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );


}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StaffHome(),


    );
  }


}

