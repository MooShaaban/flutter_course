import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remontada2/modules/archived_todo/archived_todo.dart';
import 'package:remontada2/modules/done_todo/done_todo.dart';
import 'package:remontada2/modules/tasks_todo/new_tasks.dart';
import 'package:remontada2/shared/components/components.dart';
import 'package:remontada2/shared/components/constants.dart';
import 'package:remontada2/shared/cubit/cubit.dart';
import 'package:remontada2/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';


class TodoHome extends StatelessWidget  {



  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener:(context, state){},
          builder: (context, state)=> Scaffold(

            key: scaffoldKey,
            appBar: AppBar(
              title: Text(AppCubit.get(context).title[AppCubit.get(context).currentIndex]),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: ()  {

                if(AppCubit.get(context).isBottomSheetShown){
                  if(formKey.currentState!.validate()){
                    AppCubit.get(context).insertToDatabase(
                      title: nameController.text,
                      date: dateController.text,
                      time: timeController.text,
                    ).then((value) {
                      Navigator.pop(context);
                      AppCubit.get(context).isBottomSheetShown = false;
                      AppCubit.get(context).fab = Icon(Icons.add);
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
                    AppCubit.get(context).changeBottomSheetState(isShow: false, fabs: Icon(Icons.add));
                  });
                  AppCubit.get(context).changeBottomSheetState(isShow: true, fabs: Icon(Icons.check));
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
              child: AppCubit.get(context).fab,
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                AppCubit.get(context).changeIndex(index);
              },
              type: BottomNavigationBarType.fixed,
              currentIndex: AppCubit.get(context).currentIndex,
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
            body:  AppCubit.get(context).screen[AppCubit.get(context).currentIndex],

          ),

      )
    );
  }


  // Future<String> getName() async  {
  //   return 'Mohamed Shaaban';
  // }



}




