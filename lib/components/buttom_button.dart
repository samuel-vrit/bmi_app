import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class ButtomButton extends StatelessWidget {
  ButtomButton({
    this.title = '',
    this.onTap,
    super.key,
  });

  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kThemeColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
