import 'package:coin_cap_test/src/core/theme/text.dart';
import 'package:coin_cap_test/src/feature/coins/domain/bloc/coins_bloc.dart';
import 'package:coin_cap_test/src/feature/coins/presentation/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsView extends StatefulWidget {
  const CoinsView({super.key});

  @override
  State<CoinsView> createState() => _CoinsViewState();
}

class _CoinsViewState extends State<CoinsView> {
  @override
  void initState() {
    super.initState();

    // context.read<CoinsBloc>().add(GetCoinsEvent(take: 15, skip: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COINS', style: AppText.text.copyWith(fontSize: 20)),
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<CoinsBloc, CoinsState>(
          builder: (context, state) {
            if (state.isLoading ?? false) {
              return Center(child: CircularProgressIndicator());
            }
            // if (state.data != null) {
            return CoinsListWidget();
            // } else {
            // return SizedBox();
            // }
          },
        ),
      ),
    );
  }
}
