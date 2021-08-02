import 'package:flutter/material.dart';
import 'constants.dart';

class BottomContainer extends StatelessWidget {
  // ignore: non_constant_identifier_names
  BottomContainer({@required this.BottomBarText});

  // ignore: non_constant_identifier_names
  final String BottomBarText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(BottomBarText,style: kIconCalculateStyle),),
      padding: EdgeInsets.only(bottom: 10.0),
      color: kBottomContainerColor,
      height: kBottomContainerHeight,
      width: double.infinity,
    );
  }
}