import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/features/shop/controller/product/product_controller.dart';
import 'package:ecommerce_app/features/shop/screens/search/widgets/searchdefault.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              onFieldSubmitted: (value) {
                controller
                    .filterSearchProducts(value); // Gọi hàm khi nhấn Enter
              },
              decoration: InputDecoration(
                hintText: 'Search in Store',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const Gap(TSizes.spaceBtwItems),
            Expanded(
              child: Obx(
                () => controller.searchQuery.value.isNotEmpty
                    ? controller.searchProducts.isNotEmpty
                        ? TGridLayout(
                            itemCount: controller.searchProducts.length,
                            itemBuilder: (context, index) {
                              return TProductCardVertical(
                                product: controller.searchProducts[index],
                              );
                            },
                          )
                        : const Center(
                            child: Text(
                              'Product is empty',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                    : const Searchdefault(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
