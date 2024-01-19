import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/service/auth.dart';
import 'package:e_commerce/service/product.dart';
import 'package:e_commerce/theme/color.dart';
import 'package:e_commerce/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../components/snackbar.dart';

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
      backgroundColor: scaffoldBlack,
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 18,
                ),
                Text(product.title,style: mediumText(primaryYellow),),
                const SizedBox(
                  height: 10,
                ),
                Text(product.description,style: smallText(primaryWhite),),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        ProductService.saveProduct(
                          user.uid,
                          product,
                        );
                        SnackbarHelper.displayToastMessage(
                          context: context,
                          message: 'Added to Favorites',
                        );
                      },
                      icon: const Icon(IconlyLight.heart,color: Colors.red,),
                    ),
                    SizedBox(width: 10,),
                    Text('Add to Favorites',style: smallText(primaryWhite),)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
