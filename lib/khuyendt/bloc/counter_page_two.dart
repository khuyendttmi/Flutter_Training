import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/khuyendt/bloc/counter_bloc.dart';
import 'package:flutter_training/khuyendt/bloc/counter_event.dart';
import 'package:flutter_training/khuyendt/bloc/counter_state.dart';

class CounterPageTwo extends StatelessWidget {
  const CounterPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bloc Provider Page 2")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc,CounterState>(
            builder: (context, state) {
              return Center(
                child: Text('Số lần nhấn là ${state.value}', style: TextStyle(fontSize: 18)),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "btn3",
              onPressed: () =>
                  context.read<CounterBloc>().add(IncrementPressed()),
              child: Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "btn4",
              onPressed: () =>
                  context.read<CounterBloc>().add(DecrementPressed()),
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
