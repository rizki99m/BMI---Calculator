import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

  final Widget reusableCardChild;
  final Color color;
  ReusableCard({@required this.color, this.reusableCardChild});

  @override
  Widget build(BuildContext context) {
    return Container (
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      margin : EdgeInsets.all(15),
      child: reusableCardChild,
    );
  }
}