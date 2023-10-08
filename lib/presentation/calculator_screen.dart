import 'package:flutter/material.dart';

class MyCalc extends StatefulWidget {
  const MyCalc({super.key});

  @override
  State<MyCalc> createState() => _MyCalcState();
}

class _MyCalcState extends State<MyCalc> {
  // We can make same dataTypes at same line
  // So, Why not ? .. as we save lines
  double num1 = 0, num2 = 0, tempNum = 0;
  String res = "", op = "", displayed = "";



  final List<List<(String key, Color? color)>> _buttons = [
    // we don't repeat, so don't make non-nullable mark (!)
    // for every nullable color
    // instead we leave it nullable and make its dataType to nullable
    [('AC', Colors.green[200]), ('+/-', Colors.blue[200]), ('%', Colors.blue[200]), ('/', Colors.blue[200])],
    [('7', Colors.indigoAccent[100]), ('8', Colors.indigoAccent[100]), ('9', Colors.indigoAccent[100]), ('x', Colors.blue[200])],
    [('4', Colors.indigoAccent[100]), ('5', Colors.indigoAccent[100]), ('6', Colors.indigoAccent[100]), ('-', Colors.blue[200])],
    [('1', Colors.indigoAccent[100]), ('2', Colors.indigoAccent[100]), ('3', Colors.indigoAccent[100]), ('+', Colors.blue[200])],
    [('BACK', Colors.pink[200]), ('0', Colors.pink[200]), ('.', Colors.pink[200]), ('=', Colors.green[200])],
  ];

  // bool ifContainDot(String test) {
  //   for (int i = 0; i < test.length; i++) {
  //     if (test[i] == '.') {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  myResult(String buttonTyped) {
    if (buttonTyped == 'AC') {
      op = '';
      res = '';
      num1 = 0;
      num2 = 0;
      displayed = '';
    } else if (buttonTyped == '+/-') {
      if (displayed[0] != '-') {
        res = '-$displayed';
      } else {
        res = displayed.substring(1, displayed.length);
      }
    } else if (buttonTyped == '+' || buttonTyped == '-' || buttonTyped == 'x' || buttonTyped == '/') {
      num1 = double.parse(displayed);
      op = buttonTyped;
      res = '';
    } else if (buttonTyped == '=') {
      num2 = double.parse(displayed);
      if (op == '+') {
        res = (num1 + num2).toString();
      } else if (op == '-') {
        res = (num1 - num2).toString();
      } else if (op == 'x') {
        res = (num1 * num2).toString();
      } else if (op == '/') {
        res = (num1 / num2).toString();
      }
    } else if (buttonTyped == '%') {
      tempNum = double.parse(displayed);
      tempNum /= 100;
      res = tempNum.toString();
    } else if (buttonTyped == 'BACK') {
      res = displayed.substring(0, displayed.length - 1);
    } else if (buttonTyped == '.') {
      if (displayed.contains(".")) {
        res = displayed.substring(0, displayed.length - 1);
      } else {
        res = (double.parse(displayed + buttonTyped)).toString();
      }
    } else {
      res = int.parse(displayed + buttonTyped).toString();
    }
    setState(() {
      displayed = res;
      //res = int.parse(displayed).toString();
    });
  }

  // Making (Color) dataType to nullable as (Color?)
  Widget myButton(String buttonTyped, Color? buttonColor) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: buttonColor,
      child: TextButton(
        // Converted to expression body function
        // as its only do on thing or calling one function
        onPressed: () => myResult(buttonTyped),
        child: Text(buttonTyped, style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: const Text('Calculator', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 350,
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
            child: Text(displayed, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          ),

          // There was a lot of Rows and myButtons
          // So when there is a repetition we think about loops
          // and we think at first in for loop

          // 5 as 5 Rows
          for (int i = 0; i < 5; ++i)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 4 as 4 myButtons
                for (int j = 0; j < 4; ++j) myButton(_buttons[i][j].$1, _buttons[i][j].$2),
              ],
            ),
        ],
      ),
    );
  }
}
