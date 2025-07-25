import 'package:bmi_app/components/buttom_button.dart';
import 'package:bmi_app/components/shadow_container.dart';
import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({required this.bmiResult, super.key});

  final String bmiResult;

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Center(
                child: Text(
              'Your Result',
              style: kHeadingTextStyle.copyWith(fontSize: 30),
            )),
            SizedBox(height: 20),
            Expanded(
              child: ShadowContainer(
                containerChild: Column(
                  children: [
                    Text(
                      'Normal',
                      style: kHeadingTextStyle.copyWith(color: Colors.green),
                    ),
                    SizedBox(height: 150),
                    Text(
                      bmiResult,
                      style: kHeadingTextStyle.copyWith(
                          fontSize: 60, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 100),
                    Text(
                      'You have a normal body weight. Good job!',
                      style: kSubHeadingTextStyle.copyWith(
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            ButtomButton(
              title: 'Re-Calculate',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
