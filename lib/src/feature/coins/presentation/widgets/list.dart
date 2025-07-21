import 'dart:math';

import 'package:coin_cap_test/src/feature/coins/domain/entities/data.dart';
import 'package:coin_cap_test/src/feature/coins/presentation/widgets/tile.dart';
import 'package:flutter/material.dart';

Color generateRandomColor() {
  final random = Random();
  int red = random.nextInt(256);
  int green = random.nextInt(256);
  int blue = random.nextInt(256);

  return Color.fromRGBO(red, green, blue, 1.0);
}

class CoinsListWidget extends StatelessWidget {
  // final ResponseEntity data;

  const CoinsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // itemCount: data.data?.length,
      itemCount: 3,
      separatorBuilder: (context, index) => SizedBox(height: 28),
      itemBuilder:
          (context, index) => CoinTileWidget(
            color: generateRandomColor(),
            // name: data.data?[index].name ?? '',
            name: 'BTC',
            // price: data.data?[index].priceUsd ?? '',
            price: '1200',
          ),
    );
  }
}
