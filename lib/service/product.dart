import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static var db = FirebaseFirestore.instance;

  static Future<List<Product>> getProducts(int pageKey, int pageSize) async {
    var url =
        'https://api.escuelajs.co/api/v1/products?offset=${pageKey}&limit=$pageSize';
    var res = await http.get(
      Uri.parse(
        url,
      ),
    );
    var data = jsonDecode(res.body) as List;

    var products =
        data.map((a) => Product.fromJSON(a)).toList().cast<Product>();
    return products;
  }

  static getFavorites(String uid) =>
      db.collection('users').doc(uid).collection('favorites');

  static Future<void> saveProduct(String uid, Product product) {
    return db
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc('${product.id}')
        .set(product.toJson());
  }

  static Future<void> deleteProduct(String uid, Product product) {
    return db
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc('${product.id}')
        .delete();
  }
}
