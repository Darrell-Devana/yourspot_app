import 'package:flutter/material.dart';
import 'package:yourspot_app/screens/core.dart';
import 'package:yourspot_app/screens/favorite.dart';
import 'package:yourspot_app/screens/home.dart';
import 'package:yourspot_app/screens/place_detail.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CoreScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        HomeScreen.routeName: (context) =>
            HomeScreen(filteredPlaces: [], updateFilteredPlaces: (value) {}),
        FavoriteScreen.routeName: (context) => const FavoriteScreen(),
        PlaceDetail.routeName: (context) => const PlaceDetail(),
      },
    );
  }
}
