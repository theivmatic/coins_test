part of 'coins_bloc.dart';

@immutable
sealed class CoinsEvent {}

class GetCoinsEvent extends CoinsEvent {
  final int? take;
  final int? skip;

  GetCoinsEvent({this.take, this.skip});
}
