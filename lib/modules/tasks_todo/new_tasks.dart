import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remontada2/shared/components/components.dart';
import 'package:remontada2/shared/components/constants.dart';

class NewTasks extends StatelessWidget {
  const NewTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(15.0),
      child: ListView.separated(
          itemBuilder: (context, index) => buildTaskItem(model: tasks[index]),
          separatorBuilder:(context, index) =>Container(
            height: 1.0,
            width: double.infinity,
            color: Colors.grey,
          ) ,
          itemCount: tasks.length,
      ),
    );
  }
}
