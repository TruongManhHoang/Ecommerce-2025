import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controller/category_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/category_brand.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCategoryTab extends StatefulWidget {
  const TCategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  State<TCategoryTab> createState() => _TCategoryTabState();
}

class _TCategoryTabState extends State<TCategoryTab> {
  final categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              CategoryBrands(category: widget.category),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: TVerticalProductShimmer());
                }

                if (controller.productForCategories.isEmpty) {
                  return const Center(child: Text('Don\'t have product!'));
                }
                return Column(
                  children: [
                    TSectionHeading(
                      title: 'You might like',
                      onPressed: () => Get.to(AllProducts(
                        title: widget.category.name,
                        futureMethod: controller.getCategoryProducts(
                            categoryId: widget.category.id),
                      )),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Obx(() {
                      return TGridLayout(
                        itemCount: controller.productForCategories.length,
                        itemBuilder: (_, index) => TProductCardVertical(
                          product: controller.productForCategories[index],
                        ),
                      );
                    })
                  ],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
