import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/khuyendt/bloc/counter_bloc.dart';
import 'package:flutter_training/khuyendt/bloc/counter_page_two.dart';
import 'package:flutter_training/khuyendt/bloc/counter_state.dart';
import 'package:flutter_training/khuyendt/bloc/counter_event.dart';
import 'package:go_router/go_router.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bloc Provider',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // dùng khi widget cần update UI và cần side-effect
            BlocConsumer<CounterBloc, CounterState>(
              buildWhen: (previous, current) {
                return current.value >= 3; // true thì chạy builder
              },
              builder: (context, state) {
                return Center(
                  child: Text(
                    'Số lần nhấn là ${state.value}',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              },
              listener: (context, state) {
                if (state.value == 5) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Hiện tại bạn đã đạt đến ${state.value}'),
                    ),
                  );
                }
              },
            ),
            BlocSelector<CounterBloc, CounterState, int>(
              selector: (state) => state.id,
              builder: (context, state) {
                return Text('Giá trị id: $state');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    context.push(
                      '/counter_page_two',
                      // cho widget tiếp theo mượn bloc mà không cần khởi tạo
                      extra: BlocProvider.value(
                        value: BlocProvider.of<CounterBloc>(context),
                        child: CounterPageTwo(),
                      ),
                    );
                  },
                  child: Text(
                    'Trang 2 -->',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),

            // BlocBuilder<CounterBloc, CounterState>(
            //   builder: (context, state) {
            //     return Center(
            //       child: Text(
            //         'Số lần nhấn là ${state.value}',
            //         style: TextStyle(fontSize: 18),
            //       ),
            //     );
            //   },
            // ),
            // BlocListener<CounterBloc, CounterState>(
            //   listener: (context, state) {
            //     if (state.value == 5) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(content: Text('Số lần nhấn là ${state.value}',style: TextStyle(fontSize: 18),)),
            //       );
            //     }
            //   },
            //   child: const SizedBox(),
            // ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "btn1",
              onPressed: () =>
                  context.read<CounterBloc>().add(IncrementPressed()),
              child: Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "btn",
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
