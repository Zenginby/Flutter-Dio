import 'package:flutter/material.dart';
import 'package:flutter_dio_test/dummyjson_resource/view/dummyjson_view.dart';
import 'package:flutter_dio_test/reqrest_resource/view/req_res_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(color: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DummyjsonView(),
    );
  }
}

