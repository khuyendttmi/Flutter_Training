import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/khuyendt/bloc/counter_bloc.dart';
import 'package:flutter_training/khuyendt/bloc/counter_state.dart';
import 'package:flutter_training/khuyendt/bloc/counter_event.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(child: Text('Số lần nhấn là ${state.value}'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => context.read<CounterBloc>().add(IncrementPressed()),
        child: Icon(Icons.add),
      ),
    );
  }
}
