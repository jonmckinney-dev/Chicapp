import 'package:chic/components/player/PlayButton.dart';
import 'package:chic/components/utils/HoveringBackButton.dart';
import 'package:eventhandler/eventhandler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'PlayerControls.dart';
import 'PlayerEvents.dart';


class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  PlayerControls controls;


  @override
  void initState() {
    controls = PlayerControls(_controller);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);


    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  VoidCallback _onPlayerTouched(){
    setState(() {
      print('touched player');
        EventHandler().send(ControlsEvent());
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: Stack(
        children: [
           Center(
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization, use
                    // the data it provides to limit the aspect ratio of the video.
                    return AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        // Use the VideoPlayer widget to display the video.
                        child: GestureDetector(
                          onTap: () => _onPlayerTouched(),
                          child:VideoPlayer(_controller),
                        ),
                      );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          Opacity (
            opacity: 1.0,
            child: PlayerControls(_controller),
          ),
        ],
      ),
    );
  }
}
