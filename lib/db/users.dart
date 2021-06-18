import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:farmers_ecommerce2/models/cart_item.dart';
import 'package:farmers_ecommerce2/models/user.dart';

class UserServices{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String ref = "users";

  void createUser(Map data) {
    _firestore.collection(ref).doc(data["userId"]).set(data);
    print("USER WAS CREATED");
  }

  Future<UserModel> getUserById(String id)=> _firestore.collection(ref).doc(id).get().then((doc){
    return UserModel.fromSnapshot(doc);
  });

  void addToCart({String userId, CartItemModel cartItem}){
    _firestore.collection(ref).doc(userId).update({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userId, CartItemModel cartItem}){
    _firestore.collection(ref).doc(userId).update({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }

}