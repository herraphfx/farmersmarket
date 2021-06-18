import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(image_location: 'images/category/tractor.png',
              image_caption: 'Machinery'),
          Category(image_location: 'images/category/supplement.png',
              image_caption: 'Supplement'),
          Category(image_location: 'images/category/poultry.png',
              image_caption: 'Poultry'),
          Category(image_location: 'images/category/fertilizer.png',
              image_caption: 'Fertilizer'),
          Category(image_location: 'images/category/drink.png',
              image_caption: 'Drinks'),





        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(2.0),
      child: InkWell( onTap: (){},
        child: Container(
          width: 80.0,
          child: ListTile(
              title: Image.asset(image_location, width: 40.0, height: 40.0,),

              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(image_caption, style: TextStyle(fontSize: 14),),
              )
          ),
        ),

      ),);
  }
}

