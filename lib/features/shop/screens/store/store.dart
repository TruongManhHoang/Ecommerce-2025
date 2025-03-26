import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
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
import 'package:ecommerce_app/features/shop/screens/store/widgets/category_brand.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen>
    with SingleTickerProviderStateMixin {
  final categoryController = Get.put(CategoryController());
  final brandController = Get.put(BrandController());

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    final categories = categoryController.featuredCategories;

    _tabController = TabController(length: categories.length, vsync: this);

    // Gọi API khi tab thay đổi
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        final selectedCategory = categories[_tabController.index];
        categoryController.getCategoryProducts(categoryId: selectedCategory.id);
      }
    });

    // Gọi API danh mục đầu tiên khi vào màn hình
    if (categories.isNotEmpty) {
      categoryController.getCategoryProducts(categoryId: categories.first.id);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = categoryController.featuredCategories;

    return Scaffold(
      appBar: TAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: const [TCartCounterIcon()],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
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
                        onTap: () => Get.to(() => BrandProducts(brand: brand)),
                      );
                    },
                  );
                }),

                /// TabBar cố định
                TabBar(
                  tabAlignment: TabAlignment.start,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  controller: _tabController,
                  tabs: categories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ],
            ),
          ),
          const Gap(10),

          /// Expanded để nội dung cuộn được
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: categories.map((category) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(), // Cuộn mượt
                  child: Obx(() {
                    if (categoryController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return TCategoryTab(category: category);
                  }),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
