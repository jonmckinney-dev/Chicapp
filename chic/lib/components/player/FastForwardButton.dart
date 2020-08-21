import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FastForwardButton extends StatefulWidget {
  VideoPlayerController controller;

  //TODO theme data

  bool isFastForwarding = false;


  FastForwardButton(VideoPlayerController _controller, {Key key}) : super(key: key){
    this.controller = _controller;
  }

  @override
  _FastForwardButtonState createState() => _FastForwardButtonState();
}

class _FastForwardButtonState extends State<FastForwardButton> {

  int double = 0;

  VoidCallback handleQuickFFWD(){
    bool wasPlaying = false;

    setState(() {
      if (widget.controller.value.isPlaying) {
        wasPlaying = true;
        widget.controller.pause();
        widget.isFastForwarding = true;
      }
      Duration videoLength = widget.controller.value.duration;
      var interval = videoLength.inSeconds / 10;
      Future<Duration> currentPosition = widget.controller.position;
      currentPosition.then((Duration value) {
        // Invoked when the future is completed with a value.
        widget.controller.seekTo(
            Duration(seconds: ((value.inSeconds + interval).roundToDouble()).truncate() ));


      }, onError: (e) {
        // Invoked when the future is completed with an error.
        throw e;
      });
      if (wasPlaying) {
        widget.isFastForwarding = false;
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

    while (widget.isFastForwarding) {
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
          onPressed: () => handleQuickFFWD(),
          icon: Icon(Icons.fast_forward),
          color: Colors.white,
          highlightColor: Color(0xFFD31675),
          iconSize: 25.0),
    );
  }
//TODO add onTap handler and animation
}