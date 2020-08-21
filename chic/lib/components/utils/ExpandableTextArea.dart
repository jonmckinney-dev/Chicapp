import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandableTextArea extends StatelessWidget {
 final String shortText;
 final String longText;
 final String expandLinkText;
 final String collapseLinkText;

  const ExpandableTextArea({Key key, this.shortText, this.longText, this.expandLinkText, this.collapseLinkText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return ExpandableNotifier(  // <-- Provides ExpandableController to its children
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expandable(
            // <-- Driven by ExpandableController from ExpandableNotifier
            collapsed: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.shortText,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white70,
                    fontFamily: "SF Pro Text",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.175,
                    height: 1.57143,
                  ),
                ),
                ExpandableButton(
                  // <-- Expands when tapped on the cover photo
                  child: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 50.0),
                    child: Text(
                      this.expandLinkText,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFFD31675),
                        fontFamily: "SF Pro Text",
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        letterSpacing: 0.18182,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text(
                this.longText,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white70,
                  fontFamily: "SF Pro Text",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: 0.175,
                  height: 1.57143,
                ),
              ),
              ExpandableButton(
                // <-- Collapses when tapped on
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 50.0),
                  child: Text(
                  this.collapseLinkText,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFFD31675),
                    fontFamily: "SF Pro Text",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    letterSpacing: 0.18182,
                  ),
                ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}