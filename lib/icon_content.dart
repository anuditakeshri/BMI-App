import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.boxIcon, this.iconText});

  final IconData boxIcon;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(boxIcon, size: 80.0,),
        SizedBox(
          height: 15.0,
        ),
        Text(iconText,style: kIconTextStyle,)
      ],
    );
  }
}