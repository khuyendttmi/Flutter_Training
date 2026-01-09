import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/khuyendt/bloc/counter_bloc.dart';
import 'package:flutter_training/khuyendt/navigation/example_go_router.dart';
import 'package:flutter_training/khuyendt/user_profile/get_it/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  // runApp(ProviderScope(child: MyApp()));
  runApp(
    BlocProvider(
      lazy: true,//false: khởi tạo dù chưa gọi .read hay builderBloc,...
      create: (context){
        print('load Bloc');
        return  CounterBloc();
      },
      child: MyApp(),
    ),
  );
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
