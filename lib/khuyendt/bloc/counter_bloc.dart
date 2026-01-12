import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/khuyendt/bloc/counter_repository.dart';
import 'package:flutter_training/khuyendt/bloc/counter_state.dart';
import 'package:flutter_training/khuyendt/bloc/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository counterRepository;

  CounterBloc(this.counterRepository) : super(CounterState(id: 0, value: 0)) {
    on<IncrementPressed>((event, emit) {
      final value = counterRepository.increment();
      emit(CounterState(id: state.id + 2, value: value));
    });
    on<DecrementPressed>((event, emit) {
      final value = counterRepository.decrement();
      emit(CounterState(id: state.id - 2, value: value));
    });
  }
}
