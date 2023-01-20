// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:calculator/Utility/button.dart';
import 'package:calculator/Utility/custombuttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:math_expressions/math_expressions.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final controller = TextEditingController();
  bool ispressed = false;
  ContextModel cm = ContextModel();
  late String result = '';

  calcuateResult() {
    Parser p = Parser();
    Expression exp = p.parse(controller.text);
    var tempres = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = tempres.toString();
    });
  }

  var mylist = [
    'AC',
    Icons.clear,
    '/',
    '*',
    '7',
    '8',
    '9',
    '-',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '=',
    '0',
    '.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 70, left: 15, right: 15),
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Color.fromARGB(0, 103, 111, 111),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    controller.text,
                    style: TextStyle(
                        fontSize: ispressed == true ? 25 : 35,
                        color: ispressed == false
                            ? Colors.white
                            : Color.fromARGB(255, 79, 80, 85),
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ispressed == true
                      ? FittedBox(
                          child: Text(
                            '= $result',
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      : SizedBox(
                          height: 0,
                        ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 85,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: 500,
            child: MasonryGridView.count(
              itemCount: mylist.length + 1,
              crossAxisCount: 4,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              itemBuilder: (context, index) {
                if (index == 11) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.text =
                            controller.text + mylist[index].toString();
                        ispressed = false;
                      });
                    },
                    child: CustomButton(
                      data: mylist[index],
                      height: 113,
                      width: 30,
                      color: Color.fromARGB(255, 55, 81, 228),
                      textcolor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  );
                }
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.clear();
                        result = '';
                        ispressed = false;
                      });
                    },
                    child: ButtonNum(
                        data: mylist[index],
                        color: Color.fromARGB(255, 225, 193, 193),
                        textcolor: Color.fromARGB(255, 211, 80, 80)),
                  );
                }
                if (index == 1) {
                  return GestureDetector(
                    onTap: () {
                      final String temp = controller.text;
                      var list = temp.substring(0, temp.length - 1);
                      setState(() {
                        controller.text = list;
                        ispressed = false;
                      });
                    },
                    child: ButtonNum(
                        data: mylist[index],
                        color: Color.fromARGB(255, 225, 193, 193),
                        textcolor: Color.fromARGB(255, 211, 80, 80)),
                  );
                }
                if (index == 15) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        ispressed = true;
                      });
                      calcuateResult();
                    },
                    onDoubleTap: () {
                      setState(() {
                        controller.text = result;
                        ispressed = false;
                      });
                    },
                    child: CustomButton(
                      data: mylist[index],
                      height: 113,
                      width: 30,
                      color: Color.fromARGB(255, 55, 81, 228),
                      textcolor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  );
                }
                if (index == 18) {
                  return Container(
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 130, 137, 233)),
                    child: Image(
                      image: AssetImage('lib/cool.png'),
                      fit: BoxFit.contain,
                    ),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.text =
                          controller.text + mylist[index].toString();
                      ispressed = false;
                    });
                  },
                  child: ButtonNum(
                    data: mylist[index],
                    color: (index % 4 == 3 || index == 2)
                        ? Color.fromARGB(255, 55, 81, 228)
                        : Color.fromARGB(255, 28, 27, 27),
                    textcolor: index % 4 == 3 || index == 2
                        ? Color.fromARGB(255, 255, 255, 255)
                        : Color.fromARGB(255, 54, 57, 234),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
