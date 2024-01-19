import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/pages/product/detail.dart';
import 'package:e_commerce/theme/color.dart';
import 'package:e_commerce/theme/text_style.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product productCard;
  final Size size;

  const ProductCard({
    super.key,
    required this.productCard,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    var h = size.height * 0.19;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ProductDetail(
            product: productCard,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: Key(productCard.id.toString()),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: h,
                width: h,
                imageUrl: productCard.images.first,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: size.width * 0.4,
            child: Text(
              productCard.title,
              overflow: TextOverflow.ellipsis,
              style: smallText(primaryWhite),
            ),
          ),
          Text(
            '\$${productCard.price}',
            style: smallBold(primaryWhite),
          ),
        ],
      ),
    );
  }
}
