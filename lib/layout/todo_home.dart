import 'package:flutter/material.dart';
import 'package:remontada2/modules/archived_todo/archived_todo.dart';
import 'package:remontada2/modules/done_todo/done_todo.dart';
import 'package:remontada2/modules/tasks_todo/new_tasks.dart';
import 'package:remontada2/shared/components/components.dart';
import 'package:remontada2/shared/components/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';


class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {

  int current = 0;
  Database? database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  Icon fab = Icon(Icons.add);
  var nameController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();


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

      key: scaffoldKey,
      appBar: AppBar(
        title: Text(title[current]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {

            if(isBottomSheetShown){
              if(formKey.currentState!.validate()){
                insertToDatabase(
                  title: nameController.text,
                  date: dateController.text,
                  time: timeController.text,
                ).then((value) {
                  Navigator.pop(context);
                  isBottomSheetShown = false;
                  setState(() {
                    fab = Icon(Icons.add);
                  });
                });


              }





            }
            else{
              scaffoldKey.currentState!.showBottomSheet((context) => Container(
                color: Colors.grey[200],
                padding: EdgeInsetsDirectional.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      defaultFormFeild(
                          controller: nameController,
                          onSubmitted: (value){},
                          validator:(String? value){
                            if(value!.isEmpty){
                              return 'Name must not be empty';
                            }
                          } ,
                          label: 'Task name',
                          prefix:Icon(Icons.text_fields)
                      ),
                      SizedBox(height: 10.0,),
                      defaultFormFeild(
                          controller: timeController,
                          onSubmitted: (value){},
                          validator: (String? value){
                            if(value!.isEmpty){
                              return 'Time must not be empty';
                            }
                          },
                          label: 'Time',
                          prefix: Icon(Icons.watch_later_outlined),
                          keyboard: TextInputType.datetime,
                          ontap: (){
                            showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) => timeController.text= value!.format(context));
                          }
                      ),
                      SizedBox(height: 10.0,),
                      defaultFormFeild(
                          controller: dateController,
                          onSubmitted: (value){},
                          validator: (String? value){
                            if(value!.isEmpty){
                              return 'Date must not be empty';
                            }
                          },
                          label: 'Date',
                          prefix: Icon(Icons.date_range_outlined),
                        keyboard: TextInputType.number,
                        ontap: (){
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate:DateTime.parse("2022-07-27") ,
                            ).then((value) {
                              dateController.text = DateFormat.yMMMd().format(value!);
                            });
                        }
                      ),
                    ],
                  ),
                ),
              )
              ).closed.then((value) {
                // Navigator.pop(context);
                isBottomSheetShown = false;
                setState(() {
                  fab = Icon(Icons.add);
                });
              });
              isBottomSheetShown = true;
              setState(() {
                fab = Icon(Icons.check);
              });

            }



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
        child: fab,
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
      body: tasks.length == 0? Center(child: CircularProgressIndicator()) : screen[current],
      
    );
  }


  // Future<String> getName() async  {
  //   return 'Mohamed Shaaban';
  // }

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
          getDataFromDatabase(database).then((value) {
            tasks = value;
            print(tasks);
          });

      }
    );
  }

  Future insertToDatabase ({
    required String title,
    required String date,
    required String time,
}) async{
    return await database!.transaction((txn) async{
      try{
        int id = await  txn.rawInsert('INSERT INTO tasks (title, date, time, status) VALUES ("$title","$date","$time","new")');
        print('$id inserted successfully');
      }catch(error){
        print('error while inserting new record is ${error.toString()}');
      }



    });
  }


  Future <List<Map>> getDataFromDatabase(database) async {

    return await database.rawQuery('SELECT * FROM tasks');
  }


}


