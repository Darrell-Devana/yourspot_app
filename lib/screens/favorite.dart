import 'package:flutter/material.dart';
import 'package:yourspot_app/models/place_card.dart';
import 'package:yourspot_app/models/place.dart';
import '../dummy_data/dummy_data.dart';

class FavoriteScreen extends StatefulWidget {
  static const String routeName = '/favorite';
  final List<Place> favoritePlaces;
  final Function(List<Place> favoriteList) updateFavoritePlaces;

  const FavoriteScreen(
      {required this.favoritePlaces, required this.updateFavoritePlaces});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Place> filteredPlaces = [];

  @override
  void initState() {
    super.initState();
    filterFavoritePlaces();
  }

  void filterFavoritePlaces() {
    filteredPlaces = dummyPlace
        .where((place) => widget.favoritePlaces.contains(place.id))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return PlaceCard(
          id: filteredPlaces[index].id,
          title: filteredPlaces[index].title,
          imageUrl: filteredPlaces[index].imageUrl,
          availability: filteredPlaces[index].availability,
        );
      },
      itemCount: filteredPlaces.length,
    );
  }
}
