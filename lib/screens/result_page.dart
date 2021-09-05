import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import '../components/resable_card.dart';
import 'package:easy_localization/easy_localization.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.adviser,@required this.bmiResult, @required this.resultText});
  final String bmiResult;
  final String resultText;
  final String adviser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFF0A0E21),
        centerTitle: true,
        title: Text("appBar".tr().toString()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text(
                "resultHeader".tr().toString(),
                style: kTitleTextSyle,
              ),

            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText,style: kResultTextStyle,),
                  Text(bmiResult,style: kResultNumStyle,),
                  Text(adviser,
                    textAlign: TextAlign.center,
                    style: kResultBodyStyle,),
                ],
              ),
            ),
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttonTitle: "reCal".tr().toString())
        ],
      ),
    );
  }
}
