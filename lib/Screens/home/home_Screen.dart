import 'package:calc/Screens/home/calc_screen.dart';
import 'package:calc/Screens/home/widgets/calc_button.dart';
import 'package:calc/models/operations.dart';
import 'package:flutter/material.dart';

String _initializeExtractor(String fullString) {
  var ext = StringExtractor(fullString: fullString);
  ext.extractString();
  var result = ext.calculateOperation();
  return result;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screenText = '0';

  _updateScreen(String text) {
    setState(() {
      screenText == '0' ? screenText = text : screenText += text;
    });
  }

  _clearScreen() {
    setState(() {
      screenText = '0';
    });
  }

  _deleteText() {
    setState(() {
      screenText = screenText.substring(0, screenText.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CalcScreen(
              screenText: screenText,
            ),
            //first row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                    buttonColor: Colors.grey.shade600,
                    text: "AC",
                    onPressed: () {
                      _clearScreen();
                    }),
                CalcButton(
                    buttonColor: Colors.grey.shade600,
                    text: "( )",
                    onPressed: () {}),
                CalcButton(
                    buttonColor: Colors.grey.shade600,
                    text: "%",
                    onPressed: () {
                      _updateScreen("%");
                    }),
                CalcButton(
                    buttonColor: Colors.grey.shade600,
                    text: "/",
                    onPressed: () {
                      _updateScreen("/");
                    })
              ],
            ),

            //second row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                    buttonColor: Colors.grey.shade800,
                    text: "7",
                    onPressed: () {
                      _updateScreen("7");
                    }),
                CalcButton(
                    buttonColor: Colors.grey.shade800,
                    text: "8",
                    onPressed: () {
                      _updateScreen("8");
                    }),
                CalcButton(
                    buttonColor: Colors.grey.shade800,
                    text: "9",
                    onPressed: () {
                      _updateScreen("9");
                    }),
                CalcButton(
                    buttonColor: Colors.grey.shade600,
                    text: "x",
                    onPressed: () {
                      _updateScreen("x");
                    })
              ],
            ),
            //third row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                    buttonColor: Colors.grey.shade800,
                    text: "4",
                    onPressed: () {
                      _updateScreen("4");
                    }),
                CalcButton(
                    buttonColor: Colors.grey.shade800,
                    text: "5",
                    onPressed: () {
                      _updateScreen("5");
                    }),
                CalcButton(
                    buttonColor: Colors.grey.shade800,
                    text: "6",
                    onPressed: () {
                      _updateScreen("6");
                    }),
                CalcButton(
                    buttonColor: Colors.grey.shade600,
                    text: "-",
                    onPressed: () {
                      _updateScreen("-");
                    })
              ],
            ),
            //fourth row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                    buttonColor: Colors.grey.shade800,
                    text: "1",
                    onPressed: () {
                      _updateScreen("1");
                    }),
                CalcButton(
                    buttonColor: Colors.grey.shade800,
                    text: "2",
                    onPressed: () {
                      _updateScreen("2");
                    }),
                CalcButton(
                    buttonColor: Colors.grey.shade800,
                    text: "3",
                    onPressed: () {
                      _updateScreen("3");
                    }),
                CalcButton(
                    buttonColor: Colors.grey.shade600,
                    text: "+",
                    onPressed: () {
                      _updateScreen("+");
                    })
              ],
            ),
            //fifth row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                    buttonColor: Colors.grey.shade800,
                    text: "0",
                    onPressed: () {
                      _updateScreen("0");
                    }),
                CalcButton(
                    buttonColor: Colors.grey.shade800,
                    text: ".",
                    onPressed: () {
                      _updateScreen(".");
                    }),
                CalcButton(
                    buttonColor: Colors.grey.shade800,
                    text: "",
                    icon: Icons.backspace,
                    onPressed: () {
                      _deleteText();
                    }),
                CalcButton(
                    buttonColor: Colors.greenAccent.shade400,
                    text: "=",
                    onPressed: () {
                      setState(() {
                        screenText = _initializeExtractor(screenText);
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
