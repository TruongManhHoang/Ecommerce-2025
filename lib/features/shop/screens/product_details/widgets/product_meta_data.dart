import 'package:ecommerce_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/images/t_circular_image.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_app/features/shop/controller/product/product_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ///Price Sale Price
      Row(
        children: [
          ///Price
          if (product.productType == ProductType.single.toString() &&
              product.salePrice > 0)
            Text(
              '\$${product.price}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
          if (product.productType == ProductType.single.toString() &&
              product.salePrice > 0)
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
          TProductPriceText(
            price: controller.getProductPrice(product),
            isLarge: true,
          ),
        ],
      ),
      const SizedBox(
        height: TSizes.spaceBtwItems / 1.5,
      ),

      ///Title

      TProductTitleText(title: product.title),
      const SizedBox(
        height: TSizes.spaceBtwItems / 1.5,
      ),

      ///Stock Status

      Row(
        children: [
          const TProductTitleText(title: 'Status'),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          Text(
            controller.getProductStockStatus(product.stock),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
      const SizedBox(
        height: TSizes.spaceBtwItems,
      ),

      ///Brand
      Row(
        children: [
          TCircularImage(
            image: product.brand != null ? product.brand!.image : '',
            width: 32,
            height: 32,
          ),
          TBrandTitleTextWithVerifiedIcon(
            title: product.brand != null ? product.brand!.name : '',
            brandTextSize: TextSizes.medium,
          ),
        ],
      ),
    ]);
  }
}
