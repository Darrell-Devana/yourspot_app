import 'package:flutter/material.dart';
import 'package:yourspot_app/dummy_data/dummy_data.dart';
import 'package:yourspot_app/models/place_card.dart';
import 'package:yourspot_app/models/place.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  final List<Place> filteredPlaces;
  final Function(List<Place> filteredList)? updateFilteredPlaces;

  const HomeScreen({
    super.key,
    required this.filteredPlaces,
    required this.updateFilteredPlaces,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Place> filteredPlaces = [];

  @override
  Widget build(BuildContext context) {
    final place = dummyPlace;
    final filteredPlaces =
        widget.filteredPlaces.isNotEmpty ? widget.filteredPlaces : place;

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
          updateFavoritePlaces: (List<Place> favoriteList) {},
        );
      },
      itemCount:
          filteredPlaces.isNotEmpty ? filteredPlaces.length : place.length,
    );
  }
}
