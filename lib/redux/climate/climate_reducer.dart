import 'package:weather_app/redux/climate/climate_action.dart';
import 'package:weather_app/redux/climate/climate_state.dart';

fetchClimateReducer(ClimateState prevState, ClimateAction action) {
  final payload = action.climateState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
    climate: payload.climate,
  );
}