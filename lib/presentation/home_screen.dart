import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:weather_app/presentation/home_screen_view.dart';
import 'package:weather_app/presentation/home_screen_viewmodel.dart';
import 'package:weather_app/redux/store.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeScreenViewModel>(
        distinct: true,
        converter: HomeScreenViewModel.fromStore,
        builder: (_, viewModel) => HomeScreenView(viewModel: viewModel));
  }
}