import 'package:bmi_app/bmi_calculator.dart';
import 'package:bmi_app/components/buttom_button.dart';
import 'package:bmi_app/components/rounded_button.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../components/shadow_container.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double selectedWeight = 70;
  int selectedAge = 20;
  int selectedHeight = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Age and Gender
          Expanded(
            flex: 4,
            child: Row(
              children: [
                //Age
                Expanded(
                  flex: 1,
                  child: ShadowContainer(
                    // containerHeight: 220,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kHeadingTextStyle,
                        ),
                        Text(
                          selectedAge.toString(),
                          style: kNumberTextStyle,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: RoundedButton(
                                    onTap: () {
                                      selectedAge++;
                                      setState(() {});
                                    },
                                    childIcon: Icon(
                                      FontAwesomeIcons.plus,
                                      color: kThemeColor,
                                    )),
                              ),
                              Expanded(
                                child: RoundedButton(
                                    onTap: () {
                                      selectedAge--;
                                      selectedAge < 1
                                          ? selectedAge = 1
                                          : selectedAge--;
                                      setState(() {});
                                    },
                                    childIcon: Icon(
                                      FontAwesomeIcons.minus,
                                      color: kThemeColor,
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //Gender
                Expanded(
                  child: ShadowContainer(
                      // containerHeight: 220,
                      containerChild: Column(
                    children: [
                      Text(
                        'Gender',
                        style: kHeadingTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.man,
                            size: 70,
                          ),
                          Icon(
                            Icons.woman,
                            size: 70,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      LiteRollingSwitch(
                        textOff: 'Male',
                        textOn: 'Female',
                        textOnColor: Colors.white,
                        iconOff: Icons.check,
                        colorOff: kThemeColor,
                        colorOn: kThemeColor,
                        onTap: () {},
                        onDoubleTap: () {},
                        onSwipe: () {},
                        onChanged: (value) {},
                      )
                    ],
                  )),
                ),
              ],
            ),
          ),

          //Height
          Expanded(
            flex: 4,
            child: ShadowContainer(
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height ', style: kHeadingTextStyle),
                      Text('cm', style: kSubHeadingTextStyle),
                    ],
                  ),
                  RotatedBox(
                      quarterTurns: 2,
                      child: Image.asset(
                        'assets/images/meter icon.png',
                      )),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: kThemeColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: ListWheelScrollView.useDelegate(
                          physics: FixedExtentScrollPhysics(),
                          itemExtent: 70,
                          magnification: 1.5,
                          useMagnifier: true,
                          onSelectedItemChanged: (height) {
                            selectedHeight = height + 120;
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                              childCount: 101,
                              builder: (context, index) {
                                return RotatedBox(
                                    quarterTurns: 1,
                                    child: Center(
                                      child: Text(
                                        '${index + 120}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20),
                                      ),
                                    ));
                              })),
                    ),
                  )
                ],
              ),
            ),
          ),

          //Weight
          Expanded(
            flex: 3,
            child: ShadowContainer(
                // containerHeight: 100,
                containerChild: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Weight ', style: kHeadingTextStyle),
                    Text('kg', style: kSubHeadingTextStyle),
                  ],
                ),
                Text(
                  selectedWeight.toInt().toString(),
                  style: kNumberTextStyle,
                ),
                Expanded(
                  child: Slider(
                      min: 20,
                      max: 150,
                      activeColor: kThemeColor,
                      value: selectedWeight,
                      onChanged: (weight) {
                        setState(() {
                          selectedWeight = weight;
                        });
                      }),
                )
              ],
            )),
          ),

          //Calculate
          ButtomButton(
            title: 'Calculate',
            onTap: () {
              BMICalculator bmiCalculator =
                  BMICalculator(height: selectedHeight, weight: selectedWeight);

              String calculatedBmi = bmiCalculator.calculateBMI();

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(bmiResult: calculatedBmi);
              }));
            },
          ),
        ],
      ),
    );
  }
}
