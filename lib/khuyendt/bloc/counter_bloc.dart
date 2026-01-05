import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/khuyendt/bloc/counter_state.dart';
import 'package:flutter_training/khuyendt/bloc/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(value: 0)) {
    on<IncrementPressed>((event, emit) {
      emit(CounterState(value: state.value+1));
    });
  }
}
