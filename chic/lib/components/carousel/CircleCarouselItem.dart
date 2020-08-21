import 'dart:developer' as developer;

import 'package:chic/interfaces/RenderableItem.dart';
import 'package:chic/screens/ArtistScreen.dart';
import 'package:flutter/material.dart';
import 'package:chic/config/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'CarouselItem.dart';

class CircleCarouselItem extends CarouselItem {

  double width = 87.0;
  double height = 87.0;

  CircleCarouselItem( RenderableItem _item) : super(_item);

  @override
  Widget build(BuildContext context) {


    return GestureDetector (
        onTap: () {
          //Navigator.of(context).pushReplacementNamed('/content/artist');
          pushNewScreen(
            context,
            screen: item.target,
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child:
        Container(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.asset(
                item.thumbnailUrl,
                fit: BoxFit.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}