import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RewindButton extends StatefulWidget {
  VideoPlayerController controller;

  //TODO theme data

  bool isRewinding = false;


  RewindButton(VideoPlayerController _controller, {Key key}) : super(key: key){
    this.controller = _controller;
  }

  @override
  _RewindButtonState createState() => _RewindButtonState();
}

class _RewindButtonState extends State<RewindButton> {
  bool wasPlaying = false;
  int double = 0;

  VoidCallback handleQuickRewind(){
    setState(() {
      if (widget.controller.value.isPlaying) {
        wasPlaying = true;
        widget.controller.pause();
        widget.isRewinding = true;
      }

      Duration videoLength = widget.controller.value.duration;
      var interval = videoLength.inSeconds / 10;
      Future<Duration> currentPosition = widget.controller.position;
      currentPosition.then((Duration value) {
        // Invoked when the future is completed with a value.
        widget.controller.seekTo(Duration(
            seconds:
                ((value.inSeconds - interval).roundToDouble()).truncate()));
        //return value.inSeconds;  // The successor is completed with the value 42.
      }, onError: (e) {
        // Invoked when the future is completed with an error.
        throw e;
      });
      if (wasPlaying) {
        widget.isRewinding = false;
        wasPlaying = false;
        widget.controller.play();
      }
    });
  }

  Future<void> continuousRewind() async {
    setState(() async {
      if(widget.controller.value.isPlaying) {
        widget.controller.pause();

        await loopRewind();
      }
    });
  }

  Future<void> loopRewind() async {
      Duration videoLength = widget.controller.value.duration;
      var rewindInterval = videoLength.inSeconds/20;

      while (widget.isRewinding) {
        Future<Duration> currentPosition = widget.controller.position;
        currentPosition.then((Duration value) {
          widget.controller.seekTo(
              Duration(seconds: value.inSeconds - rewindInterval.truncate()));
        },
        onError: (e) {
          throw e;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        /*onLongPressStart:(details) {
          widget.isRewinding = true;
          continuousRewind();
        },
        onLongPressUp: () {
          widget.isRewinding = false;
          widget.controller.play();
        },

         */
        child: IconButton(
            onPressed: () => handleQuickRewind(),
            icon: Icon(Icons.fast_rewind),
            color: Colors.white,
            highlightColor: Color(0xFFD31675),
            iconSize: 25.0),
      );
    }
//TODO add onTap handler and animation
}