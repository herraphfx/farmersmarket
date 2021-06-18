import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_ecommerce2/models/product.dart';


class ProductServices {
  String collection = "products";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProducts() async {
    QuerySnapshot result= await _firestore.collection(collection).get();
    List<ProductModel> products = [];
    for (DocumentSnapshot product in result.docs) {
      products.add(ProductModel.fromSnapshot(product));
    }
    return products;
  }



  Future<List<ProductModel>> searchProducts({String productName}) {
    // code to convert the first character to uppercase
    String searchKey = productName[0].toUpperCase() + productName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .get()
        .then((result) {
      List<ProductModel> products = [];
      for (DocumentSnapshot product in result.docs) {
        products.add(ProductModel.fromSnapshot(product));
      }
      return products;
    });
  }
}
