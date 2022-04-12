import 'dart:math';

class calculatorBrain {
  final int height;
  final int weight;
  double _bmi;

  calculatorBrain({this.height, this.weight});

  String calculateBMI () {
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult () {
    if(_bmi >= 25){
      return "OVERWIGHT";
    } else if (_bmi>18.5){
      return "NORMAL";
    } else{
      return"UNDERWEIGHT";
    }
  }

  String getInterpretation (){

    if(_bmi >= 25){
      return "You are a Fat Ass";
    }
    else if (_bmi>18.5){
      return "Well Done m8";
    }
    else{
      return"Your are like Stick, GET SOME FOOD!";
    }
  }
}