import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCalc(),
    ),
  );
}

class MyCalc extends StatefulWidget {
  const MyCalc({super.key});

  @override
  State<MyCalc> createState() => _MyCalcState();
}

class _MyCalcState extends State<MyCalc> {
  int n1 = 0;
  int n2 = 0;
  String res = "";
  String op = "";
  String displayed = "";

  void myResult(String s) {
    if (s == 'AC') {
      n1 = 0;
      n2 = 0;
      res = '';
      op = '';
      displayed = '';
    } else if (op == '+/-') {
      if (displayed[0] != '-') {
        res = '-$displayed';
      } else {
        res = displayed.substring(1, displayed.length + 1);
      }
    } else if (s == '+' || s == '-' || s == 'x' || s == '/') {
      n1 = int.parse(displayed);
      op = s;
      res = '';
    } else if (s == '=') {
      n2 = int.parse(displayed);
      if (op == '+') {
        res = (n1 + n2).toString();
      } else if (op == '-') {
        res = (n1 - n2).toString();
      } else if (op == 'x') {
        res = (n1 * n2).toString();
      } else if (op == '/') {
        res = (n1 / n2).toString();
      }
    } else if (op == '%') {
      res = '$displayed/100';
    } else if (op == 'BACK') {
      res = displayed.substring(0, displayed.length - 1);
    } else {
      res = int.parse(displayed + s).toString();
    }
    setState(() {
      displayed = res;
    });
  }

  Widget myButton(
    String s,
    Color c,
  ) {
    return CircleAvatar(
      backgroundColor: c,
      radius: 35,
      child: TextButton(
        child: Text(
          s,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          myResult(s);
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
