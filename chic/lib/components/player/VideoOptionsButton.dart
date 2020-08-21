import 'package:chic/components/player/PlayerEvents.dart';
import 'package:eventhandler/eventhandler.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoOptionsButton extends StatefulWidget {
  VideoPlayerController controller;

  //TODO theme data

  VideoOptionsButton(VideoPlayerController _controller, {Key key}) : super(key: key){
    this.controller = _controller;
  }

  @override
  _VideoOptionsButtonState createState() => _VideoOptionsButtonState();
}

class _VideoOptionsButtonState extends State<VideoOptionsButton> {
  bool optionsMenuEnabled = false;


  VoidCallback toggleMenu(){
    setState(() {
      if(optionsMenuEnabled)
        optionsMenuEnabled = false;
      else
        optionsMenuEnabled = true;

      EventHandler().send(OptionMenuChangeEvent());
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    if (optionsMenuEnabled) {
      return IconButton(
          onPressed: () => toggleMenu(),
          icon: Icon(Icons.more_vert),
          color: Color(0xFFD31675),
          highlightColor: Color(0xFFD31675),
          iconSize: 25.0
      );
    }
    else{
      return IconButton(
          onPressed: () => toggleMenu(),
          icon: Icon(Icons.more_vert),
          color: Colors.white,
          highlightColor: Color(0xFFD31675),
          iconSize: 25.0
      );
    }
  }

//TODO add onTap handler and animation
}