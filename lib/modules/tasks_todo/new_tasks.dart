import 'package:flutter/cupertino.dart';

class NewTasks extends StatelessWidget {
  const NewTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'New Tasks',
        style: TextStyle(
          fontSize: 50.0,
        ),
      ),
    );
  }
}
