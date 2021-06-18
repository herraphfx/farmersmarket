import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<DocumentSnapshot> products = <DocumentSnapshot>[];
  var product_list = [{
    "name": "Cattle",
    "picture": "images/products/cow.jpg",
    "old_price": "120",
    "price": "85",

  },
    {
      "name": "Cat Fish",
      "picture": "images/products/fish.jpg",
      "old_price": "100",
      "price": "65",

    },

    {
      "name": "Turkey",
      "picture": "images/products/turkey.jpg",
      "old_price": "1050",
      "price": "750",

    },
    {
      "name": "Chicken",
      "picture": "images/products/chicken.jpg",
      "old_price": "2100",
      "price": "650",

    },

    {
      "name": "Jackal",
      "picture": "images/products/silver.jpg",
      "old_price": "2100",
      "price": "650",

    },
    {
      "name": "Goat",
      "picture": "images/products/goat.jpg",
      "old_price": "2100",
      "price": "650",

    }
  ];
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_picture: product_list[index]['picture'],
              prod_oldprice: product_list[index]['old_price'],
              prod_price: product_list[index]['price'],
            ),
          );
        });
  }
}
//Product Details
class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_oldprice;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_oldprice,
    this.prod_price
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(


        ),
      ),
    );
  }
}

