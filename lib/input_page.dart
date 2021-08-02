
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resuable_card.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'result_page.dart';
import 'bottom_container.dart';

enum GenderType {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveContainerColor;
  Color femaleCardColor = kInactiveContainerColor;
  GenderType gender;
  int height=180;
  int weight = 40;
  int age=1;


  // void updateCardColor( GenderType gender){
  //   if(gender==GenderType.male) {
  //     if (maleCardColor == inactiveContainerColor) {
  //           maleCardColor = activeContainerColor;
  //           femaleCardColor = inactiveContainerColor;
  //     }
  //     else {
  //         maleCardColor = inactiveContainerColor;
  //     }
  //   }
  //   if(gender==GenderType.female) {
  //     if (femaleCardColor == inactiveContainerColor) {
  //           femaleCardColor = activeContainerColor;
  //           maleCardColor = inactiveContainerColor;
  //     }
  //     else {
  //         femaleCardColor = inactiveContainerColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(
                  onPress:(){
                    setState(() {
                      gender = GenderType.male;
                    });
                  },
                  colour: maleCardColor = gender == GenderType.male? kActiveContainerColor:kInactiveContainerColor,
                  cardChild: IconContent(boxIcon: FontAwesomeIcons.mars,
                  iconText: 'MALE',),),
                ),
                Expanded(
                  child: ResuableCard(
                  onPress:(){
                    setState(() {
                      gender = GenderType.female;
                    });
                  },
                  colour: femaleCardColor = gender == GenderType.female? kActiveContainerColor:kInactiveContainerColor,
                  cardChild: IconContent(boxIcon: FontAwesomeIcons.venus,
                  iconText: 'FEMALE',),)
                ),
              ],
            ),
          ),
          Expanded(
              child:ResuableCard(colour: kActiveContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kIconTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),style: kIconNumberStyle,),
                      Text('cm',style:kIconTextStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: Color(0x29EB1555)
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),)
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(colour: kActiveContainerColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: kIconTextStyle,),
                      Text(weight.toString(),style: kIconNumberStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                          updateValue: (){
                            setState(() {
                              weight--;
                            });
                          },),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          updateValue: (){
                            setState(() {
                              weight++;
                            });
                          },)
                        ],
                      )
                    ],
                  ),)
                ),
                Expanded(
                  child: ResuableCard(colour: kActiveContainerColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',style: kIconTextStyle,),
                      Text(age.toString(),style: kIconNumberStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                          updateValue: (){
                            setState(() {
                              age--;
                            });
                          },),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          updateValue: (){
                            setState(() {
                              age++;
                            });
                          },)
                        ],
                      )
                    ],
                  ),)
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){

              CalculatorBrain cb = CalculatorBrain(height: height,weight: weight);
              String bmiresult = cb.calculatedBMI();
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                bmiText:cb.getResult(),
                bmiInterpretation:cb.getInterpretation(),
                bmiResult: bmiresult,
              ),),);
            },
            child: BottomContainer(BottomBarText: 'CALCULATE',),
          )
        ],
      )
    );
  }
}




