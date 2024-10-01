import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = '0';
  String _input = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
        _input = '';
        _num1 = 0;
        _num2 = 0;
        _operator = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        _num1 = double.parse(_input);
        _operator = buttonText;
        _input = '';
      } else if (buttonText == '=') {
        _num2 = double.parse(_input);
        switch (_operator) {
          case '+':
            _output = (_num1 + _num2).toString();
            break;
          case '-':
            _output = (_num1 - _num2).toString();
            break;
          case '*':
            _output = (_num1 * _num2).toString();
            break;
          case '/':
            _output = (_num1 / _num2).toString();
            break;
        }
        _input = _output;
      } else {
        _input += buttonText;
        _output = _input;
      }
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Divider()),
          Column(children: [
            Row(children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/')
            ]),
            Row(children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*')
            ]),
            Row(children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-')
            ]),
            Row(children: [
              buildButton('C'),
              buildButton('0'),
              buildButton('='),
              buildButton('+')
            ]),
          ])
        ],
      ),
    );
  }
}
