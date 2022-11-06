import 'package:flutter/material.dart';
import '../models/BMI_arguments.dart';
import '../screens/result_screen.dart';
import '../utils/BMI_Calculator.dart';

class MyHomePage extends StatefulWidget {
  static const id = "/home";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double hv = 150;
  double wv = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Slider(
            value: hv,
            min: 100,
            max: 300,
            onChanged: (value) {
              setState(() {
                hv = value;
              });
            },
          ),
          SizedBox(
            height: 32,
          ),
          Slider(
            value: wv,
            min: 40,
            max: 150,
            onChanged: (value) {
              setState(() {
                wv = value;
              });
            },
          ),
          SizedBox(
            height: 32,
          ),
          ElevatedButton(
              onPressed: () {
                BMICalculatorBrain bc =
                    BMICalculatorBrain(height: hv.toInt(), weight: wv.toInt());
                var bmi = bc.calculateBMI();
                var res = bc.getResult();
                var inter = bc.getInterpretation();
                Navigator.of(context).pushNamed(ResultsPage.id,
                    arguments: BMIArguments(
                        bmi: bmi, interpretation: inter, bmiResult: res));
              },
              child: Text("Calculate"))
        ],
      ),
    );
  }
}
