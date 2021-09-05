import 'package:bmi_calculator/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:lottie/lottie.dart';
import 'constants.dart';
import 'package:easy_localization/easy_localization.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // final text = MediaQuery.of(context).platformBrightness == Brightness.dark ? 'DarkTheme' : 'LightTheme';
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "onboardingOneTitle".tr().toString(),
          body: "onboardingOneDes".tr().toString(),
          image: Lottie.asset('assets/animation/healthyjunkfood.json'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "onboardingTwoTitle".tr().toString(),
          body: "onboardingTwoDes".tr().toString(),
          image: Lottie.asset('assets/animation/fruitbasket.json'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "onboardingThreeTitle".tr().toString(),
          body: "onboardingThreeDes".tr().toString(),
          image: Lottie.asset('assets/animation/heartbeat.json'),
          decoration: getPageDecoration(),
        ),
      ],
      done: Text( "onboardingStart".tr().toString(), style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: Text("onboardingSkip".tr().toString(),style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
      onSkip: () => goToHome(context),
      next: Icon(Icons.arrow_forward, color: bottomContColor,),
      dotsDecorator: getDotDecoration(),
      onChange: (index) => print('Page $index selected'),
      globalBackgroundColor: activeCardColor,
      skipFlex: 0,
      nextFlex: 0,
      // isProgressTap: false,
      // isProgress: false,
      // showNextButton: false,
      // freeze: true,
      // animationDuration: 1000,
    );
}

  void goToHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => InputPage()),
  );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: greyDescribeText,
    activeColor: bottomContColor,
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(color: bottomContColor, fontSize: 28, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20),
    descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
    imagePadding: EdgeInsets.all(24),
    pageColor: inactiveCardColor,
  );
}