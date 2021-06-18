
import 'package:farmers_ecommerce2/db/product.dart';
import 'package:farmers_ecommerce2/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier{
  ProductServices _productServices = ProductServices();
  List<ProductModel> products = [];
  List<ProductModel> productsSearched = [];


  ProductProvider.initialize(){
    loadProducts();
  }

  Future loadProducts() async{
    products = await _productServices.getProducts();
    notifyListeners();
  }

  Future search({String productName})async{
    productsSearched = await _productServices.searchProducts(productName: productName);
    notifyListeners();
  }

}