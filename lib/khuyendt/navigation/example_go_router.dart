import 'package:flutter_training/khuyendt/riverpod/contact/contact_page.dart';
import 'package:flutter_training/khuyendt/riverpod/todo/todo_page.dart';
import 'package:flutter_training/khuyendt/storage/drift/todo_page.dart';
import 'package:flutter_training/khuyendt/storage/share_perference/home_page.dart';
import 'package:go_router/go_router.dart';

class ExampleGoRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return TodoPageDrift();
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
