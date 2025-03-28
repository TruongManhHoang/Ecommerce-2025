import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce_app/features/shop/controller/product/favorites_product_controller.dart';
import 'package:ecommerce_app/features/shop/screens/home/home.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.put(FavouritesProductController());
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: favoritesController.getFavouriteProducts(),
            builder: (context, snapshot) {
              final emptyWidget = TAnimationLoaderWidget(
                text: 'Whoops! Favorite is Empty...',
                animation: TImages.cartAnimation,
                showAction: true,
                actionText: 'Let\'s fill it',
                onActionPressed: () => Get.offAll(() => const NavigationMenu()),
              );

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const TVerticalProductShimmer(itemCount: 6);
              }

              if (snapshot.hasError) {
                return const Center(child: Text('Lỗi khi tải dữ liệu'));
              }

              final products = snapshot.data ?? [];

              if (products.isEmpty) {
                return emptyWidget;
              }

              return SingleChildScrollView(
                child: TGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) =>
                      TProductCardVertical(product: products[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
