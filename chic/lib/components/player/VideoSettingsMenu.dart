import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoSettingsMenu extends StatefulWidget {
  VideoPlayerController controller;

  //TODO theme data

  bool settingsMenuEnabled = false;

  VideoSettingsMenu(VideoPlayerController _controller, {Key key}) : super(key: key){
    this.controller = _controller;
  }


  @override
  _VideoSettingsMenuState createState() => _VideoSettingsMenuState();
}

class _VideoSettingsMenuState extends State<VideoSettingsMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Settings",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 193, 192, 200),
                    fontFamily: "SF Pro Text",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    letterSpacing: 0.225,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
            height: 5,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          GestureDetector(
            onTap: () => print('WiFi Only'),
            child: Row(children: [
              Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(7.0),
                child: Icon(
                  Icons.shopping_basket,
                  size: 20,
                ),
              ),
              ),
              Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  "STREAM ON WIFI ONLY",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 193, 192, 200),
                    fontFamily: "SF Pro Text",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.175,
                  ),
                ),
              ),
              ),
            ]),
          ),
          GestureDetector(
            onTap: () => print('CC'),
            child: Row(children: [
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Icon(
                  Icons.share,
                  size: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  "CC",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 193, 192, 200),
                    fontFamily: "SF Pro Text",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.175,
                  ),
                ),
              ),
            ]),
          ),
          GestureDetector(
            onTap: () => print('cast'),
            child: Row(children: [
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Icon(
                  Icons.cast,
                  size: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  "CAST",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 193, 192, 200),
                    fontFamily: "SF Pro Text",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.175,
                  ),
                ),
              ),
            ]),
          ),
          GestureDetector(
            onTap: () => print('playlist'),
            child: Row(children: [
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Icon(
                  Icons.format_list_numbered,
                  size: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  "ADD TO PLAYLIST",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 193, 192, 200),
                    fontFamily: "SF Pro Text",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.175,
                  ),
                ),
              ),
            ]),
          ),
          GestureDetector(
            onTap: () => print('comment'),
            child: Row(children: [
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Icon(
                  Icons.comment,
                  size: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  "MATERIALS",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 193, 192, 200),
                    fontFamily: "SF Pro Text",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.175,
                  ),
                ),
              ),
            ]),
          ),
          const Divider(
            color: Colors.grey,
            height: 5,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
        ],
      ),
    );
  }

//TODO add onTap handler and animation
}
