import 'package:flutter/material.dart';
import 'package:yourspot_app/models/place_card.dart';
import 'package:yourspot_app/models/place.dart';

class FavoriteScreen extends StatefulWidget {
  static const String routeName = '/favorite';
  final List<Place> favoritePlaces;
  final Function(List<Place> favoriteList) updateFavoritePlaces;

  const FavoriteScreen(
      {super.key,
      required this.favoritePlaces,
      required this.updateFavoritePlaces});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final filteredPlaces = widget.favoritePlaces;
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
