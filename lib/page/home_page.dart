import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:widget__tes/components/button.dart';
import 'package:widget__tes/theme/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override 
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String screenText = "";
  String proses = "";
  String result = "";
  String prevQuestion = "";

  void pressNumber(int number) {
    setState(() {
      if (screenText == "") {
        screenText = '$number';
        proses = "$number";
      } else {
        screenText = '$screenText$number';
        proses = "$proses$number";
      }
    });
  }

  void equalPressed () {
    String fianlQuestion = proses;

    Parser p = Parser();
    Expression exp = p.parse(fianlQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    String hasil = eval.toString();
    result = hasil;
    prevQuestion = screenText;
    screenText = result;
    proses = result;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.monetization_on),
            onPressed: () {

            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: backgroundColor,
              child:  Align(
                alignment: Alignment.centerRight,
                child: Column(
                  children : [
                    Text(
                      prevQuestion,
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      screenText,
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                    )
                  ]
                ),
              ),
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            crossAxisCount: 4,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
               CalculatorButton(
                 backgroundColor: backgroundColor,
                  foregroundColor: buttonColor,
                  text: "C",
                  ontap: () {
                    setState(() {
                      screenText = "";
                      proses = "";
                      result = "";
                      prevQuestion = "";
                    });
                  },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: buttonColor, 
                text: "/",
                ontap: () {
                  setState(() {
                    screenText = '$screenText/';
                    proses = "$proses / ";
                  });
                },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: buttonColor, 
                text: "x",
                ontap: () {
                  setState(() {
                    screenText = "$screenText x ";
                    proses = "$proses * ";
                  });               
                },
              ),
               CalculatorButton.Icon(
                backgroundColor: backgroundColor, 
                foregroundColor: buttonColor, 
                icon: Icons.backspace,
                text: "",
                ontap: () {
                  setState(() {
                    if (proses.isNotEmpty) {
                      proses = proses.substring(0, proses.length - 1);
                    }
                    if (screenText.isNotEmpty) {
                      screenText = screenText.substring(0, screenText.length - 1);
                    }
                  }); 
                },
                ),
                CalculatorButton(
                  backgroundColor: backgroundColor,
                  foregroundColor: 
                  textColor, 
                  text: "7",
                  ontap: () {
                    pressNumber(7);
                  },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: textColor, 
                text: "8",
                ontap: () {
                  pressNumber(8);
                },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: textColor, 
                text: "9",
                ontap: () {
                  pressNumber(9);
                },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: 
                buttonColor, 
                text: "-",
                ontap: () {
                  setState(() {
                    screenText = "$screenText - ";
                    proses = "$proses - ";
                  });
                },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: textColor, 
                text: "4",
                ontap: () {
                  pressNumber(4);
                },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: textColor, 
                text: "5",
                ontap: () {
                  pressNumber(5);
                },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: textColor, 
                text: "6",
                ontap: () {
                  pressNumber(6);
                },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: buttonColor, 
                text: "+",
                ontap: () {
                  setState(() {
                    screenText = "$screenText + ";
                    proses = "$proses + ";
                  });
                },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: textColor, 
                text: "1",
                ontap: () {
                  pressNumber(1);
                },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: textColor, 
                text: "2",
                ontap: () {
                  pressNumber(2);
                },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: textColor, 
                text: "3",
                ontap: () {
                  pressNumber(3);
                },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: buttonColor, 
                text: "=",
                ontap: () {
                  setState(() {
                    equalPressed();
                  });
                },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: textColor, 
                text: "%",
                ontap: () {
                  setState(() {
                    screenText = "$screenText% ";
                    proses = "$proses% ";
                  });          
                },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: textColor, 
                text: "0",
                ontap: () {
                  pressNumber(0);
                },
                ),
               CalculatorButton(
                backgroundColor: backgroundColor, 
                foregroundColor: textColor, 
                text: ".",
                ontap: () {
                  screenText = "$screenText.";
                  proses = "$proses.";
                },
                ),
               CalculatorButton.Icon(
                backgroundColor: backgroundColor,
                foregroundColor: buttonColor, 
                icon: Icons.calculate,
                text: "",
                ontap: () {},
                ),
            ],
          )
        ],
      ),
    );
  }
}