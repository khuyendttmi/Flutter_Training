import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/khuyendt/bloc/counter_bloc.dart';
import 'package:flutter_training/khuyendt/bloc/counter_page.dart';
import 'package:flutter_training/khuyendt/bloc/counter_page_two.dart';
import 'package:flutter_training/khuyendt/riverpod/contact/contact_page.dart';
import 'package:flutter_training/khuyendt/riverpod/todo/todo_page.dart';
import 'package:go_router/go_router.dart';

class ExampleGoRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return CounterPage();
        },
      ),
      GoRoute(
        path: '/counter_page_two',
        builder: (context, state) {
          return BlocProvider.value(
            value: BlocProvider.of<CounterBloc>(context),
            child: CounterPageTwo(),
          );
        },
      ),
      GoRoute(
        path: '/todo',
        builder: (context, state) {
          return TodoPage();
        },
      ),
      GoRoute(
        path: '/contact',
        builder: (context, state) {
          return ContactPage();
        },
      ),
    ],
  );
}
