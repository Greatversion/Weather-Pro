import 'dart:convert';
import 'package:flutter/material.dart';


class SearchScreenProvider extends ChangeNotifier {
  // Define your properties and methods for the provider
  List<dynamic> _filteredCities = [];
  List<dynamic> get filteredCities => _filteredCities;

  void filterCities(List<dynamic> cities, String query) {
    if (query.isEmpty) {
      _filteredCities = [];
    } else {
      _filteredCities = cities.where((city) {
        return city['name'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
