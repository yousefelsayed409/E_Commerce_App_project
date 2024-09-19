import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/models/product_model.dart';
import '../../../core/utils/constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    super.key,
    required this.ppproduct,
  });

  final ProductModel ppproduct;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(
          //   "${ppproduct.rating}",
          //   style: TextStyle(color: Colors.white),
          // ),
          Text(
            ppproduct.name!,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: const TextSpan(
                  children: [
                    // TextSpan(
                    //     text: "  Price\n",
                    //     style: TextStyle(color: Colors.black)),
                    // TextSpan(
                    //   text: "\$${ppproduct.price}",
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .headlineSmall!
                    //       .copyWith(
                    //           color: Colors.black, fontWeight: FontWeight.bold),
                    // ),
                  ],
                ),
              ),
              const SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${ppproduct.id}",
                  child: Image.network(
                    ppproduct.image!,
                    height: 180,
                    width: 30,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class productimage extends StatelessWidget {
  const productimage({
    super.key,
    required this.ppprouduct,
  });
  final ProductModel ppprouduct;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${ppprouduct.id}',
      child: CachedNetworkImage(
        height: 120.h,
        width: 120.w,
        imageUrl: '${ppprouduct.image}',
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const Center(child: CupertinoActivityIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
