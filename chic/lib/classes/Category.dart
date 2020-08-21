import 'package:chic/interfaces/RenderableItem.dart';

class Category extends RenderableItem {
String categoryName;
String categorySubName;
String id;

Category( String _id, String _categoryName, String _categorySubName ) {
  this.id = _id;
  this.categoryName = _categoryName;
  this.categorySubName = _categorySubName;

  this.title = this.categoryName;
  this.subHeading = this.categorySubName;
}
}