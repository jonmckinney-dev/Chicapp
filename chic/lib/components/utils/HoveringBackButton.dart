import 'package:flutter/material.dart';

class HoveringBackButton extends StatelessWidget {

  const HoveringBackButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new InkResponse(
        onTap: () => Navigator.pop(context),
        child: new Container(
          width: 40,
          height: 40,
          decoration: new BoxDecoration(
            color: Color.fromARGB(255, 33, 35, 43),
            shape: BoxShape.circle,
          ),
          child: new Icon(
            Icons.arrow_back,
            size: 30,
            color: Color(0xFFC1C0C8),
          ),
        ),
    );
  }

//TODO add onTap handler and animation
}

