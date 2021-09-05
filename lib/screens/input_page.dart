import 'package:flutter/material.dart';
import '../components/resable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../languages.dart';
import 'result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import '../components/round_icon_buttom.dart';
import 'package:bmi_calculator/calculator_brian.dart';
import 'package:easy_localization/easy_localization.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}



class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  void _changeLanguage(Language language) {
    if(language.languageCode == "en"){
      context.locale = Locale('en', 'US');
    }
    if(language.languageCode == "ar"){
      context.locale = Locale('ar', 'SA');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgprimaryColor,
        centerTitle: true,
        title: Text("appBar".tr().toString()),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton(
              dropdownColor: Colors.transparent,
              onChanged:(Language language){
                _changeLanguage(language);
              },
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: Language.languageList().map<DropdownMenuItem<Language>>(
                    (lang) =>
                    DropdownMenuItem(
                      value: lang,
                      child: Row(
                        children: [
                          Text(lang.flag),
                          Text(lang.name)
                        ],
                      ),
                    ),).toList(),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardChild: IconContent(
                          icons: FontAwesomeIcons.mars,
                          label: "male".tr().toString()),
                      colour: selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                          icons: FontAwesomeIcons.venus, label: "female".tr().toString()),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "height".tr().toString(),
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      Text(
                        "cm".tr().toString(),
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      // activeTickMarkColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 32),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "weight".tr().toString(),
                            style: labelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "age".tr().toString(),
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          BottomButton(
            buttonTitle: "calButton".tr().toString(),
            onTap: () {
              CalculatorBrain calc =
              CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ResultPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            adviser: calc.getAdvices(),
                          )));
            },
          ),
        ],
      ),
    );
  }

}
