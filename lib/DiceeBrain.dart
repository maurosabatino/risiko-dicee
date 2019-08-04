import 'package:dicee/DiceWidget.dart';
import 'package:flutter/material.dart';

import 'Dice.dart';

class DiceeBrain {
  int _numerOfDice = 0;
  var _diceeAttack = <Dice>[];
  List<DiceWidget> _diceeAttackWidget = [];
  var _diceeDefense = <Dice>[];
  List<DiceWidget> _diceeDefenseWidget = [];
  List<bool> _result = [];
  List<Icon> scoreKeeper = [];

  void prepareAttack(int numerOfDice) {
    removeLastGame();
    _numerOfDice = numerOfDice;
    for (var i = 0; i < _numerOfDice; ++i) {
      _diceeAttack.add(new Dice(DiceType.attack));
      _diceeAttackWidget.add(new DiceWidget(
        diceNumber: _diceeAttack[i].number,
      ));
    }
    for (var i = 0; i < _numerOfDice; ++i) {
      _diceeDefense.add(new Dice(DiceType.defense));
      _diceeDefenseWidget.add((new DiceWidget(
        diceNumber: _diceeDefense[i].number,
      )));
    }
    checkWinner();
  }

  void checkWinner() {
    for (var i = 0; i < _numerOfDice; ++i) {
      if (_diceeAttack[i].number <= _diceeDefense[i].number) {
        _result.add(false);
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      } else {
        _result.add(true);
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      }
    }
  }
  
  int getscore(DiceType diceType){
    int result= 0;
    switch(diceType){
      case DiceType.attack:
        for (var i = 0; i < _result.length; ++i) {
          if(_result[i] == true)
            result++;
        }
        return result;
        break;
      case DiceType.defense:
        for (var i = 0; i < _result.length; ++i) {
          if(_result[i] == false)
            result++;
        }
        return result;
        break;
    }
  }

  List<DiceWidget> getDiceWidget(DiceType diceType) {
    switch (diceType) {
      case DiceType.attack:
        return _diceeAttackWidget;
        break;
      case DiceType.defense:
        return _diceeDefenseWidget;
        break;
    }
  }

  List<Icon> getResultBattle() {
    return scoreKeeper;
  }

  void removeLastGame() {
    _numerOfDice = 0;
    _diceeAttack = <Dice>[];
    _diceeAttackWidget = [];
    _diceeDefense = <Dice>[];
    _diceeDefenseWidget = [];
    _result = [];
    scoreKeeper = [];
  }
}
