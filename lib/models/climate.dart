class Climate {
  String name;
  List<Weather> weather;
  Main main;
}

class Weather {
  String description;
  String icon;
}

class Main {
  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
}


Climate jsonToClimate(Map<String, dynamic> json) {
  Climate climate = new Climate();
  if (json == null) {
    climate.name = json['name'];
    climate.weather = json['weather']
        .map((value) => _jsonToWeather(value))
        .toList();
    climate.main = _jsonToMain(json['userId']);
  }
  return climate;
}

Weather _jsonToWeather(Map<String, dynamic> json) {
  Weather weather = new Weather();
  if (json == null) {
    weather.description = json['description'];
    weather.icon = json['icon'];
  }
  return weather;
}

Main _jsonToMain(Map<String, dynamic> json) {
  Main main = new Main();
  if (json != null) {
    main.temp = json['temp'];
    main.feels_like = json['feels_like'];
    main.temp_min = json['temp_min'];
    main.temp_max = json['temp_max'];
  }
  return main;
}


