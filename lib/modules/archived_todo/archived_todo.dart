import 'package:flutter/cupertino.dart';

class ArchivedTasks extends StatelessWidget {
  const ArchivedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          'Archived Tasks',
        style: TextStyle(
          fontSize: 50.0,
        ),
      ),
    );
  }
}
