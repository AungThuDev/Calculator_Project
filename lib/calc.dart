import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'maindrawer.dart';

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String equation ="0";
  String result="0";
  String expression="";
  double equationFontSize=38.0;
  double resultFontSize=48.0;

  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C"){
        equation="0";
        result="0";
        equationFontSize=38.0;
        resultFontSize=48.0;
      }

      else if(buttonText == "⌫"){
        equationFontSize=48.0;
        resultFontSize=38.0;
        equation=equation.substring(0,equation.length-1);
        if(equation==""){
          equation="0";
        }
      }

      else if(buttonText== "="){
        equationFontSize=38.0;
        resultFontSize=48.0;

        expression=equation;
        expression=expression.replaceAll("×", "*");
        expression=expression.replaceAll("÷", "/");
        expression=expression.replaceAll("π", '3.1415926535897932');
        expression=expression.replaceAll("√", 'sqrt');
        expression=expression.replaceAll("X^", '^');
        expression=expression.replaceAll("e", 'e^1');
        expression=expression.replaceAll("lg", 'log');
        expression=expression.replaceAll("asin", 'arcsin');
        expression=expression.replaceAll("acos", 'arccos');
        expression=expression.replaceAll("atan", 'arctan');


        try{
          Parser p=new Parser();
          Expression exp=p.parse(expression);

          ContextModel cm=ContextModel();
          result='${exp.evaluate(EvaluationType.REAL,cm)}';
        }catch(e){
          result="Error";
        }
      }

      else{
        equationFontSize=38.0;
        resultFontSize=48.0;
        if(equation=="0"){
          equation=buttonText;
        }else{
          equation=equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText,double buttonHeight,Color? buttonColor,Color? textColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(10.0),
                side: BorderSide(
                    color: Colors.grey, width: 0.5, style: BorderStyle.solid),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0.0)))),
            onPressed: () => buttonPressed(buttonText),
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.normal,
                color: textColor,
              ),
            )) 
    );
  }
  
  Widget portrait(){
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Text(
            equation,
            style: TextStyle(fontSize: equationFontSize,color: Colors.white),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Text(
            result,
            style: TextStyle(fontSize: resultFontSize,color: Colors.white),
          ),
        ),
        Expanded(child: Divider()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Table(
                children: [
                  TableRow(
                    children: [
                      buildButton("lg", 0.85, Colors.grey[900],Colors.yellow[600]),
                      buildButton("ln", 0.85, Colors.grey[900],Colors.yellow[600]),
                      buildButton("asin", 0.85, Colors.grey[900],Colors.yellow[600]),
                      buildButton("acos", 0.85, Colors.grey[900],Colors.yellow[600]),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("(", 0.85, Colors.grey[900],Colors.yellow[600]),
                      buildButton(")", 0.85, Colors.grey[900],Colors.yellow[600]),
                      buildButton("sin", 0.85, Colors.grey[900],Colors.yellow[600]),
                      buildButton("cos", 0.85, Colors.grey[900],Colors.yellow[600]),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("ln2", 0.85, Colors.black54,Colors.white),
                      buildButton("C", 0.85, Colors.black54,Colors.white),
                      buildButton("⌫", 0.85, Colors.black54,Colors.white),
                      buildButton("%", 0.85, Colors.black54,Colors.white),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("X^", 0.85, Colors.black54,Colors.white),
                      buildButton("7", 0.85, Colors.black54,Colors.white),
                      buildButton("8", 0.85, Colors.black54,Colors.white),
                      buildButton("9", 0.85, Colors.black54,Colors.white),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("√", 0.85, Colors.black54,Colors.white),
                      buildButton("4", 0.85, Colors.black54,Colors.white),
                      buildButton("5", 0.85, Colors.black54,Colors.white),
                      buildButton("6", 0.85, Colors.black54,Colors.white),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("π", 0.85, Colors.black54,Colors.white),
                      buildButton("1", 0.85, Colors.black54,Colors.white),
                      buildButton("2", 0.85, Colors.black54,Colors.white),
                      buildButton("3", 0.85, Colors.black54,Colors.white),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("e", 0.85, Colors.black54,Colors.white),
                      buildButton("0", 0.85, Colors.black54,Colors.white),
                      buildButton(".", 0.85, Colors.black54,Colors.white),
                      buildButton("+", 0.85, Colors.black54,Colors.white),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*.2,
              child: Table(
                children: [
                  TableRow(
                    children: [
                      buildButton("atan", 0.85, Colors.grey[900],Colors.yellow[600]),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("tan", 0.85, Colors.grey[900],Colors.yellow[600]),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("÷", 0.85, Colors.grey[900],Colors.yellow[600]),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("×", 0.85, Colors.grey[900],Colors.yellow[600]),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("-", 0.85, Colors.grey[900],Colors.yellow[600]),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("=", 1.7, Colors.yellow[600],Colors.grey[600]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget landscape(){
    return Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(left:10, top:10, bottom:5, right:50),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize,color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(left:10,top: 10,bottom: 5,right: 50),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize,color: Colors.white),
            ),
          ),
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("lg", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("ln", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("asin", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("(", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton(")", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("sin", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("cos", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("ln2", 1.1, Colors.black54,Colors.white),
                        buildButton("C", 1.1, Colors.black54,Colors.white),
                        buildButton("⌫", 1.1, Colors.black54,Colors.white),
                        buildButton("%", 1.1, Colors.black54,Colors.white),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("X^", 1.1, Colors.black54,Colors.white),
                        buildButton("7", 1.1, Colors.black54,Colors.white),
                        buildButton("8", 1.1, Colors.black54,Colors.white),
                        buildButton("9", 1.1, Colors.black54,Colors.white),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("X^", 1.1, Colors.black54,Colors.white),
                        buildButton("7", 1.1, Colors.black54,Colors.white),
                        buildButton("8", 1.1, Colors.black54,Colors.white),
                        buildButton("9", 1.1, Colors.black54,Colors.white),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("acos", 1.1, Colors.grey[900],Colors.blue[800]),
                        buildButton("=", 1.1, Colors.blue,Colors.white),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("Scientific Calculator",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: OrientationBuilder(
        builder: (context,orientation){
          if(orientation == Orientation.portrait){
            return portrait();
          }else{
            return landscape();
          }
        },
      ),
    ); 
  }
}




