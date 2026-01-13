import 'package:flutter/material.dart';

void main() {
  runApp(MyCalc());
}

class MyCalc extends StatefulWidget {
  @override
  State<MyCalc> createState() => _MyCalcState();
}

class _MyCalcState extends State<MyCalc> {
  String InputValue = '';
  String CalulatorValue = "";
  String Operator = '';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 5;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            "Calculator App",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          )),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.topRight,
            child: Text(
              InputValue,
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              CaluButton("7", Colors.deepOrange, width),
              CaluButton("8", Colors.deepOrange, width),
              CaluButton("9", Colors.deepOrange, width),
              CaluButton("=", Colors.grey, width)
            ],
          ),
          Row(
            children: [
              CaluButton("4", Colors.deepOrange, width),
              CaluButton("5", Colors.deepOrange, width),
              CaluButton("6", Colors.deepOrange, width),
              CaluButton("+", Colors.grey, width)
            ],
          ),
          Row(
            children: [
              CaluButton("1", Colors.deepOrange, width),
              CaluButton("2", Colors.deepOrange, width),
              CaluButton("3", Colors.deepOrange, width),
              CaluButton("-", Colors.grey, width)
            ],
          ),
          Row(
            children: [
              CaluButton("clc", Colors.grey, width),
              CaluButton("0", Colors.deepOrange, width),
              CaluButton("/", Colors.grey, width),
              CaluButton("*", Colors.grey, width)
            ],
          ),
        ],
      ),
    ));
  }

  Widget CaluButton(String number, Color Colour, double width) {
    return InkWell(
      onTap: () {
        if (number == "clc") {
          setState(() {
            InputValue = "";
          });
        } else if (number == "+" ||
            number == "-" ||
            number == "*" ||
            number == "/") {
          setState(() {
            CalulatorValue = InputValue;
            InputValue = "";
            Operator = number;
          });
        } else if (number == "=") {
          setState(() {
            double calC = double.parse(CalulatorValue);
            double input = double.parse(InputValue);
            if (Operator == "+") {
              InputValue = (calC + input).toString();
            } else if (Operator == "-") {
              InputValue = (calC - input).toString();
            } else if (Operator == "/") {
              InputValue = (calC / input).toString();
            } else if (Operator == "*") {
              InputValue = (calC * input).toString();
            }
          });
        } else {
          setState(() {
            InputValue = InputValue + number;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 80,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colour,
            borderRadius: BorderRadius.circular(100),
          ),
          child:
              Text(number, style: TextStyle(fontSize: 35, color: Colors.white)),
        ),
      ),
    );
  }
}
