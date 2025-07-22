import 'dart:math';
import 'package:coin_cap_test/src/core/widgets/app_loader.dart';
import 'package:coin_cap_test/src/feature/coins/domain/bloc/coins_bloc.dart';
import 'package:coin_cap_test/src/feature/coins/domain/entities/data.dart';
import 'package:coin_cap_test/src/feature/coins/presentation/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsListWidget extends StatefulWidget {
  final ResponseEntity? data;

  const CoinsListWidget({super.key, required this.data});

  @override
  State<CoinsListWidget> createState() => _CoinsListWidgetState();
}

class _CoinsListWidgetState extends State<CoinsListWidget> {
  final _scrollController = ScrollController();
  bool isNextPageAvailable = true;
  bool isLoadingNextPage = false;

  void _onScroll() {
    if (_scrollController.position.pixels + 100 >
        _scrollController.position.maxScrollExtent) {
      final state = context.read<CoinsBloc>().state;
      if (!isLoadingNextPage && isNextPageAvailable) {
        isLoadingNextPage = true;
        context.read<CoinsBloc>().add(
          GetCoinsEvent(
            take: 15,
            skip: state.data?.data?.length,
            onFinish: (isAvailable) {
              Future.delayed(Duration(milliseconds: 200), () {
                isLoadingNextPage = false;
                isNextPageAvailable = isAvailable;
                setState(() {});
              });
            },
          ),
        );
      }
    }
  }

  Color generateRandomColor() {
    final random = Random();
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);

    return Color.fromRGBO(red, green, blue, 1.0);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.separated(
          itemCount: widget.data?.data?.length ?? 0,
          separatorBuilder: (context, index) => SizedBox(height: 28),
          controller: _scrollController,
          itemBuilder:
              (context, index) => CoinTileWidget(
                color: generateRandomColor(),
                name: widget.data?.data?[index].name ?? '',
                price: double.parse(
                  widget.data?.data?[index].priceUsd ?? '',
                ).toStringAsFixed(2),
              ),
        ),

        isLoadingNextPage
            ? DecoratedBox(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
              child: AppLoaderWidget(),
            )
            : SizedBox(),
      ],
    );
  }
}
