import 'package:flutter/material.dart';


class DiceWidget extends StatefulWidget {
  int diceNumber = 1;

  DiceWidget({Key key,this.diceNumber}) : super(key: key);

  @override
  _DiceWidgetState createState() => _DiceWidgetState();

  void setDiceNumber(int number) {
    if(number!=null)
    _DiceWidgetState().setDiceNumber(number);

  }
}

class _DiceWidgetState extends State<DiceWidget> {
  int diceNumber;
  @override
  Widget build(BuildContext context) {
    if(widget.diceNumber != null){
      print(diceNumber);
      diceNumber = widget.diceNumber;
    }
    else diceNumber = 1;

    return Expanded(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset('images/dice$diceNumber.png')),
    );
  }

  void setDiceNumber(int number){
    setState(() {
      diceNumber = number;
    });
  }
}