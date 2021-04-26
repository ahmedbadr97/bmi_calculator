import 'package:bmi_calculator/calculator_brain.dart';
import 'results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/screen_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/buttom_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 80;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  //Male Card
                  Expanded(
                      child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : KinActiveCardColor,
                    cardChild: IconContent(FontAwesomeIcons.mars, "MALE"),
                    gestureAction: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  )),
                  //Female Card
                  Expanded(
                      child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : KinActiveCardColor,
                    cardChild: IconContent(FontAwesomeIcons.venus, "FEMALE"),
                    gestureAction: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ))
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: kLableTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            "cm",
                            style: kLableTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Color(0xFFFFFFFF),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 16),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          overlayColor: Color(0x29EB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double v) {
                            setState(() {
                              height = v.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                )),
              ],
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLableTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    if (weight > 5) weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLableTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  if (age > 2) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  if (age < 120) age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            BottomButton(
              onTab: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              calculatorBrain: CalculatorBrain(height, weight),
                            )));
              },
              text: "CALCULATE",
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  RoundIconButton(
      {@required this.icon, @required this.onpressed, this.onLongPress});
  final Function onpressed, onLongPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      onLongPress: onLongPress,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 10,
    );
  }
}
