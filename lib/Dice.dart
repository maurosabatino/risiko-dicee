import 'dart:math';

class Dice{
  DiceType type;
  int number;


  Dice( DiceType type){
    this.type = type;
    number = Random().nextInt(6)+1;
  }

}

enum DiceType{
  attack,defense
}