import 'package:flutter/material.dart';

class RatingStars extends StatefulWidget {

  double ratings;

  RatingStars({Key key, this.ratings}) : super(key: key);

  @override
  RatingStarsState createState() => RatingStarsState();
}

class RatingStarsState extends State<RatingStars> {

  @override
  Widget build(BuildContext context) {
    return Container (
        width : 120,
//height: 16,
//margin: EdgeInsets.only(left: 16, top: 25),
        child : Row (
          children : createStars(),
        ),
      );
  }

  List<Widget> createStars(){
    List<Widget> stars = new List();

    if(widget.ratings > 5)
      widget.ratings = 5;
    else if (widget.ratings < 0)
      widget.ratings = 0;

    for( int i = 0; i < 5; i++ ) {
      if( (widget.ratings.truncate()) > i ) {
          //draw whole colors star
          Widget star = Expanded(
            child: IconButton(
              icon: Icon(
                  Icons.star
              ),
              iconSize: 18.0,
              color: Color(0xFFD31675),
              onPressed: () => setState(() {widget.ratings = (i+1).toDouble();} ),
            ),
          );
          stars.add(star);
        }
        else if(widget.ratings.truncate() == i && (widget.ratings - widget.ratings.truncate()) > 0.0) {  //draw half star
          Widget star = Expanded(
            child: IconButton(
              icon: Icon(
                  Icons.star_half
              ),
              iconSize: 18.0,
              color: Color(0xFFD31675),
              onPressed: () => setState(() {widget.ratings = (i+1).toDouble();} ),
            ),
          );
          stars.add(star);
      }
      else {
        Widget star = Expanded(
          child: IconButton(
            icon: Icon(
                Icons.star_border
            ),
            iconSize: 18.0,
            color: Color(0xFFD31675),
            onPressed: () => setState(() {widget.ratings = (i+1).toDouble();} ),
          ),
        );
        stars.add(star);
      }
    }

    return stars;
  }

}
