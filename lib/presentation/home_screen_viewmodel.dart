import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:weather_app/models/climate.dart';
import 'package:weather_app/redux/climate/climate_action_creator.dart';
import 'package:weather_app/redux/store.dart';

@immutable
class HomeScreenViewModel extends Equatable {
  HomeScreenViewModel(
      {this.climate, this.isLoading, this.isError, this.fetchWeatherData});

  final Climate climate;
  final bool isLoading;
  final bool isError;

  final Function(String) fetchWeatherData;

  @override
  List<Object> get props => [climate, isLoading, isError];

  static HomeScreenViewModel fromStore(Store<AppState> store) {
    return HomeScreenViewModel(
      climate: store.state.climateState.climate,
      isLoading: store.state.climateState.isLoading,
      isError: store.state.climateState.isError,
      fetchWeatherData: (city) =>
          store.dispatch(fetchClimatesAction(Redux.store, city)),
    );
  }
}
