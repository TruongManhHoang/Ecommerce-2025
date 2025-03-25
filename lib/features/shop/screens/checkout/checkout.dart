import 'package:dio/dio.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/product/cart/coupon_widget.dart';
import 'package:ecommerce_app/data/service/stripe_sevice.dart';
import 'package:ecommerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/controller/product/order_controller.dart';
import 'package:ecommerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:ecommerce_app/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = OrderController.instance;
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'US');
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            'Order Review',
            style: Theme.of(context).textTheme.headlineSmall,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Items in cart
              const TCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Coupon TextField
              const TCouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    ///Pricing
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Divider
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Payment Method
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Address
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      ///Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () async {
            // final paymentSuccess =
            //     await StripeService.instance.initializePaymentSheet(
            //   totalAmount.toInt().toString(),
            //   "USD",
            // );

            // if (paymentSuccess) {
            //   return orderController.processOrder(totalAmount);
            // }
            handlePayment(totalAmount, 0);
          },
          child: Text('Checkout ${totalAmount.toString()}'),
        ),
      ),
    );
  }

  void handlePayment(double total, double coupon) async {
    String? paymentIntent = await StripeService.instance
        .makePayment(200 - coupon); //dang truyen 200000 mà

    if (paymentIntent != null) {
      try {
        await Stripe.instance.presentPaymentSheet();
      } catch (e) {
        if (e is StripeException) {
          print("Lỗi Stripe: ${e.error.localizedMessage}");
        } else {
          print("Lỗi không xác định: $e");
        }
        // TODO: Xử lý lỗi khi thanh toán thất bại, hiển thị thông báo cho người dùng
      }
    } else {
      print("Không thể khởi tạo thanh toán!");
    }
  }
}
