import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  ButtonCustom(
      {super.key,
      required this.width,
      this.height,
      this.color,
      required this.child,
      required this.onTap});
  final double width;
  double? height = 45;
  Color? color;
  final Widget child;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Center(child: child),
      ),
    );
  }
}
