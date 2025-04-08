import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/device/device_utility.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer(
      {super.key,
      required this.text,
      this.icon = Iconsax.search_normal,
      this.showBackground = true,
      this.showBorder = true,
      this.padding =
          const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      this.onChanged});

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          fillColor: showBackground
              ? dark
                  ? TColors.dark
                  : TColors.light
              : Colors.transparent,
          prefixIcon: Icon(
            icon,
            color: dark ? TColors.darkGrey : Colors.grey,
          ),
          hintText: 'Search in Store',
        ),
        onChanged: onChanged,
      ),
    );
    // return GestureDetector(
    //   onTap: onTap,
    //   child: Padding(
    //     padding: padding,
    //     child: Container(
    //       width: TDeviceUtils.getScreenWidth(context),
    //       padding: const EdgeInsets.all(TSizes.md),
    //       decoration: BoxDecoration(
    //         color: showBackground
    //             ? dark
    //                 ? TColors.dark
    //                 : TColors.light
    //             : Colors.transparent,
    //         borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
    //         border: showBorder ? Border.all(color: TColors.grey) : null,
    //       ),
    //       child: Row(
    //         children: [
    //           Icon(
    //             icon,
    //             color: dark ? TColors.darkGrey : Colors.grey,
    //           ),
    //           const SizedBox(
    //             width: TSizes.spaceBtwItems,
    //           ),
    //           Text(
    //             text,
    //             style: Theme.of(context).textTheme.bodySmall,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
