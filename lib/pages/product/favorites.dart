import 'package:e_commerce/components/product_card.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/service/auth.dart';
import 'package:e_commerce/service/product.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_paginate_firestore/paginate_firestore.dart';

class FavoriteProducts extends StatelessWidget {
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var user = AuthService.getCurrentUser()!;

    return SafeArea(
      bottom: false,
      maintainBottomViewPadding: false,
      child: PaginateFirestore(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, snapshots, index) {
          var snap = snapshots[index];
          var product = Product.fromJSON(snap.data() as dynamic);

          return ProductCard(
            productCard: product,
            size: size,
          );
        },
        query: ProductService.getFavorites(user.uid),
        itemBuilderType: PaginateBuilderType.gridView,
      ),
    );
  }
}
