import 'package:bloccounter/bloc/counter_event.dart';
import 'package:bloccounter/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInit(0)) {
    int Counter = 0;
    on<DecrementPressed>((event, emit) {
      emit(UpdatedCounter(--Counter));
    });
    on<IncrementPressed>((event, emit) {
      emit(UpdatedCounter(++Counter));
    });
  }
}
