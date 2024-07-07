import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/controller/provider/app.SearchScreenprovider.dart';
import 'package:weatherapp/controller/provider/app.weatherProvider.dart';
import 'package:weatherapp/routes/app.routeNames.dart';
import 'package:weatherapp/utils/colors.dart';
import 'package:weatherapp/utils/glassEffect.dart';

class CitySearchPage extends StatefulWidget {
  const CitySearchPage({super.key});

  @override
  _CitySearchPageState createState() => _CitySearchPageState();
}

class _CitySearchPageState extends State<CitySearchPage> {
  List<dynamic> cities = [];
  final TextEditingController _searchController = TextEditingController();
  List<String> _recentSearches = [];

  @override
  void initState() {
    super.initState();
    loadCities();
    loadRecentSearches();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    SearchScreenProvider provider =
        Provider.of<SearchScreenProvider>(context, listen: false);
    provider.filterCities(cities, _searchController.text);
  }

  Future<void> loadCities() async {
    String citiesJson = await rootBundle.loadString('assets/cities.json');
    setState(() {
      cities = json.decode(citiesJson);
    });
  }

  Future<void> loadRecentSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _recentSearches = prefs.getStringList('recentSearches') ?? [];
    });
  }

  Future<void> saveRecentSearch(String cityName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!_recentSearches.contains(cityName)) {
      _recentSearches.add(cityName);
      // Keep only the latest 5 searches
      if (_recentSearches.length > 5) {
        _recentSearches.removeAt(0);
      }
      await prefs.setStringList('recentSearches', _recentSearches);
    }
  }

  void _clearRecentSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('recentSearches');
    setState(() {
      _recentSearches = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    WeatherDataProvider weatherDataProvider =
        Provider.of<WeatherDataProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<SearchScreenProvider>(
        builder: (context, dataProvider, child) {
          return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Image.asset(
                  'assets/weathers_images/cloudy.png',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 8),
                      child: GlassMorphic(
                        height: 46,
                        width: double.infinity,
                        radius: 15,
                        widget: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            autofocus: true,
                            autocorrect: true,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Outfit",
                                fontSize: 18,
                                color: AppColors.background),
                            controller: _searchController,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter a city name',
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Outfit",
                                  fontSize: 16,
                                  color: AppColors.background),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: AppColors.background,
                              ),
                              suffixIcon: _searchController.text.isEmpty
                                  ? null
                                  : IconButton(
                                      icon: const Icon(
                                        Icons.clear,
                                        color: AppColors.background,
                                      ),
                                      onPressed: () {
                                        _searchController.clear();
                                        dataProvider.filterCities(cities, '');
                                      },
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  _recentSearches.isNotEmpty
                      ? Column(
                          children: [
                            const Text(
                              'Recents',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Outfit",
                                  fontSize: 18,
                                  color: AppColors.background),
                            ),
                            for (var city in _recentSearches.reversed)
                              ListTile(
                                title: Text(
                                  city,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Outfit",
                                      fontSize: 16,
                                      color: AppColors.background),
                                ),
                                onTap: () async {
                                  _searchController.text = city;
                                  dataProvider.filterCities(cities, city);
                                  Navigator.pushReplacementNamed(
                                      context, RoutesName.detailScreen,
                                      arguments: {'cityName': city});
                                },
                              ),
                            TextButton(
                              onPressed: _clearRecentSearches,
                              child: const Text(
                                'Clear All',
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 16,
                                  color: AppColors.background,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  Expanded(
                    child: dataProvider.filteredCities.isEmpty
                        ? const Center(
                            child: Text(''),
                          )
                        : ListView.builder(
                            itemCount: dataProvider.filteredCities.length,
                            itemBuilder: (context, int index) {
                              dynamic city = dataProvider.filteredCities[index];
                              return Card(
                                color: const Color.fromARGB(23, 128, 128, 128),
                                child: ListTile(
                                  title: Text(
                                    city['name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: AppColors.background),
                                  ),
                                  onTap: () async {
                                    FocusScope.of(context).unfocus();
                                    await saveRecentSearch(city['name']);
                                    Navigator.pushReplacementNamed(
                                        context, RoutesName.detailScreen,
                                        arguments: {'cityName': city['name']});
                                  },
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
