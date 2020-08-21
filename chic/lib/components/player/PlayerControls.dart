import 'dart:io';

import 'package:chic/components/player/ClosedCaptionButton.dart';
import 'package:chic/components/player/FavoriteButton.dart';
import 'package:chic/components/player/PlayerEvents.dart';
import 'package:chic/components/player/RewindButton.dart';
import 'package:chic/components/player/TimeDisplay.dart';
import 'package:chic/components/player/VideoSettingsButton.dart';
import 'package:chic/components/utils/HoveringBackButton.dart';
import 'package:eventhandler/eventhandler.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'FastForwardButton.dart';
import 'PlayButton.dart';
import 'VideoOptionsButton.dart';
import 'VideoOptionsMenu.dart';
import 'VideoSettingsMenu.dart';

class PlayerControls extends StatefulWidget {
  VideoPlayerController controller;

  //TODO theme data

  bool isPlaying = false;


  PlayerControls(VideoPlayerController _controller, {Key key}) : super(key: key){
    this.controller = _controller;
  }

  @override
  _PlayerControlsState createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls> {
  bool showControls = true;
  bool showOptions = false;
  bool showSettings = false;
  Widget videoOptionsMenuPlaceholder;
  Widget videoSettingsMenuPlaceholder;
  VideoOptionsMenu videoOptionsMenu;
  VideoOptionsButton optionsButton;

  VideoSettingsMenu settingsMenu;
  VideoSettingsButton settingsButton;
  Widget emptyContainer = Container(width:0.0, height:0.0);

  double backgroundContainerHeight = 115;

  @override
  void initState(){

    this.optionsButton = VideoOptionsButton(widget.controller);
    this.settingsButton = VideoSettingsButton(widget.controller);
    this.videoOptionsMenu = VideoOptionsMenu(widget.controller);
    this.settingsMenu = VideoSettingsMenu(widget.controller);

    videoOptionsMenuPlaceholder = emptyContainer;
    videoSettingsMenuPlaceholder = emptyContainer;

    EventHandler()
        .subscribe(_onPlayerControlsTouched)
        .subscribe(_onOptionsMenuChanged)
        .subscribe(_onSettingsMenuChanged);

    super.initState();
  }

  @override
  void dispose() {
    EventHandler()
        .unsubscribe(_onPlayerControlsTouched)
        .unsubscribe(_onOptionsMenuChanged)
        .unsubscribe(_onSettingsMenuChanged);
    super.dispose();
  }

  void _onPlayerControlsTouched(ControlsEvent event) {
    setState(() {
      toggleControls();
    } );

  }

  void _onOptionsMenuChanged(OptionMenuChangeEvent event) {
    setState(() {
      toggleOptionsMenu(false);
    } );
  }

  void _onSettingsMenuChanged(SettingsMenuChangeEvent event) {
    setState(() { toggleSettingsMenu(false); } );
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
        /*
        Future.delayed(const Duration(seconds: 5), () { //asynchronous delay
          if (this.mounted && widget.controller.value.isPlaying) { //checks if widget is still active and not disposed
            setState(() { //tells the widget builder to rebuild again because ui has updated
              showControls=false; //update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
            });
          }
        });
         */
      }
    });
  }

  void toggleControls() {
    setState(() {
      if(showControls) {
        showControls = false;
        toggleOptionsMenu(true);
        toggleSettingsMenu(true);
      }
      else
        showControls = true;
    });
  }

  void toggleOptionsMenu(bool forceClose){
    if(showOptions || forceClose) {
      showOptions = false;
      backgroundContainerHeight = 115;
      this.videoOptionsMenuPlaceholder = this.emptyContainer;
    }
    else {
      if (!showControls) {
        toggleControls();
      }

      if (showSettings) {
        toggleSettingsMenu(false);
      }

      showOptions = true;
      backgroundContainerHeight = 300;
      this.videoOptionsMenuPlaceholder = this.videoOptionsMenu;
    }
  }

  void toggleSettingsMenu(bool forceClose){
    if(showSettings || forceClose) {
      showSettings = false;
      backgroundContainerHeight = 115;
      this.videoSettingsMenuPlaceholder = this.emptyContainer;
    }
    else {
      if (!showControls) {
        toggleControls();
      }

      if (showOptions) {
        toggleOptionsMenu(false);
      }

      showSettings = true;
      backgroundContainerHeight = 300;
      this.videoSettingsMenuPlaceholder = this.settingsMenu;
    }
  }

  @override
  Widget build(BuildContext context) {
    if(!showControls) {
      return Container();
    }
    else {
      return Container(
        height: 115,
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: HoveringBackButton(),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Begin Bottom controls section
                  Container(
                    height: backgroundContainerHeight,
                    margin: EdgeInsets.only(top: 48),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(192, 33, 36, 43),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin:
                            EdgeInsets.only(top: 10, left: 50, bottom: 70),
                            child: Text(
                              "Skin Care - With Amy Nicole",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "SF Pro Text",
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                letterSpacing: 0.175,
                              ),
                            ),
                          ),
                        ),
                        VideoProgressIndicator(
                          widget.controller,
                          allowScrubbing: true,
                          padding:
                          EdgeInsets.only(left: 50, right: 35, bottom: 50),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 120,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 40, bottom: 0, right: 15),
                                  child: PlayButton(widget.controller),
                                ),
                                InkWell(
                                  onTap: () => setPlaybackState(),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, bottom: 0, right: 15),
                                    child: RewindButton(widget.controller),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => setPlaybackState(),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, bottom: 0, right: 15),
                                    child: FastForwardButton(widget.controller),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 55, bottom: 14, right: 55),
                                  child: TimeDisplay(widget.controller),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () => setPlaybackState(),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, bottom: 0, right: 8),
                                    child: FavoriteButton(),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => setPlaybackState(),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 8, bottom: 0, right: 8),
                                    child:
                                    ClosedCaptionButton(widget.controller),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => setPlaybackState(),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 8, bottom: 0, right: 8),
                                    child:
                                    VideoSettingsButton(widget.controller),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => setPlaybackState(),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 8, bottom: 0, right: 35),
                                    child:
                                    VideoOptionsButton(widget.controller),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 90, bottom: 20),
                            child: videoSettingsMenuPlaceholder,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 50, bottom: 20),
                            child: videoOptionsMenuPlaceholder,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    }

//TODO add onTap handler and animation
}