import 'package:flutter/widgets.dart';

abstract class RenderableItem  {
  String title;
  String subHeading;
  String shortDescription;
  String thumbnailUrl;
  String posterUrl;

  bool imageSourcesLocal = false;

  Widget target;
}