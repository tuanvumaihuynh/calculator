import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:ios_calculator_2/utils/styles.dart';
import 'package:ios_calculator_2/widgets/button.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String input = "0";
  Parser p = Parser();

  @override
  Widget build(BuildContext context) {
    // Variables
    var screenWidth = MediaQuery.of(context).size.width;
    double btnWidth = screenWidth * 0.21;
    // UI
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 16, left: 8),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: AutoSizeText(
                    input,
                    maxLines: 1,
                    minFontSize: 10,
                    style: TextStyle(color: Styles.textWhite, fontSize: 80),
                  ),
                ),
              ))
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: "AC",
                      bgColor: Styles.greyColor,
                      textColor: Styles.textBlack),
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: 'DEL',
                      bgColor: Styles.greyColor,
                      textColor: Styles.textBlack),
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '%',
                      bgColor: Styles.greyColor,
                      textColor: Styles.textBlack),
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '÷',
                      bgColor: Styles.orangeColor,
                      textColor: Styles.textWhite),
                ],
              ),
              SizedBox(height: screenWidth * 0.032),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '7',
                      bgColor: Styles.blackColor,
                      textColor: Styles.textWhite),
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '8',
                      bgColor: Styles.blackColor,
                      textColor: Styles.textWhite),
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '9',
                      bgColor: Styles.blackColor,
                      textColor: Styles.textWhite),
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: 'x',
                      bgColor: Styles.orangeColor,
                      textColor: Styles.textWhite),
                ],
              ),
              SizedBox(height: screenWidth * 0.032),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '4',
                      bgColor: Styles.blackColor,
                      textColor: Styles.textWhite),
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '5',
                      bgColor: Styles.blackColor,
                      textColor: Styles.textWhite),
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '6',
                      bgColor: Styles.blackColor,
                      textColor: Styles.textWhite),
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '-',
                      bgColor: Styles.orangeColor,
                      textColor: Styles.textWhite),
                ],
              ),
              SizedBox(height: screenWidth * 0.032),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '1',
                      bgColor: Styles.blackColor,
                      textColor: Styles.textWhite),
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '2',
                      bgColor: Styles.blackColor,
                      textColor: Styles.textWhite),
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '3',
                      bgColor: Styles.blackColor,
                      textColor: Styles.textWhite),
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '+',
                      bgColor: Styles.orangeColor,
                      textColor: Styles.textWhite),
                ],
              ),
              SizedBox(height: screenWidth * 0.032),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      parseInput('0');
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                            screenWidth *
                                (0.42 + 0.032), // 2 button size + 1 space size
                            screenWidth * 0.21),
                        shape: const StadiumBorder(),
                        onPrimary: Styles.textWhite,
                        primary: Styles.blackColor,
                        padding: EdgeInsets.only(
                            right: screenWidth * (0.21 + 0.032))),
                    child: const Text('0', style: TextStyle(fontSize: 30)),
                  ),
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '.',
                      bgColor: Styles.blackColor,
                      textColor: Styles.textWhite),
                  MyButton(
                      callbackFunction: parseInput,
                      width: btnWidth,
                      height: btnWidth,
                      btnText: '=',
                      bgColor: Styles.orangeColor,
                      textColor: Styles.textWhite),
                ],
              ),
              SizedBox(height: screenWidth * 0.032),
            ],
          ),
        ],
      ),
    );
  }

  String equalFunc(strInput) {
    String inputCopy = strInput.replaceAll('x', '*');
    inputCopy = inputCopy.replaceAll('÷', '/');
    // Math expression
    Expression exp = p.parse(inputCopy);
    ContextModel cm = ContextModel();
    num nums = exp.evaluate(EvaluationType.REAL, cm);

    if (nums % 1 == 0) {
      nums = nums.toInt();
    } else {
      nums = num.parse(nums.toStringAsFixed(2));
    }

    return nums.toString();
  }

  parseInput(String btnText) {
    if (btnText == '=') {
      String result = equalFunc(input);
      setState(() {
        input = result;
      });
    } else if (btnText == "AC") {
      setState(() {
        input = "0";
      });
    } else if (btnText == 'DEL') {
      if (input.isNotEmpty) {
        setState(() {
          input = input.substring(0, input.length - 1);
        });
      }
    } else if (btnText == '%') {
      int lastIndex = getLastIndexOfOper(input);
      if (lastIndex != -1) {
        String subNum =
            equalFunc(input.substring(lastIndex + 1, input.length) + "*0.01");
        String result = input.substring(0, lastIndex + 1) + subNum;
        setState(() {
          input = result;
        });
      } else {
        input += "*0.01";
        String result = equalFunc(input);
        setState(() {
          input = result;
        });
      }
    } else if (isOper(btnText)) {
      if (isOper(input.substring(input.length - 1))) {
        input = input.substring(0, input.length - 1);
        setState(() {
          input += btnText;
        });
      } else {
        setState(() {
          input += btnText;
        });
      }
      // Number 0-9
    } else {
      if (input == "0") {
        setState(() {
          input = btnText;
        });
      } else {
        setState(() {
          input += btnText;
        });
      }
    }
  }

  /// Return the last index of Operator in String
  ///
  /// Return -1 if String does not contain Operator
  int getLastIndexOfOper(String strInput) {
    // ignore: prefer_is_empty
    if (strInput.length > 0) {
      List listIndex = [
        strInput.lastIndexOf('+'),
        strInput.lastIndexOf('-'),
        strInput.lastIndexOf('x'),
        strInput.lastIndexOf('÷')
      ];
      // Does Input contain operator
      for (int i = 0; i < listIndex.length; i++) {
        if (listIndex[i] > 0) {
          return listIndex
              .reduce((current, next) => current > next ? current : next);
        }
      }
    }
    return -1;
  }

  bool isOper(operator) {
    if (operator == "x" ||
        operator == "÷" ||
        operator == "+" ||
        operator == "-") {
      return true;
    }
    return false;
  }
}
