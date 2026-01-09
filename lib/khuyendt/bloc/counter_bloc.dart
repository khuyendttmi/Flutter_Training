import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/khuyendt/bloc/counter_state.dart';
import 'package:flutter_training/khuyendt/bloc/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(id: 0, value: 0)) {
    on<IncrementPressed>((event, emit) {
      emit(CounterState(id: state.id+2, value: state.value+1));
    });
    on<DecrementPressed>((event, emit) {
      emit(CounterState(id: state.id-2 ,value: state.value-1));
    },);
  }
}
