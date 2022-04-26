import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remontada2/modules/archived_todo/archived_todo.dart';
import 'package:remontada2/modules/done_todo/done_todo.dart';
import 'package:remontada2/modules/tasks_todo/new_tasks.dart';
import 'package:remontada2/shared/components/constants.dart';
import 'package:remontada2/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';



class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitState());

  int currentIndex = 0;
  Database? database;
  List<Map> newTasks = [];
  List<Map> archivedTasks = [];
  List<Map> doneTasks = [];
  bool isBottomSheetShown = false;
  Icon fab = Icon(Icons.add);


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

  void createDatabase()  {
     openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database, version)  {
          print('Database Created');
          database.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT ,date TEXT,time TEXT,status TEXT )',

          ).then((value) {
            print('Table created');
          }).catchError((error){
            print('Error is $error');
          });
        },
        onOpen: (database){
          print('Database opened');
          getDataFromDatabase(database);

        }
    ).then((value) {
      database = value;
      emit(AppCreateDatabase());
    });
  }



  Future insertToDatabase ({
    required String title,
    required String date,
    required String time,
  }) async{
    return await database!.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO tasks (title, date, time, status) VALUES ("$title","$date","$time","new")')
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDataToDatabase());

        getDataFromDatabase(database);

      })
          .catchError((error) {
        print('error while inserting new record is ${error.toString()}');
      }
      );

    });

  }



  void getDataFromDatabase(database)  {

    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

     database.rawQuery('SELECT * FROM tasks').then((List<Map> value) {
       value.forEach((element) {
         if(element['status'] == 'new') newTasks.add(element);
         else if (element['status'] == 'done') doneTasks.add(element);
         else archivedTasks.add(element);
       });

       emit(AppGetDataFromDatabase());
     });
  }


  void updateDatabase ({
    required String status,
    required int id
})
  {
    database?.rawUpdate('UPDATE tasks SET status =? WHERE id = ?',[status.toString(), id])
        .then((value)
    {
      getDataFromDatabase(database);
          emit(AppUpdateDatabase());
    });
  }


  void deleteDatabase (int id){
    database?.rawDelete('DELETE FROM tasks WHERE id = ? ', [id])
    .then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabase());
    });
  }



  void changeBottomSheetState ({
    required bool isShow,
    required Icon fabs
})
  {
    isBottomSheetShown = isShow;
    fab = fabs;
    emit(AppChangeBottomSheetState());
  }


}




// {
// return await database!.transaction((txn) async{
// try{
// int id = await  txn.rawInsert('INSERT INTO tasks (title, date, time, status) VALUES ("$title","$date","$time","new")');
// print('$id inserted successfully');
// }catch(error){
// print('error while inserting new record is ${error.toString()}');
// }
// });
// }