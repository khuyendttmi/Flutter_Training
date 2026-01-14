import 'package:flutter/material.dart';
import 'package:flutter_training/clean_architecture/di/di.dart';
import 'package:flutter_training/clean_architecture/presentation/pages/task/pages/task_page.dart';
import 'package:flutter_training/khuyendt/navigation/example_go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ExampleGoRouter goRouter = ExampleGoRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TaskPage(),
    );
  }
}
