import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import './button.dart';

class CalcBody extends StatefulWidget {
  final isDarkTheme;

  CalcBody(this.isDarkTheme);

  @override
  _CalcBodyState createState() => _CalcBodyState();
}

class _CalcBodyState extends State<CalcBody> {
  String _expressions = "";

  String _history = "";

  void changeExp(String text) {
    setState(() {
      _expressions += text;
    });
  }

  void removeLetter() {
    setState(() {
      if (_expressions.length > 0 && !(_expressions.contains("="))) {
        _expressions = _expressions.substring(0, _expressions.length - 1);
      }
    });
  }

  void evaluate(String text) {
    setState(() {
      if (_expressions.contains("=")) {
        _expressions = _expressions.substring(1, _expressions.length);
      }
      Parser p = Parser();
      Expression exp = p.parse(_expressions);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      _history = _expressions;
      _expressions = "= ${eval.toString()}";
    });
  }

  void clear(String text) {
    setState(() {
      _expressions = "";
      _history = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          _history,
          style: TextStyle(fontSize: 22, color: Colors.grey),
        ),
        FittedBox(
          child: Text(
            (_expressions != "") ? _expressions : " ",
            style: TextStyle(
              fontSize: 50,
              color: (widget.isDarkTheme) ? Colors.white : Colors.black,
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button(
              text: "C",
              textColor: Theme.of(context).accentColor,
              func: clear,
            ),
            Button(
              icon: Icons.backspace_outlined,
              textColor: Theme.of(context).accentColor,
              func: removeLetter,
            ),
            Button(
              text: "%",
              textColor: Theme.of(context).accentColor,
              func: changeExp,
            ),
            Button(
              text: "/",
              textColor: Theme.of(context).accentColor,
              func: changeExp,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button(
              text: "7",
              textColor: Theme.of(context).primaryColor,
              func: changeExp,
            ),
            Button(
              text: "8",
              textColor: Theme.of(context).primaryColor,
              func: changeExp,
            ),
            Button(
              text: "9",
              textColor: Theme.of(context).primaryColor,
              func: changeExp,
            ),
            Button(
              text: "*",
              textColor: Theme.of(context).accentColor,
              func: changeExp,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button(
              text: "4",
              textColor: Theme.of(context).primaryColor,
              func: changeExp,
            ),
            Button(
              text: "5",
              textColor: Theme.of(context).primaryColor,
              func: changeExp,
            ),
            Button(
              text: "6",
              textColor: Theme.of(context).primaryColor,
              func: changeExp,
            ),
            Button(
              text: "-",
              textColor: Theme.of(context).accentColor,
              func: changeExp,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button(
              text: "1",
              textColor: Theme.of(context).primaryColor,
              func: changeExp,
            ),
            Button(
              text: "2",
              textColor: Theme.of(context).primaryColor,
              func: changeExp,
            ),
            Button(
              text: "3",
              textColor: Theme.of(context).primaryColor,
              func: changeExp,
            ),
            Button(
              text: "+",
              textColor: Theme.of(context).accentColor,
              func: changeExp,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button(
              text: ".",
              textColor: Theme.of(context).primaryColor,
              func: changeExp,
            ),
            Button(
              text: "0",
              textColor: Theme.of(context).primaryColor,
              func: changeExp,
            ),
            Button(
              text: "00",
              textColor: Theme.of(context).primaryColor,
              func: changeExp,
            ),
            Button(
              text: "=",
              bgColor: Theme.of(context).accentColor,
              func: evaluate,
              textColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
