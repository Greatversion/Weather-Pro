// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/models/currentModel.dart';

import '../../models/weatherDataModel.dart';

class WeatherServices {
  String apiKey = 'e3dc6dec0c454361878202402232208';
  Future<NetworkModel> getWeatherData(String cityName) async {
    print("1");
    String url =
        'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=yes';

    final response = await http.get(Uri.parse(url));
    print("2");
    if (response.statusCode == 200) {
      // Decode the JSON response
      print("3");
      final Map<String, dynamic> data = jsonDecode(response.body);
      // Map the JSON to WeatherModel
      print("4");
      return NetworkModel.fromJson(data);
    }
    print("5");
    throw Exception('Failed to load weather data');
  }


  Future<CurrentModel> fetchData() async {
    print("1");
    Position? currentUser = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("2");
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=${currentUser.latitude},${currentUser.longitude}&days=7&aqi=no&alerts=yes'));
    print("3");
    if (response.statusCode == 200) {
      print("4");
      final Map<String, dynamic> data = jsonDecode(response.body);
      print("5");
      // Map the JSON to WeatherModel
      return CurrentModel.fromJson(data);
    }
    print("6");
    throw Exception('Failed to load weather data');
  }
}
