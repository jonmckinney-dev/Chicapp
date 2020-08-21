import 'dart:developer' as developer;
import 'dart:io';

import 'package:chic/interfaces/RenderableItem.dart';
import 'package:chic/screens/ShowScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chic/config/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'CarouselItem.dart';

class RoundedRectTextCarouselItem extends CarouselItem {

  double imageRadius = 8.0;

  RoundedRectTextCarouselItem( RenderableItem _item) : super(_item);

  /**
   * TODO need to manage the style for text in this method
   */
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      color: AppColors.primaryText,
      fontFamily: "SF Pro Text",
      fontWeight: FontWeight.w400,
      fontSize: 18,
      letterSpacing: 0.125,
    );


    return UnconstrainedBox(
      //padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      //width: 500, //getTextSize(item.title, style, context).width,
      textDirection: TextDirection.ltr,
      child: OutlineButton(
        onPressed: () {
          pushNewScreen(
            context,
            screen: item.target,
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        disabledBorderColor: Colors.white,
        highlightedBorderColor: Color(0xFFD31675),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Text(
          item.title,
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
    );
  }

  Size getTextSize(String text, TextStyle textStyle, BuildContext context) {
    final Size size = (TextPainter(
        text: TextSpan(text: text, style: textStyle),
        maxLines: 1,
        textScaleFactor: MediaQuery
            .of(context)
            .textScaleFactor,
        textDirection: TextDirection.ltr)
      ..layout())
        .size;

    return size;
  }
}