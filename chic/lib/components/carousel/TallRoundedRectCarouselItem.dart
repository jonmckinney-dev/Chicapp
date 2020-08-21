import 'dart:developer' as developer;

import 'package:chic/interfaces/RenderableItem.dart';
import 'package:chic/screens/MasterclassScreen.dart';
import 'package:chic/screens/ShowScreen.dart';
import 'package:flutter/material.dart';
import 'package:chic/config/colors.dart';

import 'CarouselItem.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class TallRoundedRectCarouselItem extends CarouselItem {

  double imageRadius = 8.0;

  TallRoundedRectCarouselItem( RenderableItem _item) : super(_item);

  /**
   * TODO need to manage the style for text in this method
   */
  @override
  Widget build(BuildContext context) {
    return GestureDetector (
        onTap: () {
          //Navigator.of(context).pushReplacementNamed('/content/show');
          pushNewScreen(
            context,
            screen: item.target,
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: Container(
          width: 155,
          height: 230,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(imageRadius),
                  child: Image.asset(
                    item.thumbnailUrl,
                    fit: BoxFit.none,
                  ),
                ),
              ),
              Positioned(
                left: 5,
                bottom: 20,
                      child: Text(
                        item.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontFamily: "SF Pro Text",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          letterSpacing: 0.21857,
                          height: 1.11111,
                        ),
                      ),
              ),
              Positioned(
                left: 8,
                bottom: 5,
                        child: Text(
                          item.subHeading,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.accentText,
                            fontFamily: "SF Pro Text",
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            letterSpacing: 0.15,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          );
      }
}