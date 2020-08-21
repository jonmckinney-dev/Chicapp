import 'package:chic/components/player/VideoPlayer.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';

import 'CircleButton.dart';

class PlayCircleButton extends StatelessWidget {
  final IconData iconData;
  final Color circleColor;
  final Color iconColor;
  final double iconSize;
  final double circleHeight;
  final double circleWidth;
  final String videoId;

  const PlayCircleButton({Key key, this.videoId, this.iconData, this.circleHeight, this.circleWidth, this.circleColor, this.iconColor, this.iconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleButton(
        onTap: () {
          pushNewScreen(
          context,
          screen: VideoPlayerScreen(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        ); },
        iconData: Icons.play_arrow,
        circleColor: Color(0xFFD31675),
        circleHeight: 75.0,
        circleWidth: 75.0,
        iconColor: Colors.white,
        iconSize: 56.0
    );
  }

  //TODO add onTap handler and animation
}