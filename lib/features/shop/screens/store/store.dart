import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/appbar/tab_bar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/container/search_container.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/brands/brand_cart.dart';
import 'package:ecommerce_app/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:ecommerce_app/common/widgets/shimmer/brand_shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controller/brand_controller.dart';
import 'package:ecommerce_app/features/shop/controller/category_controller.dart';
import 'package:ecommerce_app/features/shop/screens/brand/all_brands.dart';
import 'package:ecommerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/product_detail.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final categoryController = Get.put(CategoryController());
  final brandController = Get.put(BrandController());

  @override
  void initState() {
    super.initState();
    // Gọi API lấy sản phẩm của danh mục đầu tiên khi vào màn
    if (CategoryController.instance.featuredCategories.isNotEmpty) {
      categoryController.getCategoryProducts(
        categoryId: CategoryController.instance.featuredCategories.first.id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: const [TCartCounterIcon()],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: "Search in Store",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      TSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      Obx(() {
                        if (brandController.isLoading.value) {
                          return const TBrandShimmer();
                        }
                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                            child: Text(
                              'No Data Found!',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: Colors.white),
                            ),
                          );
                        }
                        return TGridLayout(
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return TBrandCart(
                              showBorder: true,
                              brand: brand,
                              onTap: () =>
                                  Get.to(() => BrandProducts(brand: brand)),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
                bottom: TTabBar(
                  tabs: categories.map((category) {
                    return Tab(child: Text(category.name));
                  }).toList(),
                  onTap: (index) async {
                    await categoryController.getCategoryProducts(
                      categoryId: categories[index].id,
                    );
                  },
                ),
              )
            ];
          },
          body: Obx(() {
            if (categoryController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (categoryController.productForCategories.isEmpty) {
              return const Center(child: Text('No Data Found!'));
            }

            return ListView.builder(
              itemCount: categoryController.productForCategories.length,
              itemBuilder: (_, index) {
                final product = categoryController.productForCategories[index];
                return ListTile(
                  leading: Image.network(product.images![0]),
                  title: Text(product.title),
                  subtitle: Text("\$${product.price}"),
                  onTap: () {
                    Get.to(() => ProductDetailScreen(product: product));
                  },
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
