import 'dart:developer' as developer;

import 'package:chic/interfaces/RenderableItem.dart';
import 'package:flutter/material.dart';
import 'package:chic/config/colors.dart';

class CarouselItem extends StatelessWidget {

  RenderableItem item;

  CarouselItem( RenderableItem _item){
    this.item = _item;
  }

  /**
   * Default visual is to implement the rounded rectangle item so that is implemented here rather than leave it blank
   */
  @override
  Widget build(BuildContext context) {

    return GestureDetector (
      onTap: () {
        final snackBar = SnackBar(content: Text("Tap"));

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Card(
      child:
        Container(
          width: 155,
          height: 112,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Image.asset(
                  item.thumbnailUrl,
                  fit: BoxFit.none,
                ),
              ),
              Positioned(
                left: 5,
                bottom: 3,
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
     //crossAxisAlignment: CrossAxisAlignment.start,
    )
    );
  }
}