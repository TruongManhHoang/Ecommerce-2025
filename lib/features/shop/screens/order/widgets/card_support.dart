import 'package:flutter/material.dart';

class CardSupport extends StatelessWidget {
  const CardSupport({super.key, required this.dark});
  final bool dark;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          ListTile(
            leading: const Icon(Icons.support_agent),
            title: Text(
              'Support',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Text(
              'Need help? Contact our support team.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Contact Us',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle contact us action
            },
          ),
        ],
      ),
    );
  }
}
