import 'dart:html';

import 'package:flutter/material.dart';
import 'package:weather_app/models/climate.dart';
import 'package:weather_app/presentation/home_screen_viewmodel.dart';

class HomeScreenView extends StatelessWidget {

  HomeScreenView({Key key, this.viewModel}) : super(key: key);

  final HomeScreenViewModel viewModel;

  final TextEditingController cityText = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Current Weather"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'City',
                ),
              ),

              RaisedButton(
                child: Text("Show Weather"),
                onPressed: () {
                  viewModel.fetchWeatherData(cityText.text);
                },
              ),

              viewModel.isLoading ?  CircularProgressIndicator() : SizedBox.shrink(),

              viewModel.isError ? Text("Failed to get weather data") : SizedBox.shrink(),

              _buildWeatherData(viewModel.climate)

            ],
          ),
        )
    );
  }

  Widget _buildWeatherData(Climate climate) {
    if (climate != null) {
      return Column(
        children: [
          Text(climate.name),
          Text("Temperature: ${climate.main.temp}"),
          Text("Feels Like: ${climate.main.feels_like}"),
          Text("${climate.weather[0].description}")
        ],
      );
    } else {
      return SizedBox.shrink();
    }
  }

}