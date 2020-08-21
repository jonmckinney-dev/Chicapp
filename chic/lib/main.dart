import 'dart:io' show Platform, stderr;

import 'package:chic/components/player/VideoOptionsMenu.dart';
import 'package:chic/components/player/VideoPlayer.dart';
import 'package:chic/screens/ArtistScreen.dart';
import 'package:chic/screens/ContentWrapper.dart';
import 'package:chic/screens/HomeScreen.dart';
import 'package:chic/screens/MasterclassScreen.dart';
import 'package:chic/screens/ShowScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


void main() => runApp(MaterialAppInit());



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
      //initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MaterialAppScaffold(title:"Main"),
        '/home': (context) => ContentWrapper(title:"Chic"),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/show': (context) => ShowScreen(title:"Show"),
        '/masterclass': (context) => ShowScreen(title:"Masterclass"),
        '/artist': (context) => ShowScreen(title:"Artist"),
        '/player': (context) => VideoPlayerScreen(),
      },
      //home: HomeScreen(title: 'Chic'),
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
  String pageTitle = "Chic";
  List<Widget> screens = new List();
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  PersistentTabController _controller;

  _MaterialAppScaffoldState() {
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      //VideoOptionsMenu(),
      ShowScreen(),
      ArtistScreen(),
      MasterclassScreen(),
      ShowScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColor: CupertinoColors.white,
        inactiveColor: CupertinoColors.systemGrey2,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.search),
        title: ("Search"),
        activeColor: CupertinoColors.white,
        inactiveColor: CupertinoColors.systemGrey2,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle),
        title: ("Account"),
        activeColor: CupertinoColors.white,
        inactiveColor: CupertinoColors.systemGrey2,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_basket),
        title: ("Shop"),
        activeColor: CupertinoColors.white,
        inactiveColor: CupertinoColors.systemGrey2,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.menu),
        title: ("Settings"),
        activeColor: CupertinoColors.white,
        inactiveColor: CupertinoColors.systemGrey2,
      ),
    ];
  }

  _onItemTapped(int tabIndex) {
    setState(() {
      _selectedIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Color(0xFFD31675),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}


