import 'package:chic/classes/VideoItem.dart';
import 'package:chic/components/carousel/CarouselItem.dart';
import 'package:chic/components/carousel/FixedWidthCarousel.dart';
import 'package:chic/components/carousel/RoundedRectCarouselItem.dart';
import 'package:chic/components/utils/ExpandableTextArea.dart';
import 'package:chic/components/utils/PlayCircleButton.dart';
import 'package:chic/components/utils/RatingStars.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'dart:math';


class ItemDetails extends StatefulWidget {
  ItemDetails({Key key, this.title}) : super(key: key);

  String testItemDescShort = "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore";
  String testItemDescLong = "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
  double testRatings = 0.0;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    if(Navigator.canPop(context)) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Chic"),
          backgroundColor: Color(0xFFD31675),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.maybePop(context),
              );
            },
          ),
        ),
        body: generateScrollView(),
      );
    }
    else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Chic"),
          backgroundColor: Color(0xFFD31675),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 45, 48, 55),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 3,
                top: 0,
                right: -3,
                child: generateScrollView(),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget generateScrollView() {
    return  SingleChildScrollView(
      padding: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 350,
              child: Stack (
                alignment: Alignment.center,
                children: [
                  //Main item background image
                Positioned (
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/video-bg-1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                //Play button overlay, left aligned
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: PlayCircleButton(
                    videoId: "234234234234234",
                    iconData: Icons.play_arrow,
                    circleColor: Color(0xFFD31675),
                    circleHeight: 75.0,
                    circleWidth: 75.0,
                    iconColor: Colors.white,
                    iconSize: 56.0
                  ),
                ),
            ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              //width: 159,
              height: 53,
              margin: EdgeInsets.only(left: 16, top: 14),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //Video title
                  Positioned(
                    left: 0,
                    top: 37,
                    child: Text(
                      "With Amy Nicole",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFFD31675),
                        fontFamily: "SF Pro Text",
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        letterSpacing: 0.25455,
                      ),
                    ),
                  ),
                  //Video subtitle/synopsis
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Text(
                      "Skin Care",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "SF Pro Text",
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        letterSpacing: 0.4,
                        height: 1.09375,
                      ),
                    ),
                  ),
                  //Rating stars
                  Positioned (
                    right: 10,
                    top: -8,
                    child: RatingStars(ratings: widget.testRatings),
                    ),
                  ],
                  ),
          ),
          ),
          Align(
            alignment: Alignment.topLeft,
            //Video long description - abbreviated to constrain height, must be expandable upon clicking the Read More link
            child: Container(
              width: 360,
              margin: EdgeInsets.only(left: 16, top: 37),
              child: ExpandableTextArea(shortText: widget.testItemDescShort, longText: widget.testItemDescLong, expandLinkText: "READ MORE", collapseLinkText: "SHOW LESS"),
            ),
          ),

          //Similar items carousel
          new FixedWidthCarousel(loadCarouselItems(), 120, title: "More Like This"),
      ],
    ),
    );
  }

  List<CarouselItem> loadCarouselItems() {
    List<CarouselItem> items = new List();

    var random = new Random();
    int lastRand = 1;
    int secondLastRand = 1;

    for(var i = 1; i<11; i++) {
      var rando = random.nextInt(10);
      rando++;
      while( rando == lastRand || rando == secondLastRand ) {
        rando = random.nextInt(10);
        rando++;
      }

      secondLastRand = lastRand;
      lastRand = rando;
      VideoItem item = new VideoItem("00000001", "assets/images/mask-" + rando.toString() + ".png");
      item.thumbnailUrl = "assets/images/mask-" + rando.toString() + ".png";
      item.target = ItemDetails();
      RoundedRectCarouselItem cItem = new RoundedRectCarouselItem(item);

      items.add(cItem);
    }

    return items;
  }
}
