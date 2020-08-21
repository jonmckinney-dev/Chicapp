import 'package:chic/classes/VideoItem.dart';
import 'package:chic/interfaces/RenderableItem.dart';
import 'package:chic/components/carousel/CarouselItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chic/config/colors.dart';
import 'package:flutter/rendering.dart';

class FixedWidthCarousel extends StatefulWidget {
  FixedWidthCarousel(List<CarouselItem> _items, double _height, {Key key, this.title, this.childAspectRatio} ) : super(key: key) {
    this.items = _items;
    this.height = _height;
    if(this.title == "")
      showTitle = false;
  }

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  double height = 112.0;
  bool showTitle = true;
  double childAspectRatio = 1.0;

  List<CarouselItem> items;

  @override
  _FixedWidthCarouselState createState() => _FixedWidthCarouselState();
}

class _FixedWidthCarouselState extends State<FixedWidthCarousel> {


  @override
  Widget build(BuildContext context) {

    if(!(widget.childAspectRatio != null && widget.childAspectRatio > 0) )
      widget.childAspectRatio = 1.0;

    if(widget.showTitle) {
      return
        Container(
          //height: 132,
            margin: EdgeInsets.only(top: 7, left: 15.0, bottom:8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "SF Pro Text",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
               Container(
                    height: widget.height,
                    margin: EdgeInsets.only(top: 3, left:0.0),
                    alignment: Alignment.centerLeft,
                    child: GridView.builder(
                        itemCount: widget.items.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: widget.height,
                          childAspectRatio: widget.childAspectRatio,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) => widget.items[index]
                    ),
                ),
              ],
            )
        );
    }
    else {
      return
        Container(
          //height: 132,

            margin: EdgeInsets.only(top: 10, left: 15.0, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    height: widget.height,
                    margin: EdgeInsets.only(top: 3),
                    child: GridView.builder(
                        itemCount: widget.items.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: widget.height,
                          childAspectRatio: widget.childAspectRatio,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) => widget.items[index]
                    )
                ),
              ],
            )
        );
    }
  }

}





