import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'input_page.dart';
import 'icon_widget.dart';

class resultPage extends StatelessWidget {

  resultPage({this.BMI, this.result, this.interpretation});

  final String BMI;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text("Your Result"),
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
      ),
    body: Column (
    children: [
      Expanded(child: ReusableCard(color: boxColorInActive,
      reusableCardChild: Column (
        mainAxisAlignment: MainAxisAlignment.strech,
        children: [
          Text(
            result,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            BMI,
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            interpretation,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),)),

      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          child: Center(
            child: Text(
              "RE - CALCULATE",
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
