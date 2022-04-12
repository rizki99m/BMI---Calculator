import 'package:flutter/material.dart';

const textStyle = TextStyle(
fontSize: 18,
color: Color(0xFF8d8E98),
);

const WtextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);

const LtextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold
);
class IconWidget extends StatelessWidget {

  final String text;
  final IconData icon;

  IconWidget({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(text,
          style: textStyle
          ),
      ],
    );
  }
}
