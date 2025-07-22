import 'dart:async';

import 'package:coin_cap_test/src/feature/coins/domain/entities/data.dart';
import 'package:coin_cap_test/src/feature/coins/domain/repo/coins_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'coins_event.dart';
part 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  final CoinsRepository _coinRepository;

  CoinsBloc(this._coinRepository) : super(CoinsInitialState()) {
    on<CoinsEvent>(
      (event, emit) => switch (event) {
        GetCoinsEvent() => _getCoins(event, emit),
      },
    );
  }

  FutureOr<void> _getCoins(
    GetCoinsEvent event,
    Emitter<CoinsState> emit,
  ) async {
    emit(state.copyWith(isLoading: (event.skip ?? 0) == 0, errorMessage: null));
    try {
      final data = await _coinRepository.getCoins(
        take: event.take,
        skip: event.skip,
      );
      if ((data.data ?? []).isNotEmpty) {
        if ((event.skip ?? 0) > 0) {
          final coins = state.data?.data ?? [];
          coins.addAll(data.data ?? []);
          emit(
            state.copyWith(
              data: state.data?.copyWith(data: coins),
              isLoading: false,
            ),
          );
        } else {
          emit(state.copyWith(data: data, isLoading: false));
        }
      }
      event.onFinish?.call((data.data?.length ?? 0) < 10 ? false : true);
    } on Exception catch (e) {
      event.onFinish?.call(false);
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
