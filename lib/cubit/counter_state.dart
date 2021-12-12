part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class counterState extends CounterState {
  int counterValue;
  bool Isincrement;
  counterState({required this.counterValue, required this.Isincrement});
}
