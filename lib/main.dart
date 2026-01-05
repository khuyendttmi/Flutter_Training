import 'package:flutter/material.dart';
import 'package:flutter_training/khuyendt/flutter/gridview_widget.dart';
import 'package:flutter_training/khuyendt/flutter/singlescroll.dart';
import 'package:flutter_training/khuyendt/flutter/stack_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: GridviewWidget(),
    );
  }
}
