import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'resuable_card.dart';
import 'bottom_container.dart';
import 'calculator_brain.dart';

class ResultPage extends StatelessWidget {

  ResultPage({this.bmiText,this.bmiResult,this.bmiInterpretation});

  final String bmiResult;
  final String bmiText;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
          child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result',
              style: kIconResultTitle,),
          ),
          ),
          Expanded(
            flex: 5,
          child: ResuableCard(
            colour: kActiveContainerColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(bmiText.toUpperCase(),style: kIconResultTextStyle,),
                Text(bmiResult,style: kIconResultCalculated,),
                Text(bmiInterpretation, style: kBMIBodyText,textAlign: TextAlign.center,),
              ],
            ),
          ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: BottomContainer(BottomBarText: 'RE-CALCULATE',)
          ),
        ],
      )
    );
  }
}
