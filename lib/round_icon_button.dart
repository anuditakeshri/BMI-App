import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon,@required this.updateValue});
  final IconData icon;
  final Function updateValue;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: updateValue,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      child: Icon(icon),
    );
  }
}
