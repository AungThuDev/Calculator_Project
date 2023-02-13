import 'package:flutter/material.dart';


class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  var tcontroller1=TextEditingController();
  var tcontroller2=TextEditingController();
  var tcontroller3=TextEditingController();

  var result="Result";
  double BMI=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 10.0,),
              Text(
                "Your BMI will be calculated the following",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow[600]),
              ),
              SizedBox(height: 20.0,),
              Text1(),
              SizedBox(height: 20.0,),
              Text2(),
              SizedBox(height: 20.0,),
              Text3(),
              SizedBox(height: 20.0,),
              ElevatedButton(
        
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[600],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)
                  
                  )
    
                  )
                ),
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  // color: Colors.yellow[600],
                  // textColor: Colors.white,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Calculate BMI",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  ),
                  onPressed: _calculateBMI),
              SizedBox(height: 20.0,),
              Text("$BMI",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.yellow[600]),),
              SizedBox(height: 20.0,),
              Text(result,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.yellow[600]),),

            ],
          ),
        ),
      ),
    ); 
  }

  Widget Text1()
  {
    return TextField(
      controller: tcontroller1,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
          borderRadius: BorderRadius.all(Radius.circular(10.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        hintText: "Enter Weight",hintStyle: TextStyle(color:Colors.yellow[600]),
        labelText: "Enter Weight",labelStyle: TextStyle(color:Colors.yellow[600]),
      ),
    );
  }

  Widget Text2()
  {
    return TextField(
      controller: tcontroller2,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        hintText: "Enter Height(feet)",hintStyle: TextStyle(color:Colors.yellow[600]),
        labelText: "Enter Height(feet)",labelStyle: TextStyle(color:Colors.yellow[600]),
      ),
    );
  }

  Widget Text3()
  {
    return TextField(
      controller: tcontroller3,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        hintText: "Enter Height(inches)",hintStyle: TextStyle(color:Colors.yellow[600]),
        labelText: "Enter Height(inches)",labelStyle: TextStyle(color:Colors.yellow[600]),
      ),
    );
  }

  _calculateBMI()
  {
    var weight=double.parse(tcontroller1.text);
    var feet=double.parse(tcontroller2.text);
    var inch=double.parse(tcontroller3.text);

    var totalInches=(feet*12)+inch;
    var bmi=(weight*703)/(totalInches*totalInches);
    BMI=bmi;

    if(bmi<15){
      result="You are very severely underweight";
    }else if(bmi>=15 && bmi<16){
      result="You are severely underweight";
    }else if(bmi>=16 && bmi<18.5){
      result="You are underweight";
    }else if(bmi>=18.5 && bmi<25){
      result="You are Normal(Healthy) weight";
    }else if(bmi>=25 && bmi<30){
      result="You are overweight";
    }else if(bmi>=30 && bmi<35){
      result="You are Moderately obese";
    }else if(bmi>=35 && bmi<=40){
      result="You are Severely obese";
    }else{
      result="You are very severely obese";
    }

    setState(() {

    });
  }
}



