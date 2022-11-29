part of 'timer_bloc.dart';

abstract class TimerState {

}

class TimerInitial extends TimerState {
}

class TimerRunState extends TimerState {
}

class TimerPauseState extends TimerState {
}

class TimerTickingState extends TimerState{
  int seconds;
  TimerTickingState(this.seconds);
}