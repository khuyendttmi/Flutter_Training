import 'package:flutter_training/khuyendt/riverpod/contact/contact_page.dart';
import 'package:flutter_training/khuyendt/riverpod/counter_page.dart';
import 'package:flutter_training/khuyendt/riverpod/todo/todo_page.dart';
import 'package:go_router/go_router.dart';

class ExampleGoRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return MyCounterPage();
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
