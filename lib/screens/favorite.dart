import 'package:flutter/material.dart';
import 'package:yourspot_app/dummy_data/dummy_data.dart';
import 'package:yourspot_app/models/place_card.dart';
import 'package:yourspot_app/models/place.dart';

class FavoriteScreen extends StatefulWidget {
  static const String routeName = '/favorite';
  final List<Place> filteredPlaces;
  final Function(List<Place> filteredList) updateFilteredPlaces;
  const FavoriteScreen(
      {super.key,
      required this.filteredPlaces,
      required this.updateFilteredPlaces});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
        );
      },
      itemCount:
          filteredPlaces.isNotEmpty ? filteredPlaces.length : place.length,
    );
  }
}
