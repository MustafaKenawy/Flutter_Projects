// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '';
  double firstNum = 0;
  double secondNum = 0;
  String operator = '';
  String history = '';

  void buttonClick(String num) {
    setState(() {
      text = '$text$num';
      history = '$history$num';
    });
  }

  void operatorClick(String op) {
    if (operator != '')
      return;
    operator = op;
    setState(() {
    history = '$history$operator';
    });
    firstNum = double.parse(text);
    Future.delayed(Duration(milliseconds: 100),()=>text = '');
  }

  void clear (){
    history = '';
    text = '';

  }

  void equalClick(String eq) {
    setState(() {
      secondNum = double.parse(text);
      if (operator == '+') {
        text = (firstNum + secondNum).toString();
        operator = '';
      } else if (operator == '-') {
        text = (firstNum - secondNum).toString();
        operator = '';
      } else if (operator == 'x') {
        text = (firstNum * secondNum).toString();
        operator = '';
      } else if (operator == '/') if (secondNum == 0) {
        text = 'N/A';
        operator = '';
      } else {
        text = (firstNum / secondNum).toString();
        operator = '';
      }
      firstNum = 0;
      secondNum = 0;
      operator = '';
      Future.delayed(Duration(milliseconds: 100,),clear);
    });
  }

  void acClick(String) {
    setState(() {
      text = '';
      firstNum = 0;
      secondNum = 0;
      operator = '';
      history = '';
    });
  }

  void plusMinusClick(String) {
    double num = double.parse(text);
    num = 0 - num;
    setState(() {
      text = num.toString();
    });
  }

  void backSpaceClick (String) {

    setState(() {
      text = text.substring(0,text.length -1);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Container(
      color: Color.fromRGBO(0, 0, 0, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.all(30),
            alignment: Alignment.bottomRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  history,
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white54,
                      decoration: TextDecoration.none),
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Button(
                text: 'AC',
                color: Color.fromRGBO(80, 80, 80, 1),
                show: acClick,
              ),
              Button(
                text: '+/-',
                color: Color.fromRGBO(80, 80, 80, 1),
                show: plusMinusClick,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(80, 80, 80, 1),
                    //Color(0x50505050),
                    shape: BoxShape.circle,
                    ),
                // color: Colors.cyan,
                width: 80,
                height: 95,
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      minimumSize: Size.fromWidth(80),
                  ),
                  child: Icon(Icons.backspace_rounded,
                  color: Colors.white,
                    size: 35,
                  ),
                  onPressed:()=> backSpaceClick(''),
                ),
              ),
              Button(
                  text: '/',
                  color: Color.fromRGBO(255, 149, 0, 1),
                  show: operatorClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Button(
                  text: '9',
                  color: Color.fromRGBO(28, 28, 28, 1),
                  show: buttonClick),
              Button(
                  text: '8',
                  color: Color.fromRGBO(28, 28, 28, 1),
                  show: buttonClick),
              Button(
                  text: '7',
                  color: Color.fromRGBO(28, 28, 28, 1),
                  show: buttonClick),
              Button(
                  text: 'x',
                  color: Color.fromRGBO(255, 149, 0, 1),
                  show: operatorClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Button(
                  text: '6',
                  color: Color.fromRGBO(28, 28, 28, 1),
                  show: buttonClick),
              Button(
                  text: '5',
                  color: Color.fromRGBO(28, 28, 28, 1),
                  show: buttonClick),
              Button(
                  text: '4',
                  color: Color.fromRGBO(28, 28, 28, 1),
                  show: buttonClick),
              Button(
                  text: '-',
                  color: Color.fromRGBO(255, 149, 0, 1),
                  show: operatorClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Button(
                  text: '3',
                  color: Color.fromRGBO(28, 28, 28, 1),
                  show: buttonClick),
              Button(
                  text: '2',
                  color: Color.fromRGBO(28, 28, 28, 1),
                  show: buttonClick),
              Button(
                  text: '1',
                  color: Color.fromRGBO(28, 28, 28, 1),
                  show: buttonClick),
              Button(
                  text: '+',
                  color: Color.fromRGBO(255, 149, 0, 1),
                  show: operatorClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(28, 28, 28, 1),
                    //Color(0x50505050),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50)),
                // color: Colors.cyan,
                width: 175,
                height: 80,
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                      minimumSize: Size.fromWidth(175),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 35)
                  ),
                  child: Text(
                    '0',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  onPressed: () => buttonClick('0'),
                ),
              ),
              Button(
                  text: '.',
                  color: Color.fromRGBO(28, 28, 28, 1),
                  show: buttonClick),
              Button(
                  text: '=',
                  color: Color.fromRGBO(255, 149, 0, 1),
                  show: equalClick),
            ],
          ),
        ],
      ),
    );
  }
}
