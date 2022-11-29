import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainfortimer/bloc_widget/timer/timer_bloc.dart';
import 'package:trainfortimer/timer_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(),
      child: MaterialApp(
        title: 'Boxing Timer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Boxing Timer'),
          ),
          body: Boxing(),
        ),
      ),
    );
  }
}

List <String> listBoxing = [
  'раунды',
  'работа',
  'отдых'
];

class Boxing extends StatefulWidget {
  const Boxing({Key? key}) : super(key: key);

  @override
  State<Boxing> createState() => _BoxingState();
}

class _BoxingState extends State<Boxing> {
  List<int> timerValues = [1, 0, 0];
  List<String> timerTitles = ["Настройки", "Работа", "Отдых"];


  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: listBoxing.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Text(timerTitles[index], style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [IconButton(onPressed: () {
                    setState(() {
                      timerValues[index] -= index == 0 ? 1 : 10;
                    });
                  },
                      icon: Icon(Icons.remove)),
                    Text(
                      index == 0
                          ? timerValues[index].toString()
                          : timeFormatter(index),
                      style: TextStyle(fontSize: 20),
                    ),

                    IconButton(onPressed: () {
                      setState(() {
                        timerValues[index] += index == 0 ? 1 : 10;
                      });
                    },
                        icon: Icon(Icons.add)),
                  ],
                ),

              ],
            );
          },
        ),
        ElevatedButton(
          onPressed: () {

            Route route = MaterialPageRoute(builder: (context) =>
                TimerPage(workingSeconds: timerValues[1],
                  restingSeconds: timerValues[2],));
            Navigator.push(context, route);
          },
          child: Text('Start'),
        ),
      ],
    );
  }


  String timeFormatter(int index) {
    int minutes = 0;
    int seconds = timerValues[index];
    while (true) {
      if ((seconds - 60) >= 0) {
        seconds -= 60;
        minutes++;
      } else {
        break;
      }
    }
    String minuteString = minutes
        .toString()
        .length == 1 ? "0" + minutes.toString() : minutes.toString();
    String secondString = seconds
        .toString()
        .length == 1 ? "0" + seconds.toString() : seconds.toString();
    return minuteString + ":" + secondString;
  }
}



