import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    on<TimerStarted>((event, emit) async {

      int seconds=event.seconds;
      emit(TimerTickingState(seconds));
      Stream.periodic(Duration(seconds: 1), (timer) async{
          seconds-=1;
          print("seconds");

          if(seconds==0){

            // timer.cancel();
          }
        });
      //emit(TimerRunState());

     // event.seconds
    });
  }
}
