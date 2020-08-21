import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:chic/config/colors.dart';


class Promotion extends StatelessWidget {

  double imageRadius = 8.0;
  double width = 345.0;
  double height = 148.0;
  String title;
  String imageUrl;

  Promotion( String _title, String _imageUrl ) {
    this.title = _title;
    this.imageUrl = _imageUrl;
  }

  /**
   * TODO need to manage the style for text in this method
   */
  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      onTap: () {
        final snackBar = SnackBar(content: Text("Tap"));

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: width,
          height: height,
          margin: EdgeInsets.only(top: 8, bottom: 20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.none,
                ),
              ),
              Positioned(
                left: 10,
                bottom: 5,
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.primaryText,
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
      ),
    );
  }
}