import 'package:flutter/material.dart';

class MyCalc extends StatefulWidget {
  const MyCalc({super.key});

  @override
  State<MyCalc> createState() => _MyCalcState();
}

class _MyCalcState extends State<MyCalc> {
  double num1 = 0;
  double num2 = 0;
  double tempNum = 0;
  String res = "";
  String op = "";
  String displayed = "";

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
      num1 = 0;
      num2 = 0;
      res = '';
      op = '';
      displayed = '';
    } else if (buttonTyped == '+/-') {
      if (displayed[0] != '-') {
        res = '-$displayed';
      } else {
        res = displayed.substring(1, displayed.length);
      }
    } else if (buttonTyped == '+' ||
        buttonTyped == '-' ||
        buttonTyped == 'x' ||
        buttonTyped == '/') {
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

  Widget myButton(
    String buttonTyped,
    Color buttonColor,
  ) {
    return CircleAvatar(
      backgroundColor: buttonColor,
      radius: 35,
      child: TextButton(
        child: Text(
          buttonTyped,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          myResult(buttonTyped);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
            ),
            width: 350,
            height: 200,
            child: Text(
              displayed,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              myButton('AC', Colors.green[200]!),
              myButton('+/-', Colors.blue[200]!),
              myButton('%', Colors.blue[200]!),
              myButton('/', Colors.blue[200]!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              myButton('7', Colors.indigoAccent[100]!),
              myButton('8', Colors.indigoAccent[100]!),
              myButton('9', Colors.indigoAccent[100]!),
              myButton('x', Colors.blue[200]!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              myButton('4', Colors.indigoAccent[100]!),
              myButton('5', Colors.indigoAccent[100]!),
              myButton('6', Colors.indigoAccent[100]!),
              myButton('-', Colors.blue[200]!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              myButton('1', Colors.indigoAccent[100]!),
              myButton('2', Colors.indigoAccent[100]!),
              myButton('3', Colors.indigoAccent[100]!),
              myButton('+', Colors.blue[200]!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              myButton('BACK', Colors.pink[200]!),
              myButton('0', Colors.pink[200]!),
              myButton('.', Colors.pink[200]!),
              myButton('=', Colors.green[200]!),
            ],
          ),
        ],
      ),
    );
  }
}
