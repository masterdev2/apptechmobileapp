import 'package:flutter/material.dart';

///  text: "Log in",
///  colorEnd: gradientEnd,
///  colorStart: gradientStart,
///
///  text: "Imperial plus",
///  colorEnd: Color(0xffbbbbbb),
///  colorStart: Color(0xffaaaaaa),
///
///  text: "Facebook",
///  colorEnd: Color(0xff0042b0),
///  colorStart: Color(0xff1153c1),
///
///  text: "Linked in",
///  colorEnd: Color(0xff1f7abb),
///  colorStart: Color(0xff208bcc),
class GradientButton extends StatelessWidget {
  final String text;
  final Color colorStart;
  final Color colorEnd;
  final VoidCallback onPressed;

  GradientButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.colorStart,
    @required this.colorEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        gradient: LinearGradient(
          colors: [colorStart, colorEnd],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: new InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: onPressed,
          child: Container(
            margin: EdgeInsets.all(16),
            child: Center(
              child: new Text(
                text,
                style: TextStyle(color: Color(0xff21346f), fontSize: 20.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
