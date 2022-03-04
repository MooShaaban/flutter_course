import 'package:flutter/material.dart';
import 'package:remontada2/modules/archived_todo/archived_todo.dart';
import 'package:remontada2/modules/done_todo/done_todo.dart';
import 'package:remontada2/modules/tasks_todo/new_tasks.dart';
import 'package:sqflite/sqflite.dart';


class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {

  int current = 0;
  Database? database;

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

  @override
  void initState() {
    super.initState();

    createDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title[current]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          insertToDatabase();
        }

      //       try{
      //   print(await getName());
      //   print('Ahmed Ali');
      //   throw('Error!!!!!!');
      //   }catch(error){
      // print('Error is ${error.toString()}');
      // };


        //The .then method below
      //     (){
      // getName().then((value) {
      // print(value);
      // print('Ahmed Ali');
      // throw('Error!!!!!!');
      // }).catchError((error){
      // print('error is ${error.toString()}');
      // });
      // },
        ,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            current = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: current,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Tasks',

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline),
            label: 'Done',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined),
            label: 'Archived',
          ),
          
        ],
      ),
      body: screen[current],
      
    );
  }


  Future<String> getName() async  {
    return 'Mohamed Shaaban';
  }

  void createDatabase() async {
     database = await openDatabase(
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
      }
    );
  }
  void insertToDatabase(){
    database!.transaction((txn) async{
      try{
        int id = await  txn.rawInsert('INSERT INTO tasks (title, date, time, status) VALUES ("first task","14 May","midnight","done")');
        print('$id inserted successfully');
      }catch(error){
        print('error while inserting new record is ${error.toString()}');
      }



    });
  }


}


