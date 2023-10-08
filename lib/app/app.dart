import 'package:flutter/material.dart';

import '../presentation/calculator_screen.dart';

class MyCalculator extends StatelessWidget {
  const MyCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCalc(),
      debugShowCheckedModeBanner: false,
    );
  }
}
