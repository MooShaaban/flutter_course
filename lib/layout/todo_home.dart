import 'package:flutter/material.dart';
import 'package:remontada2/modules/archived_todo/archived_todo.dart';
import 'package:remontada2/modules/done_todo/done_todo.dart';
import 'package:remontada2/modules/tasks_todo/new_tasks.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {

  int current = 0;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title[current]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print(await getName());
        },
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
}


