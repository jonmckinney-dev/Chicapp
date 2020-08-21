import 'package:chic/classes/VideoItem.dart';
import 'package:chic/interfaces/RenderableItem.dart';
import 'package:chic/components/carousel/CarouselItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chic/config/colors.dart';
import 'package:flutter/rendering.dart';

class DynamicWidthCarousel extends StatefulWidget {
  DynamicWidthCarousel(List<CarouselItem> _items, double _height, {Key key, this.title, this.childAspectRatio} ) : super(key: key) {
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
  _DynamicWidthCarouselState createState() => _DynamicWidthCarouselState();
}

class _DynamicWidthCarouselState extends State<DynamicWidthCarousel> {


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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: addSpacersInWidgetList(widget.items),
                  )),
            ],
          )
        );
    }
    else {
      return
        SingleChildScrollView (
          scrollDirection: Axis.horizontal,
          //padding: EdgeInsets.fromLTRB(2, 2, 2, 2)
          child: Row (

            children: addSpacersInWidgetList(widget.items),
          )
        );
    }
  }

  List<Widget> addSpacersInWidgetList(List<CarouselItem> list){
    List<Widget> newWidgetList = new List();
    for( int i = 0; i < list.length; i++){
      Widget w = Container(
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: list[i],
        ),
      );
      newWidgetList.add(w);
    }

    return newWidgetList;
  }
}





