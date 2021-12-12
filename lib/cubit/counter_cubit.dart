import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<counterState> {
  CounterCubit() : super(counterState(counterValue: 0, Isincrement: true));

  void increment() => emit(
      counterState(counterValue: state.counterValue + 1, Isincrement: true));
  void decrement() => emit(
      counterState(counterValue: state.counterValue - 1, Isincrement: false));
}
