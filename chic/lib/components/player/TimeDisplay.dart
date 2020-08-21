import 'dart:async';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TimeDisplay extends StatefulWidget {
  VideoPlayerController controller;

  //TODO theme data

  bool isPlaying = false;


  TimeDisplay(VideoPlayerController _controller, {Key key}) : super(key: key){
    this.controller = _controller;
  }

  @override
  _TimeDisplayState createState() => _TimeDisplayState();
}



class _TimeDisplayState extends State<TimeDisplay> {

  Duration position = Duration(seconds: 0);
  StreamSubscription<Duration> positionListener;

  @override
  void initState() {
    super.initState();

    print ('init');
    widget.controller.addListener(() { timeChangeListener(); });
  }

  void timeChangeListener(){
    setState(() {
      Future<Duration> currentPosition = widget.controller.position;
      currentPosition.then((Duration value) {
        this.position = value;
      }, onError: (e) {
        // Invoked when the future is completed with an error.
        throw e;
      });
    });
  }

  String buildTimeString(Duration value){
    String time = "";

    if(value != null) {
      if (value.inHours != null && value.inHours > 0) {
        if (value.inHours < 10) {
          time += "0";
        }
        time += value.inHours.toString();
        time += ":";
      }
      if (value.inMinutes != null && value.inMinutes < 10) {
        time += "0";
      }
      time += value.inMinutes.toString();
      time += ":";
      if (value.inSeconds != null && value.inSeconds < 10)
        time += "0";
      time += value.inSeconds.toString();

    }
    else {
      time = "00:00";
    }

    return time;

  }

  VoidCallback setPlaybackState(){
    setState(() {
      if(widget.isPlaying) {
        widget.isPlaying = false;
        widget.controller.pause();
      }
      else {
        widget.isPlaying = true;
        widget.controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Duration length = Duration(seconds: 0);
    length = widget.controller.value.duration;

    return Text(
          buildTimeString(position)
          + "/"
          + buildTimeString(length),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontFamily: "SF Pro Text",
        fontWeight: FontWeight.w700,
        fontSize: 15,
        letterSpacing: 0.175,
      ),
    );
  }

//TODO add onTap handler and animation
}