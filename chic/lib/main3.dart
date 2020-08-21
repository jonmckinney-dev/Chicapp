import 'dart:io' show Platform, stderr;

import 'package:chic/screens/ArtistScreen.dart';
import 'package:chic/screens/ContentWrapper.dart';
import 'package:chic/screens/HomeScreen.dart';
import 'package:chic/screens/MasterclassScreen.dart';
import 'package:chic/screens/ShowScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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

  _MaterialAppScaffoldState(){
    buildScreensList();
  }

  void buildScreensList() {
    screens.add( new ContentWrapper(title:"Chic"));
    screens.add( new ArtistScreen(title:"Artists"));
    screens.add( new MasterclassScreen(title:"Masterclasses"));
    screens.add( new ShowScreen(title:"Shows"));
  }

  _onItemTapped(int tabIndex) {
    setState(() {
      _selectedIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(screens.length == 0)
      buildScreensList();

    if(Navigator.canPop(context)) {
      return Scaffold(
        appBar: AppBar(
          title: Text(pageTitle),
          backgroundColor: Color(0xFFD31675),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.maybePop(context),
                tooltip: MaterialLocalizations
                    .of(context)
                    .openAppDrawerTooltip,
              );
            },
          ),
        ),
        body: screens[_selectedIndex],
        bottomNavigationBar: _bottomNavigationBar(),
      );
    }
    else {
      return Scaffold(
        appBar: AppBar(
          title: Text(pageTitle),
          backgroundColor: Color(0xFFD31675),
        ),
        body: screens[_selectedIndex],
        bottomNavigationBar: _bottomNavigationBar(),
      );
    }
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFD31675),
      selectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), title: Text("Search")),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket), title: Text("Shop")),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          title: Text("Settings"),
        )
      ],
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
    );
  }
}


