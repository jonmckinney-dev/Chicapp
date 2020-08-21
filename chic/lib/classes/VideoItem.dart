import 'package:chic/interfaces/RenderableItem.dart';

class VideoItem extends RenderableItem {

  String id;

  VideoItem( String _id, String _title ) {
    this.id = _id;
    this.title = _title;
  }

  /*
  VideoItem._builder(VideoItemBuilder builder) :
    id = builder.id,
    title = builder.title,
    shortDescription = builder.shortDescription,
    thumbnailUrl = builder.thumbnailUrl,
    posterUrl = builder.posterUrl;

   */
}

class VideoItemBuilder {
  String id;
  String title;
  String shortDescription;
  String thumbnailUrl;
  String posterUrl;

  void withId(String _id){
    this.id = _id;
  }

  void withTitle( String _title ) {
    this.title = title;
  }

  void withShortDescription(String _shortDesc){
    this.shortDescription = _shortDesc;
  }

  void withThumbnailUrl(String _url){
    this.thumbnailUrl = _url;
  }

  void withPosterUrl(String _url){
    this.posterUrl = _url;
  }

  /*
  VideoItem build() {
    return VideoItem._builder(this);
  }
  */
}