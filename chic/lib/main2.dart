import 'dart:io' show Platform;

import 'package:chic/classes/Category.dart';
import 'package:chic/classes/VideoItem.dart';
import 'package:chic/components/carousel/CarouselItem.dart';
import 'package:chic/components/carousel/FixedWidthCarousel.dart';
import 'package:chic/components/carousel/CircleCarouselItem.dart';
import 'package:chic/components/carousel/RoundedRectCarouselItem.dart';
import 'package:chic/components/carousel/FixedWidthCarousel.dart';
import 'package:chic/components/carousel/TallRoundedRectCarouselItem.dart';
import 'package:chic/components/Promotion.dart';
import 'package:chic/screens/ArtistScreen.dart';
import 'package:chic/screens/HomeScreen.dart';
import 'package:chic/screens/MasterclassScreen.dart';
import 'package:chic/screens/ShowScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'classes/Artist.dart';

void main() {
  String os = Platform.operatingSystem;
  // Or, use a predicate getter.
  if (Platform.isIOS) {
    return runApp(CupertinoAppInit());
  }
  else if( Platform.isAndroid){
    return runApp(MaterialAppInit());
  }

}

class CupertinoAppInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    //SystemChrome.setPreferredOrientations(
    //    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return CupertinoApp(
      //home: CuptertinoAppScaffold(title:"Main"),
      routes: {
        '/': (context) => CuptertinoAppScaffold(title:"Main"),
        'home': (context) => HomeScreen(title:"Home"),
        'show': (context) => ShowScreen(title:"Show"),
        'masterclass': (context) => MasterclassScreen(title:"Masterclass"),
        'artist': (context) => ArtistScreen(title:"Artist"),
      },

    );
  }
}


class MaterialAppInit extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chic',
      theme: ThemeData(
        brightness: Brightness.dark,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.black,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MaterialAppScaffold(title:"Main"),
        '/home': (context) => HomeScreen(title:"Chic"),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/show': (context) => ShowScreen(title:"Show"),
        '/masterclass': (context) => ShowScreen(title:"Masterclass"),
        '/artist': (context) => ShowScreen(title:"Artist"),
      },
      //home: HomeScreen(title: 'Chic'),
    );
  }
}

class CuptertinoAppScaffold extends StatefulWidget {
  CuptertinoAppScaffold({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CuptertinoAppScaffoldState createState() => _CuptertinoAppScaffoldState();

}

class _CuptertinoAppScaffoldState extends State<CuptertinoAppScaffold> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _pages = <Widget>[
    HomeScreen(title: "Chic"),
    ShowScreen(title: "Show"),
    MasterclassScreen(title: "Masterclass"),
    ArtistScreen(title: "Arist")
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context){
    /*
    return CupertinoTabScaffold(
        navigationBar: CupertinoNavigationBar (
          middle: Text ("Chic"),
        ),
        tabBar: CupertinoTabBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Screen 1"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Screen 2"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Screen 3")),
          ],

        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return SafeArea(
                top: false,
                bottom: false,
                child: CupertinoApp(
                  home: CupertinoPageScaffold(
                    resizeToAvoidBottomInset: false,
                    child: _pages[_selectedIndex],
                  ),
                ),
              );
            },
          );
        }
    );
    */

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Screen 1"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Screen 2"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Screen 3"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Screen 4"),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return SafeArea(
              top: false,
              bottom: false,
              child: CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Page 1 of tab'),
                ),
                resizeToAvoidBottomInset: false,
                child: _pages[_selectedIndex],
              ),
            );
          },
        );
      },
    );
  }

}

class MaterialAppScaffold extends StatefulWidget {
  MaterialAppScaffold({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MaterialAppScaffoldState createState() => _MaterialAppScaffoldState();

}

class _MaterialAppScaffoldState extends State<MaterialAppScaffold> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _pages = <Widget>[
    HomeScreen(title: "Chic"),
    ShowScreen(title: "Show"),
    MasterclassScreen(title: "Masterclass"),
    ArtistScreen(title: "Arist")
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

