import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FavoriteButton extends StatefulWidget {
  VideoPlayerController controller;

  //TODO theme data

  bool liked = false;


  FavoriteButton({Key key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {

  VoidCallback setPlaybackState(){
    setState(() {
      if(widget.liked) {
        widget.liked = false;
      }
      else {
        widget.liked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.liked) {
      return IconButton(
          onPressed: () => setPlaybackState(),
          icon: Icon(Icons.favorite),
          color: Color(0xFFD31675),
          highlightColor: Color(0xFFD31675),
          iconSize: 25.0
      );
    }
    else{
      return IconButton(
          onPressed: () => setPlaybackState(),
          icon: Icon(Icons.favorite_border),
          color: Colors.white,
          highlightColor: Color(0xFFD31675),
          iconSize: 25.0
      );
    }
  }

//TODO add onTap handler and animation
}