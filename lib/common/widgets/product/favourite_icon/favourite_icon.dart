import 'package:ecommerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:ecommerce_app/features/shop/controller/product/favorites_product_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesProductController());
    return Obx(() => TCircularIcon(
          icon: controller.isFavourite(productModel.id)
              ? Iconsax.heart5
              : Iconsax.heart,
          color: controller.isFavourite(productModel.id) ? TColors.error : null,
          onPressed: () => controller.toggleFavourite(productModel),
        ));
  }
}
