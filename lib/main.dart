import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/khuyendt/navigation/example_go_router.dart';
import 'package:flutter_training/khuyendt/user_profile/get_it/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(ProviderScope(child: MyApp()));
  // runApp(BlocProvider(create: (context) => CounterBloc(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ExampleGoRouter goRouter = ExampleGoRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: goRouter.router,
    );
  }
}
