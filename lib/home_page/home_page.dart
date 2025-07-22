import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double selectedWeight = 70;

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
                  child: ShadowContainer(
                    // containerHeight: 220,
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
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: RoundedButton(
                                    childIcon: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.blueAccent,
                                )),
                              ),
                              Expanded(
                                child: RoundedButton(
                                    childIcon: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.blueAccent,
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
                      SizedBox(height: 5),
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
                      Text('Height ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('cm'),
                    ],
                  ),
                  RotatedBox(
                      quarterTurns: 2,
                      child: Image.asset(
                        'assets/images/meter icon.png',
                      )),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12)),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: ListWheelScrollView.useDelegate(
                          physics: FixedExtentScrollPhysics(),
                          itemExtent: 70,
                          magnification: 1.5,
                          useMagnifier: true,
                          childDelegate: ListWheelChildBuilderDelegate(
                              childCount: 101,
                              builder: (context, index) {
                                return RotatedBox(
                                    quarterTurns: 3,
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
                    Text('Weight ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('kg'),
                  ],
                ),
                Text(
                  selectedWeight.toInt().toString(),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: Slider(
                      min: 20,
                      max: 150,
                      activeColor: Colors.blueAccent,
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
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    required this.containerChild,
    this.containerHeight,
    super.key,
  });

  final Widget containerChild;
  final double? containerHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
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
