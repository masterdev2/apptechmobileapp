import 'package:flutter/material.dart';

///  controller: new TextEditingController(),
///
///  hintText: "E-Mail",
///  icon: Icons.email,
///  color: gradientEnd,
///
///  hintText: "Password",
///  obscureText: true,
///  icon: Icons.lock,
///  color: gradientEnd,
class StyledTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String hintText;
  final TextEditingController controller;
  final String errorText;
  final bool obscureText;
  final IconData icon;
  final Color color;
  final Color textColor;

  StyledTextField({
    Key key,
    @required this.hintText,
    @required this.color,
    @required this.icon,
    @required this.errorText,this.onChanged,
    this.controller,
    this.textColor = Colors.black,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorColor = Colors.red.shade300;
    return Container(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: obscureText ? TextInputType.text : TextInputType.emailAddress,
        cursorColor: color,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(.6),
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: color,
              width: 1.0,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: color,
              width: 2.0,
            ),
          ),
          errorText: errorText,
          errorStyle: TextStyle(
            color: errorColor, fontSize: 15
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: errorColor,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: errorColor,
            width: 2.0,
          )),
          prefixIcon: Icon(
            icon,
            color: color,
            size: 14,
          ),
        ),
      ),
    );
  }
}
