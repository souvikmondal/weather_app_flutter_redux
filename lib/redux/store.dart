import 'package:weather_app/redux/climate/climate_action.dart';
import 'package:weather_app/redux/climate/climate_state.dart';
import 'package:redux/redux.dart';
import 'climate/climate_reducer.dart';
import 'package:meta/meta.dart';
import 'package:redux_thunk/redux_thunk.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is ClimateAction) {
    final nextPostsState = fetchClimateReducer(state.climateState, action);

    return state.copyWith(climateState: nextPostsState);
  }

  return state;
}

@immutable
class AppState {
  final ClimateState climateState;

  AppState({
    @required this.climateState,
  });

  AppState copyWith({
    ClimateState climateState,
  }) {
    return AppState(
      climateState: climateState ?? this.climateState,
    );
  }
}

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final climateStateInitial = ClimateState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(climateState: climateStateInitial),
    );
  }
}