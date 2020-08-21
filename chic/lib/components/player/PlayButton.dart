import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayButton extends StatefulWidget {
  VideoPlayerController controller;

  //TODO theme data

  bool isPlaying = false;


  PlayButton(VideoPlayerController _controller, {Key key}) : super(key: key){
    this.controller = _controller;
  }

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {

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
    if (widget.isPlaying) {
      return IconButton(
          onPressed: () => setPlaybackState(),
          icon: Icon(Icons.pause),
          color: Colors.white,
          highlightColor: Color(0xFFD31675),
          iconSize: 25.0
      );
    }
    else{
      return IconButton(
          onPressed: () => setPlaybackState(),
          icon: Icon(Icons.play_arrow),
          color: Colors.white,
          highlightColor: Color(0xFFD31675),
          iconSize: 25.0
      );
    }
  }

//TODO add onTap handler and animation
}