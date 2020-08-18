import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Calculator',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),),
      ),
      body: CalciApp(),
    ),
  ));
}

class CalciApp extends StatefulWidget {
  @override
  _CalciAppState createState() => _CalciAppState();
}

class _CalciAppState extends State<CalciApp> {
  String output1="0";
  double num1=0.0;
  double num2=0.0;
  String output2="0";
  String operand="";

  buttonPressed(String buttonText){
    if(buttonText=='CLEAR'){
       num1=0.0;
       num2=0.0;
       output2="0";
       operand="";
    }
    else if(buttonText=='+'||buttonText=='-'||buttonText=='*'||buttonText=='/'){
      operand=buttonText;
      output2="0";
      num1=double.parse(output1);
    }
    else if(buttonText=='.'){
      if(output2.contains('.')){
        print('Already contains decimals');
        return;
      }
      else{
        output2+=buttonText;
      }
    }
    else if(buttonText=='='){
      num2=double.parse(output1);
      if(operand=='+'){
        output2=(num1+num2).toString();
      }
      if(operand=='-'){
        output2=(num1-num2).toString();
      }
      if(operand=='*'){
        output2=(num1*num2).toString();
      }
      if(operand=='/'){
        output2=(num1/num2).toString();
      }
      num1=0.0;
      num2=0.0;
      operand="";
    }
    else{
      output2=output2+buttonText;
    }
    print(output2);
    setState(() {
      output1=double.parse(output2).toStringAsFixed(2);
    });
  }

 Widget buildButton(String buttonText){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        color: Colors.black,
        child: Text('$buttonText',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        onPressed: ()=>buttonPressed(buttonText),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.black,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
              child: Text('$output1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),
          
          Column(children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ],
              ),
            Row(
              children: <Widget>[
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('*'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('+'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('0'),
                buildButton('.'),
                buildButton('='),
                buildButton('-'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('CLEAR')
              ],
            )
          ],

          ),
        ],
      ),
    );
  }
}
