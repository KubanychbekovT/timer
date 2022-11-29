part of 'timer_bloc.dart';

abstract class TimerEvent  {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class TimerStarted extends TimerEvent {
  int seconds;
  TimerStarted(this.seconds);
}

class TimerPaused extends TimerEvent {
  const TimerPaused();
}

class TimerReset extends TimerEvent {
  const TimerReset();
}

class TimerStop extends TimerEvent {
  const TimerStop();
}

class TimerTicked extends TimerEvent {
  const TimerTicked({required this.timeStr, required this.percent});
  final String timeStr;
  final double percent;

  @override
  List<Object> get pops => [timeStr];
}