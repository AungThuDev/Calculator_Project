import 'package:calc/bmicalculator.dart';
import 'package:calc/calc.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.black38,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.black54,
                    //backgroundImage: AssetImage("assets/calculator.png"),
                  ),
                  SizedBox(height: 15.0,),
                  //Text("Scientific Calculator",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                  //SizedBox(height: 10.0,),
                  //Text("For Students",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                  //SizedBox(height: 20.0,),
                  ListTile(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                        return Calc();
                      }));
                    },
                    leading: Icon(Icons.calculate_sharp),
                    title: Text("Scientific Calculator"),
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                        return BmiCalculator();
                      }));
                    },
                    leading: Icon(Icons.science_sharp),
                    title: Text("BMI Calculator"),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      );
  }
}
