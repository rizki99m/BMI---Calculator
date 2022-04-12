import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_widget.dart';
import 'reusable_card.dart';
import 'result_page.dart';
import 'functionality.dart';

const boxColorActive = Color(0xFF1D1E33);
const boxColorInActive = Color(0xFF111328);
enum Gender {male,female}


class InputPage extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = boxColorInActive;
  Color femaleCardColor = boxColorInActive;
  int height = 180;
  int weight = 60;
  int age = 19;


  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                        color: selectedGender == Gender.male? boxColorActive : boxColorInActive ,
                      reusableCardChild: IconWidget(icon: FontAwesomeIcons.mars, text: "MALE")),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                        color: selectedGender == Gender.female? boxColorActive : boxColorInActive,
                    reusableCardChild: IconWidget(icon: FontAwesomeIcons.venus, text: "FEMALE")),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
               color: boxColorInActive,
                reusableCardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: textStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: WtextStyle,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "cm",
                          style: textStyle ,
                        )
                      ],
                    ),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value : height.toDouble(),
                        min: 120,
                        max : 220,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(color: boxColorInActive,
                    reusableCardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: textStyle,
                        ),
                        Text(
                         weight.toString(),
                          style: WtextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon : FontAwesomeIcons.plus,
                              set: () {
                                  setState(() {
                                    weight++;
                                  });
                              }
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                                set: () {
                                  setState(() {
                                    weight--;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                    )),
                Expanded(
                    child: ReusableCard(color: boxColorInActive,
                      reusableCardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: textStyle,
                          ),
                          Text(
                            age.toString(),
                            style: WtextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                  set: () {
                                    setState(() {
                                      age++;
                                    });
                                  }
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                  set: () {
                                    setState(() {
                                      age--;
                                    });
                                  }
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {

              calculatorBrain calc = calculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => resultPage(
                BMI: calc.calculateBMI(), result: calc.getResult(), interpretation: calc.getInterpretation(),
              )),

              );
            },
            child: Container(
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: LtextStyle,
                ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 70,
            ),
          ),
        ],
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function set;

  RoundIconButton({this.icon, this.set});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: set,
      child: Icon(
          icon
      ),
    );
  }
}





