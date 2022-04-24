import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remontada2/modules/archived_todo/archived_todo.dart';
import 'package:remontada2/modules/done_todo/done_todo.dart';
import 'package:remontada2/modules/tasks_todo/new_tasks.dart';
import 'package:remontada2/shared/cubit/states.dart';



class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitState());

  int currentIndex = 0;
  List<String> title = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks'
  ];

  List <Widget> screen =[
    NewTasks(),
    DoneTasks(),
    ArchivedTasks(),
  ];

  static AppCubit get (context) => BlocProvider.of(context);
  void changeIndex(int index){
    currentIndex= index;
    emit(AppChangeBottomNavBarState());
  }
}