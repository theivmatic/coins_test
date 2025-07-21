import 'package:coin_cap_test/src/feature/coins/domain/entities/data.dart';
import 'package:coin_cap_test/src/feature/coins/presentation/widgets/tile.dart';
import 'package:flutter/material.dart';

class CoinsListWidget extends StatelessWidget {
  final ResponseEntity data;

  const CoinsListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.data?.length,
      itemBuilder:
          (context, index) => CoinTileWidget(
            color: Colors.black,
            name: data.data?[index].name ?? '',
            price: data.data?[index].priceUsd ?? '',
          ),
    );
  }
}
