import 'package:flutter/material.dart';
import 'package:yourspot_app/dummy_data/dummy_data.dart';
import 'package:yourspot_app/models/place_card.dart';
import 'package:yourspot_app/models/place.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Place> filteredPlaces = [];
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    final place = dummyPlace;
    return ListView.builder(
      itemBuilder: (context, index) {
        return PlaceCard(
          id: filteredPlaces.isNotEmpty
              ? filteredPlaces[index].id
              : place[index].id,
          title: filteredPlaces.isNotEmpty
              ? filteredPlaces[index].title
              : place[index].title,
          imageUrl: filteredPlaces.isNotEmpty
              ? filteredPlaces[index].imageUrl
              : place[index].imageUrl,
          availability: filteredPlaces.isNotEmpty
              ? filteredPlaces[index].availability
              : place[index].availability,
        );
      },
      itemCount:
          filteredPlaces.isNotEmpty ? filteredPlaces.length : place.length,
    );
  }
}
