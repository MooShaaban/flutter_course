import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remontada2/shared/components/components.dart';
import 'package:remontada2/shared/cubit/cubit.dart';
import 'package:remontada2/shared/cubit/states.dart';

class ArchivedTasks extends StatelessWidget {
  const ArchivedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <AppCubit, AppStates>(
      listener:(context, state){} ,
      builder: (context, state) {
        return Container(
          padding: EdgeInsetsDirectional.all(15.0),
          child: ListView.separated(
            itemBuilder: (context, index) => buildTaskItem(model: AppCubit.get(context).archivedTasks[index],context: context),
            separatorBuilder:(context, index) =>Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey,
            ) ,
            itemCount: AppCubit.get(context).archivedTasks.length,
          ),
        );
      },
    );
  }
}
