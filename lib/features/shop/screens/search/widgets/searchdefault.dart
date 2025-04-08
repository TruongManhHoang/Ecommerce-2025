import 'package:ecommerce_app/features/shop/controller/product/product_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Searchdefault extends StatelessWidget {
  const Searchdefault({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Thêm Expanded vào đây để tránh overflow
        Expanded(
          child: ListView.separated(
            itemCount: controller.historySearch.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
                child: Text(controller.historySearch[index]),
              );
            },
            separatorBuilder: (_, __) => const Gap(10),
          ),
        ),
      ],
    );
  }
}
