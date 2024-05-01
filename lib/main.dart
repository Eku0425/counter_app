import 'package:counter_app/count.dart';
import 'package:flutter/material.dart';

void main()
{
   runApp(CounterApp());

}
class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

