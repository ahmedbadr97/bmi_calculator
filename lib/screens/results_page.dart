import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/screen_card.dart';
import 'package:bmi_calculator/components/buttom_button.dart';
import 'input_screen.dart';

class ResultsPage extends StatelessWidget {
  final CalculatorBrain calculatorBrain;
  final String result = "overWeight";
  final double weight = 20;

  const ResultsPage({this.calculatorBrain});

  //ResultsPage({this.result})
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kTilteTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      calculatorBrain.getResult(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      calculatorBrain.getBmi(),
                      style: kBMITextStyle,
                    ),
                    Text(
                      calculatorBrain.getInterpretaion(),
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    BottomButton(
                      onTab: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InputPage()));
                      },
                      text: "RE-CALCULATE",
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
