import 'dart:math';
import 'package:dicee/Dice.dart';
import 'package:dicee/DiceeBrain.dart';
import 'package:flutter/material.dart';


DiceeBrain diceeBrain = DiceeBrain();
void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen[900],
        appBar: AppBar(
          title: Text('Battle'),
          backgroundColor: Colors.lightGreen[900],
        ),
        body: DicePage(),
      ),
    ),
  );
}



class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {


  void startBattle(int numberOfAttackDice){
    setState(() {
      diceeBrain.prepareAttack(numberOfAttackDice);
    });

  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Attack '+diceeBrain.getscore(DiceType.attack).toString()),
          Row(
            children: diceeBrain.getDiceWidget(DiceType.attack)
          ),
          Text('Defense '+diceeBrain.getscore(DiceType.defense).toString()),
          Row(
            children: diceeBrain.getDiceWidget(DiceType.defense),
          ),
          Row(
            children: diceeBrain.getResultBattle(),
          ),
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                RaisedButton(

                  onPressed: () {
                    startBattle(3);
                  },
                  child: Text(
                    'Battaglia',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

