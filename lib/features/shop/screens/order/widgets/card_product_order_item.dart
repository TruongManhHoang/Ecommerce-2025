import 'package:ecommerce_app/features/shop/models/order_model.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardProductOrderItem extends StatelessWidget {
  const CardProductOrderItem(
      {super.key, required this.orderModel, required this.dark});
  final OrderModel orderModel;
  final bool dark;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: orderModel.items.length,
          itemBuilder: (_, index) {
            final item = orderModel.items[index];
            return Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: dark ? Colors.grey : Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: dark ? Colors.grey : Colors.white,
                              ),
                              child: Image.network('${item.image}',
                                  fit: BoxFit.contain),
                            ),
                          ),
                          const Gap(TSizes.spaceBtwItems),
                          Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.title),
                                  Text.rich(TextSpan(
                                      children: (item.selectedVariation ?? {})
                                          .entries
                                          .map((e) => TextSpan(children: [
                                                TextSpan(
                                                    text: ' ${e.key} ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall),
                                                TextSpan(
                                                    text: '${e.value} ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge),
                                              ]))
                                          .toList())),
                                  const Gap(TSizes.spaceBtwItems),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'x${item.quantity}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      Text(
                                        '${item.price}\$',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(TSizes.spaceBtwItems),
              ],
            );
          },
        ),
        Divider(
          color: dark ? Colors.grey : Colors.grey.shade300,
          thickness: 1,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Total: ${orderModel.totalAmount}\$',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
