import 'package:coin_cap_test/src/core/theme/text.dart';
import 'package:flutter/material.dart';

class CoinTileWidget extends StatelessWidget {
  final Color color;
  final String name;
  final String price;

  const CoinTileWidget({
    super.key,
    required this.color,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(18),
          ),
          child: SizedBox(width: 56, height: 56),
        ),
        SizedBox(width: 16),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(name.toUpperCase(), style: AppText.text),
        ),
        const Spacer(),
        Text('\$$price', style: AppText.text),
      ],
    );
  }
}
