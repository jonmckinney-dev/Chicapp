import 'dart:developer' as developer;
import 'dart:io';

import 'package:chic/interfaces/RenderableItem.dart';
import 'package:chic/screens/ShowScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chic/config/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'CarouselItem.dart';

class RoundedRectCarouselItem extends CarouselItem {

  double imageRadius = 8.0;

  RoundedRectCarouselItem( RenderableItem _item) : super(_item);

  /**
   * TODO need to manage the style for text in this method
   */
  @override
  Widget build(BuildContext context) {
    return GestureDetector (
        onTap: () {
          //Navigator.of(context).pushReplacementNamed('/content/masterclass');
          pushNewScreen(
            context,
            screen: item.target,
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: Container(
        //  width: 155,
        //    height: 110,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Positioned(
              //left: 0,
              //right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(imageRadius),
                child: Image.asset(
                  item.thumbnailUrl,
                  fit: BoxFit.none,
                ),
              ),
            ),
            Positioned(
              left: 1,
              bottom: 21,
              child: Text(
                item.title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "SF Pro Text",
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  letterSpacing: 0.125,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}