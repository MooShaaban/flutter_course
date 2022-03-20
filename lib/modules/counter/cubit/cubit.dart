import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remontada2/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitState());


  int counter = 1;



  static CounterCubit get(context){
    return BlocProvider.of(context);
  }

  void plus (){
    counter++;
    emit(CounterPlusState());
  }

  void minus (){
    counter--;
    emit(CounterMinusState());
  }



}