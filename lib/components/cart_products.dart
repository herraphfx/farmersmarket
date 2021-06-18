import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {

  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DocumentSnapshot> products = <DocumentSnapshot>[];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: products.length,itemBuilder: (context,index){
      return Single_cart_product(
        cart_prod_name: products[index]['name'],
        cart_prod_picture: products[index]['picture'],
        cart_prod_price: products[index]['price'],
        cart_prod_quantity: products[index]['quantity'],
        cart_prod_type: products[index]['brand'],
      );
    });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;

  final cart_prod_price;
  final cart_prod_type;
  final cart_prod_quantity;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_type,
    this.cart_prod_quantity,

  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //===LEADING SECTION===
        leading: Image.asset(cart_prod_picture, ),

        //===TITLE SECTION====
        title: Text(cart_prod_name),
        //==SUBTITLE SECTION===
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text('Vendor'),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text('${cart_prod_type}', style: TextStyle(color: Colors.green),),
                ),
                //===This is for product quantity===
                Padding(padding: const EdgeInsets.fromLTRB(15, 6.0, 3.0, 6.0),
                  child: Text('Quantity'),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${cart_prod_quantity}', style: TextStyle(color: Colors.green), ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text('\₦${cart_prod_price}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),),
            ),
          ],
        ),
        trailing: new Column(

          children: <Widget>[
            Expanded( child: IconButton(icon: Icon(Icons.arrow_drop_up,), onPressed: (){}),
            ),

            SizedBox(
              height: 14,
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: new Text('${cart_prod_quantity}', style: TextStyle(fontSize: 12),),
              ),
            ),
            Expanded(child: new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){})),
          ],
        ),
      ),
    );
  }
}

