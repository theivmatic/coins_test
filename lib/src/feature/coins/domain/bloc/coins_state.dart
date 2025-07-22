part of 'coins_bloc.dart';

@immutable
sealed class CoinsState extends Equatable {
  ResponseEntity? get data;
  bool? get isLoading;
  String? get errorMessage;

  @override
  List<Object?> get props => [data, isLoading, errorMessage];

  CoinsState copyWith({
    ResponseEntity? data,
    bool? isLoading,
    String? errorMessage,
  });
}

final class CoinsInitialState extends CoinsState {
  @override
  final ResponseEntity? data;
  @override
  final bool? isLoading;
  @override
  final String? errorMessage;

  CoinsInitialState({this.data, this.isLoading, this.errorMessage});

  @override
  CoinsState copyWith({
    ResponseEntity? data,
    bool? isLoading,
    bool? isLoadingNext,
    String? errorMessage,
  }) => CoinsInitialState(
    data: data ?? this.data,
    isLoading: isLoading ?? this.isLoading,
    errorMessage: errorMessage,
  );
}
