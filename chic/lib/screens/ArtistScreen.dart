import 'package:chic/classes/Category.dart';
import 'package:chic/classes/VideoItem.dart';
import 'package:chic/components/carousel/CarouselCustomControls.dart';
import 'package:chic/components/carousel/CarouselItem.dart';
import 'package:chic/components/carousel/FixedWidthCarousel.dart';
import 'package:chic/components/carousel/CircleCarouselItem.dart';
import 'package:chic/components/carousel/DynamicWidthCarousel.dart';
import 'package:chic/components/carousel/RoundedRectCarouselItem.dart';
import 'package:chic/components/carousel/FixedWidthCarousel.dart';
import 'package:chic/components/carousel/DynamicWidthCarousel.dart';
import 'package:chic/components/carousel/RoundedRectTextCarouselItem.dart';
import 'package:chic/components/carousel/TallRoundedRectCarouselItem.dart';
import 'package:chic/components/Promotion.dart';
import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

import 'dart:math';

import 'package:chic/classes/Artist.dart';

class ArtistScreen extends StatefulWidget {
  ArtistScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ArtistScreenState createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        title: Text("Artists"),
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
      body: SingleChildScrollView (
          child: Column(

            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CarouselCustomControls(loadHeroes()),
              new FixedWidthCarousel(loadCategories(), 230, title: "Shows", childAspectRatio: 1.48387),
              new FixedWidthCarousel(loadCarouselItems(), 120, title: "Continue Watching"),
              new FixedWidthCarousel(loadArtists(), 87, title: "Following"),
              new FixedWidthCarousel(loadCarouselItems(), 120, title: "Trending"),
              new DynamicWidthCarousel(loadGenres(), 120, title:"Genres"),
              new FixedWidthCarousel(loadCarouselItems(), 120, title: "Recommended for You"),
              new Promotion("Masterclass", "assets/images/promotion-1.png"),
              new FixedWidthCarousel(loadCarouselItems(), 120, title: "Face"),
              new FixedWidthCarousel(loadArtists(), 87, title: "Top Artists"),
              new FixedWidthCarousel(loadCarouselItems(), 120, title: "Eyes"),
              new Promotion("Makeup of the World", "assets/images/show-1.png"),
            ],
          ),
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
      RoundedRectCarouselItem cItem = new RoundedRectCarouselItem(item);

      items.add(cItem);
    }

    return items;
  }

  List<CarouselItem> loadArtists() {
    List<CarouselItem> items = new List();
    var random = new Random();
    int lastRand = 1;
    int secondLastRand = 1;

    for(var i = 0; i<10; i++) {

      var rando = random.nextInt(9);
      rando++;
      while( rando == lastRand || rando == secondLastRand ) {
        rando = random.nextInt(9);
        rando++;
      }

      secondLastRand = lastRand;
      lastRand = rando;

      Artist item = new Artist("00000001", "Person " + rando.toString());
      item.thumbnailUrl = "assets/images/oval-" + rando.toString() + ".png";
      CircleCarouselItem cItem = new CircleCarouselItem(item);

      items.add(cItem);
    }

    return items;
  }

  List<CarouselItem> loadGenres() {
    List<CarouselItem> items = new List();
    var random = new Random();
    int lastRand = 1;
    int secondLastRand = 1;

    RoundedRectTextCarouselItem cItem = new RoundedRectTextCarouselItem(new Category("00000001", "Amy Nicole", "Skin Series"));
    RoundedRectTextCarouselItem cItem2 = new RoundedRectTextCarouselItem(new Category("00000001", "Eyes", "Skin Series"));
    RoundedRectTextCarouselItem cItem3 = new RoundedRectTextCarouselItem(new Category("00000001", "This is a really long category name", "Skin Series"));
    RoundedRectTextCarouselItem cItem4 = new RoundedRectTextCarouselItem(new Category("00000001", "New Shows", "Skin Series"));


    items.add(cItem);
    items.add(cItem2);
    items.add(cItem3);
    items.add(cItem4);

    return items;
  }

  List<CarouselItem> loadHeroes() {
    List<CarouselItem> items = new List();

    Category item1 = new Category("00000001", "Skin and Eyes", "Skin Series");
    item1.thumbnailUrl = "assets/images/makeup_kit-1.jpg";

    Category item2 = new Category("00000001", "Skin and Eyes", "Skin Series");
    item2.thumbnailUrl = "assets/images/makeup_kit-2.jpg";

    Category item3 = new Category("00000001", "Skin and Eyes", "Skin Series");
    item3.thumbnailUrl = "assets/images/makeup_kit-3.jpg";

    Category item4 = new Category("00000001", "Skin and Eyes", "Skin Series");
    item4.thumbnailUrl = "assets/images/makeup_kit-4.jpg";

    RoundedRectCarouselItem cItem = new RoundedRectCarouselItem(item1);
    RoundedRectCarouselItem cItem2 = new RoundedRectCarouselItem(item2);
    RoundedRectCarouselItem cItem3 = new RoundedRectCarouselItem(item3);
    RoundedRectCarouselItem cItem4 = new RoundedRectCarouselItem(item4);


    items.add(cItem);
    items.add(cItem2);
    items.add(cItem3);
    items.add(cItem4);

    return items;
}

  List<CarouselItem> loadCategories() {
    List<CarouselItem> items = new List();
    var random = new Random();
    int lastRand = 1;
    int secondLastRand = 1;

    for(var i = 1; i<5; i++) {
      var rando = random.nextInt(4);
      rando++;
      while( rando == lastRand || rando == secondLastRand ) {
        rando = random.nextInt(4);
        rando++;
      }

      secondLastRand = lastRand;
      lastRand = rando;

      Category item = new Category("00000001", "Skin and Eyes", "Skin Series");
      item.thumbnailUrl = "assets/images/image-" + rando.toString() + ".png";
      TallRoundedRectCarouselItem cItem = new TallRoundedRectCarouselItem(item);

      items.add(cItem);
    }

    return items;
  }
}