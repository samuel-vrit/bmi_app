import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.childIcon,
    this.onTap,
    super.key,
  });

  final Widget childIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      shape: CircleBorder(),
      fillColor: Colors.white,
      elevation: 2,
      child: childIcon,
    );
  }
}
