

import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;
  final Color circleColor;
  final Color iconColor;
  final double iconSize;
  final double circleHeight;
  final double circleWidth;

  const CircleButton({Key key, this.onTap, this.iconData, this.circleHeight, this.circleWidth, this.circleColor, this.iconColor, this.iconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: circleWidth,
        height: circleHeight,
        decoration: new BoxDecoration(
          color: circleColor,
          shape: BoxShape.circle,
        ),
        child: new Icon(
          iconData,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}