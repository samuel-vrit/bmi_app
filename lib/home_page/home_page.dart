import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              Container(
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
                child: Column(
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
                    SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () {},
                            shape: CircleBorder(),
                            // fillColor: Colors.white,
                            elevation: 2,
                            constraints: BoxConstraints(
                              minHeight: 30,
                              minWidth: 30,
                              maxHeight: 100,
                              maxWidth: 100,
                            ),
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.blue,
                            ),
                          ),
                          // SizedBox(width: 5),
                          RawMaterialButton(
                            padding: EdgeInsets.zero,
                            // constraints: BoxConstraints(
                            //   minHeight: 30,
                            //   minWidth: 30,
                            //   maxHeight: 100,
                            //   maxWidth: 100,
                            // ),
                            onPressed: () {},
                            shape: CircleBorder(),
                            // fillColor: Colors.white,
                            elevation: 2,
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
