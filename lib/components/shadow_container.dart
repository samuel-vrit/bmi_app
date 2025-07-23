import 'package:flutter/material.dart';

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
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
