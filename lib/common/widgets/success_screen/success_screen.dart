import 'package:ecommerce_app/common/styles/spacing_styles.dart';
import 'package:ecommerce_app/features/shop/screens/order/widgets/dialog_review.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPress});
  final String image, title, subTitle;
  final VoidCallback onPress;

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      DialogReview.showReviewDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Lottie.asset(widget.image,
                  width: MediaQuery.of(context).size.width * 0.6),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                widget.subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.onPress,
                  child: const Text(TTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
