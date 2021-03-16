import 'package:weather_app/models/climate.dart';
import 'package:meta/meta.dart';

@immutable
class ClimateState {
  final bool isError;
  final bool isLoading;
  final Climate climate;

  ClimateState({this.isError, this.isLoading, this.climate});

  factory ClimateState.initial() =>
      ClimateState(isError: false, isLoading: false, climate: null);

  ClimateState copyWith({bool isError, bool isLoading, Climate climate}) =>
      ClimateState(
          isError: isError ?? this.isError,
          isLoading: isLoading ?? this.isLoading,
          climate: climate ?? this.climate);
}
