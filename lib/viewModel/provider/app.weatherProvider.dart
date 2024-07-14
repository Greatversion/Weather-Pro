// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:weatherapp/models/currentModel.dart';
import 'package:weatherapp/models/weatherDataModel.dart';

import '../../services/apis/weatherApiService.dart';

class WeatherDataProvider extends ChangeNotifier {
  WeatherServices weatherServices = WeatherServices();

  NetworkModel? _weatherModel ;
  CurrentModel? _currentDataModel ;

  NetworkModel? get weatherModel => _weatherModel;
  CurrentModel? get currentDataModel => _currentDataModel;

  Future<void> getWeatherData(String cityName) async {
    try {
      print("in");
      final data = await weatherServices.getWeatherData(cityName);

      _weatherModel = data;
        notifyListeners();
      print("Out");
    } catch (e) {
      print(e.toString());
    }
  
  }

  Future<void> fetchData() async {
    try {
      print("in");
      final data = await weatherServices.fetchData();
      print("under");
      _currentDataModel = data;
       notifyListeners();
      print("out");
      // print(_currentDataModel!.toJson() );
    } catch (e) {
      print(e.toString());
    }
   
  }
}
