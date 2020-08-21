import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'CarouselItem.dart';

import 'dart:developer' as developer;


class CarouselCustomControls extends StatefulWidget {
  List<CarouselItem> items = new List();

  CarouselCustomControls(List<CarouselItem> _items){
    this.items = _items;
  }

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();

  }
}

class _CarouselWithIndicatorState extends State<CarouselCustomControls> {
  int _current = 0;



  @override
  Widget build(BuildContext context) {

    final List<Widget> imageSliders = widget.items.map((entry) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: Image.asset(entry.item.thumbnailUrl),//network(item, fit: BoxFit.cover, width: 1000.0),
        ),
          /*Stack(
              children: <Widget>[
                Image.asset(entry.item.thumbnailUrl),//network(item, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 65.0,
                  left: 5.0,
                  right: 0.0,
                    //padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      entry.item.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                ),

              ],
            )
        ),*/
      ),
    )).toList();

    double aspectRatio = 2.0;

    return Column(
          children: [
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false,
                  viewportFraction: 1.0,
                  height: (MediaQuery.of(context).size.width/aspectRatio)*1.3,
                  aspectRatio: aspectRatio,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.items.map((url) {
                int index = widget.items.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color(0xFFD31675)
                        : Color(0xFFB91266),
                  ),
                );
              }).toList(),
            ),
          ],
    );
  }


}