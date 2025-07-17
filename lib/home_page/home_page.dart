import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          Row(
            children: [
              Expanded(
                child: ShadowContainer(
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '20',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(
                              childIcon: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.blueAccent,
                          )),
                          RoundedButton(
                              childIcon: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.blueAccent,
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ShadowContainer(
                    containerChild: Column(
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(fontWeight: FontWeight.w700),
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
                    LiteRollingSwitch(
                        textOff: 'Female',
                        textOn: 'Male',
                        textOnColor: Colors.white,
                        iconOff: Icons.check,
                        colorOff: Colors.blueAccent,
                        colorOn: Colors.blueAccent,
                        onTap: () {},
                        onDoubleTap: () {},
                        onSwipe: () {},
                        onChanged: (value) {})
                  ],
                )),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    required this.containerChild,
    super.key,
  });

  final Widget containerChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 5),
            blurRadius: 5,
            color: Colors.black26,
          )
        ],
        color: Colors.white,
      ),
      child: containerChild,
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.childIcon,
    super.key,
  });

  final Widget childIcon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      shape: CircleBorder(),
      fillColor: Colors.white,
      elevation: 2,
      child: childIcon,
    );
  }
}
