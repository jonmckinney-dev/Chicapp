import 'package:chic/screens/HomeScreen.dart';
import 'package:chic/screens/ShowScreen.dart';
import 'package:flutter/material.dart';


class ContentWrapper extends StatefulWidget {
  ContentWrapper({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ContentWrapperState createState() => _ContentWrapperState();
}

class _ContentWrapperState extends State<ContentWrapper> {


  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/content/home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/content/home':
          // Assume CollectPersonalInfoPage collects personal info and then
          // navigates to 'signup/choose_credentials'.
            builder = (BuildContext _) => HomeScreen(title:"Chic");
            break;
          case '/content/show':
            builder = (BuildContext _) => ShowScreen(title:"Show");
            break;
          case '/content/masterclass':
            builder = (BuildContext _) => ShowScreen(title:"Masterclass");
            break;
          case '/content/show':
            builder = (BuildContext _) => ShowScreen(title:"Artist");
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}