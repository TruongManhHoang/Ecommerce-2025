import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/features/shop/models/order_model.dart';
import 'package:ecommerce_app/features/shop/screens/order/widgets/card_product_order_item.dart';
import 'package:ecommerce_app/features/shop/screens/order/widgets/card_support.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Detail',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: dark ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                decoration: BoxDecoration(
                  color: dark ? Colors.grey[800] : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: dark ? Colors.black54 : Colors.grey[300]!,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: dark ? Colors.white : Colors.black,
                              ),
                    ),
                    const Gap(TSizes.spaceBtwItems),
                    Row(
                      children: [
                        Icon(
                          Iconsax.location,
                          size: 20,
                        ),
                        const Gap(TSizes.spaceBtwItems),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${controller.user.value.fullName}, ${orderModel.address!.phoneNumber}'),
                              Text(
                                '${orderModel.address!.street}, ${orderModel.address!.name}, ${orderModel.address!.city}, ${orderModel.address!.country}',
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Gap(TSizes.spaceBtwSections),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  'Order Delivery Successfully',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),

              ///Order ID
              Container(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                decoration: BoxDecoration(
                  color: dark ? Colors.grey[800] : Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: dark ? Colors.black54 : Colors.grey[300]!,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order ID',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          orderModel.id,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    const Gap(TSizes.spaceBtwItems),
                    CardProductOrderItem(orderModel: orderModel, dark: dark),
                  ],
                ),
              ),
              const Gap(TSizes.spaceBtwSections),
              CardSupport(
                dark: dark,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => const NavigationMenu());
            },
            child: Text(
              'Buy Again',
              style: Theme.of(context).textTheme.bodyLarge,
            )),
      ),
    );
  }
}
