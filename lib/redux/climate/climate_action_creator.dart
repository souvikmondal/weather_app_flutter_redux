import 'package:redux/redux.dart';
import 'package:weather_app/models/climate.dart';
import '../store.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'climate_action.dart';
import 'climate_state.dart';

Future<void> fetchClimatesAction(Store<AppState> store, String city) async {
  store.dispatch(ClimateAction(ClimateState(isLoading: true, isError: false)));

  try {
    final response = await http.get('http://api.openweathermap.org/data/2.5/weather?q='+city+'&appid=9c1f915599217340bb8b97ad31019648&units=imperial');
    assert(response.statusCode == 200);
    final jsonData = json.decode(response.body);
    store.dispatch(
      ClimateAction(
        ClimateState(
          isLoading: false,
          climate: jsonToClimate(jsonData)
        ),
      ),
    );
  } catch (error) {
    store.dispatch(ClimateAction(ClimateState(isLoading: false, isError: true)));
  }
}