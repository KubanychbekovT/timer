import 'package:flutter/material.dart';
import 'package:trainfortimer/bloc_widget/timer/timer_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
class TimerPage extends StatelessWidget {
  TimerPage({Key? key,required this.workingSeconds,required this.restingSeconds}) : super(key: key);
  int workingSeconds;
  int restingSeconds;
  bool isFirst=true;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onLongPress: () {Navigator.pop(context);},
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(alignment:Alignment.center,child: Text('Удерживайте чтобы выйти')),
            SizedBox(height: 20,),
            BlocBuilder<TimerBloc, TimerState>(
  builder: (context, state) {

    int seconds=10;
    Stream.periodic(Duration(seconds: 1), (timer) {
      seconds-=1;
      if(isFirst){
        BlocProvider.of<TimerBloc>(context).add(TimerStarted(seconds));
        isFirst=false;
      }
      print("seconds");

      if(seconds==0){

        // timer.cancel();
      }
    });
    if(state is TimerTickingState){
      return Text(state.seconds.toString(),style:TextStyle(fontSize: 24,color: Colors.yellow));
    }
    return const SizedBox();
  },
)
 
          ],
        ),
      ),
    );
  }
}