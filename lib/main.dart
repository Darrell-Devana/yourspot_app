import 'package:flutter/material.dart';
import 'package:yourspot_app/dummy_data/dummy_data.dart';
import 'package:yourspot_app/screens/core.dart';
import 'package:yourspot_app/screens/favorite.dart';
import 'package:yourspot_app/screens/login.dart';
import 'package:yourspot_app/screens/home.dart';
import 'package:yourspot_app/screens/place_detail.dart';
import 'models/place.dart';
import 'pack';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Place> favoritePlaces = [];

  void _toggleFavorite(String placeId) {
    final existingIndex =
        favoritePlaces.indexWhere((place) => place.id == placeId);
    if (existingIndex >= 0) {
      setState(() {
        favoritePlaces.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoritePlaces.add(
          dummyPlace.firstWhere((place) => place.id == placeId),
        );
      });
    }
  }

  bool _isPlaceFavorite(String placeId) {
    return favoritePlaces.any((place) => place.id == placeId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        CoreScreen.routeName: (context) => const CoreScreen(),
        HomeScreen.routeName: (context) => HomeScreen(
            filteredPlaces: const [], updateFilteredPlaces: (value) {}),
        FavoriteScreen.routeName: (context) => FavoriteScreen(
            filteredPlaces: const [], updateFilteredPlaces: (value) {}),
        PlaceDetail.routeName: (context) => const PlaceDetail(),
      },
    );
  }
}
