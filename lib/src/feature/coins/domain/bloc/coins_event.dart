part of 'coins_bloc.dart';

@immutable
sealed class CoinsEvent {}

class GetCoinsEvent extends CoinsEvent {
  final int? take;
  final int? skip;
  final Function(bool)? onFinish;

  GetCoinsEvent({this.take, this.skip, this.onFinish});
}
