import 'package:firstapp/widgets/mybutton.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';

  var userAnswer = '';
  var preanswer = '';

  final List<String> listofdata = [
    'C',
    'DEC',
    '%',
    '/',
    '9',
    '8',
    '7',
    '+',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '*',
    '0',
    '.',
    'ANS',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    Offset distance = Offset(10, 10);
    double blur = 5;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(7),
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      inset: true,
                      blurRadius: blur,
                      offset: -distance,
                      color: Colors.white,
                    ),
                    BoxShadow(
                        spreadRadius: 13,
                        inset: true,
                        blurRadius: blur,
                        offset: distance,
                        color: Color(0xFFA7A9AF))
                  ],
                  color: Colors.deepPurple[100], // Background color
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),

                    bottomLeft:
                        Radius.circular(20), // Set desired border radius
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          userQuestion,
                          style: const TextStyle(fontSize: 20),
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          userAnswer,
                          style: const TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: GridView.builder(
                  itemCount: listofdata.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return SizedBox(
                        child: Center(
                            child: MyButton(
                                buttonTap: () {
                                  setState(() {
                                    userQuestion = '';
                                    userAnswer = '';
                                  });
                                },
                                color: Colors.green,
                                textcolor: Colors.white,
                                text: listofdata[index])),
                      );
                    } else if (index == 1) {
                      return SizedBox(
                          child: Center(
                              child: MyButton(
                                  buttonTap: () {
                                    setState(() {
                                      userQuestion = userQuestion.substring(
                                          0, userQuestion.length - 1);
                                    });
                                  },
                                  color: Colors.red,
                                  textcolor: Colors.white,
                                  text: listofdata[index])));
                    } else if (index == listofdata.length - 1) {
                      return SizedBox(
                          child: Center(
                              child: MyButton(
                                  buttonTap: () {
                                    setState(() {
                                      equalPress();
                                    });
                                  },
                                  color: Colors.red,
                                  textcolor: Colors.white,
                                  text: listofdata[index])));
                    } else if (index == listofdata.length - 2) {
                      return SizedBox(
                          child: Center(
                              child: MyButton(
                                  buttonTap: () {
                                    setState(() {
                                      prevanswer();
                                    });
                                  },
                                  color: Colors.white,
                                  textcolor: Colors.deepPurple[20],
                                  text: listofdata[index])));
                    } else {
                      return SizedBox(
                        child: Center(
                            child: MyButton(
                                buttonTap: () {
                                  setState(() {
                                    userQuestion += listofdata[index];
                                  });
                                },
                                color: isOperator(listofdata[index])
                                    ? Colors.deepPurple
                                    : Colors.deepPurple[50],
                                textcolor: isOperator(listofdata[index])
                                    ? Colors.white
                                    : Colors.deepPurple[20],
                                text: listofdata[index])),
                      );
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }

  bool isOperator(String st) {
    if (st == '+' ||
        st == '-' ||
        st == '%' ||
        st == '=' ||
        st == '*' ||
        st == '/') {
      return true;
    } else {
      return false;
    }
  }

  equalPress() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    preanswer = eval.toString();
    userAnswer = eval.toString();
  }

  prevanswer() {
    userQuestion = userQuestion.toString() + preanswer.toString();
  }
}
