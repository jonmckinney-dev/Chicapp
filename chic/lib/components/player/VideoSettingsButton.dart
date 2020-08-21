import 'package:eventhandler/eventhandler.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'PlayerEvents.dart';

class VideoSettingsButton extends StatefulWidget {
  VideoPlayerController controller;

  //TODO theme data

  VideoSettingsButton(VideoPlayerController _controller, {Key key}) : super(key: key){
    this.controller = _controller;
  }

  @override
  _VideoSettingsButtonState createState() => _VideoSettingsButtonState();
}

class _VideoSettingsButtonState extends State<VideoSettingsButton> {
  bool settingsMenuEnabled = false;

  VoidCallback toggleMenu(){
    setState(() {
      if(settingsMenuEnabled)
        settingsMenuEnabled = false;
      else
        settingsMenuEnabled = true;

      EventHandler().send(SettingsMenuChangeEvent());
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    if (settingsMenuEnabled) {
      return IconButton(
          onPressed: () => toggleMenu(),
          icon: Icon(Icons.settings),
          color: Color(0xFFD31675),
          highlightColor: Color(0xFFD31675),
          iconSize: 25.0
      );
    }
    else{
      return IconButton(
          onPressed: () => toggleMenu(),
          icon: Icon(Icons.settings),
          color: Colors.white,
          highlightColor: Color(0xFFD31675),
          iconSize: 25.0
      );
    }
  }

//TODO add onTap handler and animation
}