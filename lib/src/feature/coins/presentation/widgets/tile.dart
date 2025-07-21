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
          decoration: BoxDecoration(color: color),
          child: SizedBox(width: 56, height: 56),
        ),
        SizedBox(width: 16),
        Text(name.toUpperCase()),
        const Spacer(),
        Text(price),
      ],
    );
  }
}
