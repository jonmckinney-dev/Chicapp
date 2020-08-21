import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ClosedCaptionButton extends StatefulWidget {
  VideoPlayerController controller;

  //TODO theme data

  bool captionsOn = false;


  ClosedCaptionButton(VideoPlayerController _controller, {Key key}) : super(key: key){
    this.controller = _controller;
  }

  @override
  _ClosedCaptionButtonState createState() => _ClosedCaptionButtonState();
}

class _ClosedCaptionButtonState extends State<ClosedCaptionButton> {

  VoidCallback setPlaybackState(){
    setState(() {
      if(widget.captionsOn) {
        //widget.isPlaying = false;
        //widget.controller.pause();
        widget.captionsOn = false;
      }
      else {
        //widget.isPlaying = true;
        //widget.controller.play();
        widget.captionsOn = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.captionsOn) {
      return IconButton(
          onPressed: () => setPlaybackState(),
          icon: Icon(Icons.closed_caption),
          color: Color(0xFFD31675),
          highlightColor: Color(0xFFD31675),
          iconSize: 25.0
      );
    }
    else{
      return IconButton(
          onPressed: () => setPlaybackState(),
          icon: Icon(Icons.closed_caption),
          color: Colors.white,
          highlightColor: Color(0xFFD31675),
          iconSize: 25.0
      );
    }
  }

//TODO add onTap handler and animation
}