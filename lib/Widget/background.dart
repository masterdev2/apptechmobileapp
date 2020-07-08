import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;


  Background({
    Key key,
  this.child,

  })  : assert(child != null  ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Color(0xff21346f).withOpacity(0.6),
//        image: new DecorationImage(
//          fit: BoxFit.cover,
//          image: new AssetImage(Images.casa),
//        ),
      ),
      child: child,
    );
  }
}
