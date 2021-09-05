import 'dart:math';
import 'package:easy_localization/easy_localization.dart';

class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult (){
    if(_bmi > 25){
      return "resultOver".tr().toString();
    }else if(_bmi > 18.5){
      return "resultNo".tr().toString();
    }else{
      return "resultUnder".tr().toString();
    }
  }

  String getAdvices(){
    if(_bmi > 25){
      return "resultBodyOver".tr().toString();
    }else if(_bmi > 18.5){
      return "resultBodyNo".tr().toString();
    }else{
      return "resultBodyUnder".tr().toString();
    }
  }
}