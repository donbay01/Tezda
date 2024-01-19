import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/service/auth.dart';
import 'package:e_commerce/service/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var user = AuthService.getCurrentUser()!;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: Key(product.id.toString()),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: product.images.first,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(
                value: downloadProgress.progress,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 18,
                ),
                Text(product.title),
                const SizedBox(
                  height: 10,
                ),
                Text(product.description),
                IconButton(
                  onPressed: () => ProductService.saveProduct(
                    user.uid,
                    product,
                  ),
                  icon: const Icon(IconlyLight.heart),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
