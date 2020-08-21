import 'package:chic/interfaces/RenderableItem.dart';

class Artist extends RenderableItem {
  String artistName;
  String id;

  Artist( String _id, String _artistName ) {
    this.id = _id;
    this.artistName = _artistName;
  }
}